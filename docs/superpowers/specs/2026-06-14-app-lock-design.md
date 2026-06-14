# App Lock — Design Spec

**Date:** 2026-06-14
**Feature:** App Lock (PIN 6 số + biometric) cho moments, collections, và app-open
**Status:** Approved design, pending implementation plan

---

## 1. Mục tiêu

Cho phép user khoá:
1. **Toàn app** — bật `appLockEnabled` trong Settings → hỏi PIN khi mở app.
2. **Moment riêng lẻ** — moment có `isLocked = true` → mở detail phải nhập PIN.
3. **Collection riêng lẻ** — collection có `isLocked = true` → mở detail phải nhập PIN.

PIN gồm **6 chữ số**. Hỗ trợ mở khoá bằng **biometric** (vân tay/Face ID), PIN là fallback.

## 2. Threat model (phạm vi bảo vệ)

App lock chống **người quen cầm máy xem lén**. KHÔNG chống kẻ tấn công có quyền root/đọc file SQLite trực tiếp.

PIN chỉ là **cổng UI** — dữ liệu trong SQLite KHÔNG được mã hoá theo PIN trong scope này. Mã hoá-at-rest theo PIN là feature riêng, lớn hơn, ngoài phạm vi.

Hệ quả: KHÔNG có nút "reset PIN xoá khoá" — đó là backdoor ai cầm máy cũng bấm được.

## 3. Quyết định thiết kế (đã chốt với user)

| Vấn đề | Quyết định |
|---|---|
| Trigger mở app | Cold start **+** resume từ background sau timeout **60 giây** (hằng số, chỉnh thành setting sau) |
| Biometric | Có — `local_auth`, ưu tiên biometric, PIN là fallback |
| Collection lock | Thêm cột `isLocked` vào bảng `MomentCollections` qua Drift migration |
| Phiên mở khoá | Mở khoá 1 lần → mở **cả phiên app** (tới khi app re-lock) |
| Nhập sai PIN | Khoá tạm **tăng dần**: 5 lần sai → chờ 30s, tiếp tục sai → tăng dần. Counter persist (chống restart-bypass) |
| Forgot PIN | **Recovery code offline** (app sinh lúc setup, user tự lưu) **+** biometric. Không cần backend, không mất data |

**Local-first note:** Không backend = gỡ app là mất sạch data. Nên "quên PIN thì cài lại" không chấp nhận được. Recovery code + biometric là 2 đường khôi phục offline duy nhất không mất data.

## 4. Hiện trạng codebase (đã khảo sát)

- **Toggle `appLockEnabled` đã tồn tại** trong Settings:
  - `lib/core/storage/preferences_service.dart:34-35` — getter/setter qua SharedPreferences
  - `lib/features/settings/presentation/cubit/settings_cubit.dart:41` — `setAppLockEnabled`
  - `lib/features/settings/presentation/screens/settings_screen.dart:42` — UI toggle
  - **Chưa có bất kỳ logic PIN/lock screen nào.**
- **Moment đã có cột `isLocked`:**
  - `lib/core/storage/tables/moments_table.dart:37` — `isLocked` (bool, default false)
  - `lib/features/moment/domain/models/moment_summary.dart:20` — `isLocked`
  - `lib/features/moment/domain/models/moment_detail_entity.dart:22` — `isLocked`
  - `moment_repository_impl.dart:272` — `updateMomentFlags` (chưa có mutation cho `isLocked`)
- **Collection CHƯA có cột lock:**
  - `lib/core/storage/tables/moment_collections_table.dart:3-16` — không có cột lock
- **`flutter_secure_storage` đã có trong project** (`secure_storage_service.dart`, hiện chỉ lưu tokens).
- **`_privacy_card.dart` (create_moment)** hiện disabled, hiện "PIN chưa được thiết lập" (`:196`, `:210`).
- Stack: `auto_route`, `flutter_bloc` (Cubit) + `freezed`, `get_it` + `injectable`, `drift`.

## 5. Kiến trúc

Feature module mới `lib/features/app_lock/` theo clean-architecture chuẩn (data/domain/presentation) + mảnh `core` cho guard & lifecycle.

### Components

1. **`AppLockRepository` (domain) + `AppLockRepositoryImpl` (data)**
   - Lưu **hash PIN** (PBKDF2 hoặc SHA-256 + salt ngẫu nhiên) trong `flutter_secure_storage`. KHÔNG lưu plaintext.
   - Lưu **hash recovery code** + salt.
   - Lưu attempt counter + thời điểm hết khoá tạm (persist trong secure storage, chống restart-bypass).
   - API: `hasPin()`, `setPin(pin)`, `verifyPin(pin)`, `generateRecoveryCode()`, `verifyRecoveryCode(code)`, `getLockoutState()`, `recordFailedAttempt()`, `resetAttempts()`, `clearLock()`.

2. **`BiometricService` (core)** — bọc `local_auth`: `isAvailable()`, `authenticate()`.

3. **`LockSessionCubit` (lazySingleton, in-memory)** — trạng thái `isUnlocked` cho cả phiên. Thực thi "mở 1 lần = mở cả phiên". Reset về locked khi re-lock.

4. **`AppLifecycleObserver` (core, `WidgetsBindingObserver`)** — ghi timestamp khi `paused`; khi `resumed` nếu vượt 60s → `LockSessionCubit` về locked.

5. **`AppLockGuard` (`AutoRouteGuard`)** — chặn route:
   - App-open: `appLockEnabled && !session.isUnlocked` → đẩy `UnlockRoute` trước Home.
   - Moment/Collection detail: item `isLocked && !session.isUnlocked` → `UnlockRoute`; đúng PIN mới push detail.

6. **Presentation screens:**
   - `PinSetupScreen` — nhập 6 số → xác nhận lại → hiện recovery code (bắt lưu/xác nhận đã lưu).
   - `UnlockScreen` — 6 ô PIN, tự gọi biometric khi mở; link "Quên PIN?" → recovery flow; rung + đếm ngược khi bị khoá tạm.
   - `ChangePinScreen` — verify PIN cũ → đặt PIN mới.
   - `RecoveryScreen` — nhập recovery code → đặt PIN mới.
   - Widget dùng chung: `PinPad` (bàn phím số), `PinDots` (6 chấm).

7. **Drift migration** — thêm cột `isLocked` (bool, default false) vào `MomentCollections`; bump `schemaVersion`; `migrationStrategy` dùng `addColumn`. Cập nhật collection read model + thêm `updateLocked` ở repository.

8. **Tích hợp Settings & Create flows:**
   - Bật toggle `appLockEnabled` → chưa có PIN → mở `PinSetupScreen` trước. Tắt toggle → verify PIN.
   - `_privacy_card.dart` (create_moment): bật chọn khoá moment; chưa có PIN → điều hướng setup.

## 6. Data flow

**Mở moment khoá:** Tap card → `AppLockGuard` thấy `isLocked=true` & session locked → push `UnlockScreen` → biometric/PIN → `verifyPin()` đúng → `LockSessionCubit.unlock()` → guard cho qua → `MomentDetailScreen`.

**Mở app:** Cold start → guard thấy `appLockEnabled` & locked → `UnlockScreen` → đúng → Home.

**Resume:** `AppLifecycleObserver` thấy vượt 60s → set locked → lần navigate kế tiếp guard chặn lại.

## 7. Error handling

- Secure storage đọc lỗi → fail-safe: coi như **chưa có PIN** và **không** tự mở khoá (về setup, không bypass).
- Biometric không khả dụng / bị từ chối → im lặng fallback sang PIN.
- Nhập sai khi đang khoá tạm → chặn nhập, hiện đếm ngược.

## 8. Testing

- `AppLockRepository`: hash/verify đúng-sai; recovery code verify; escalating lockout **qua restart** (persist).
- `LockSessionCubit`: unlock/lock transitions.
- `AppLockGuard`: redirect khi locked, cho qua khi unlocked, per-item `isLocked`.
- `AppLifecycleObserver`: re-lock sau timeout, không re-lock dưới timeout.
- Drift migration: cột `isLocked` thêm đúng, default false, data cũ giữ nguyên.

## 9. Build order (cho implementation plan)

1. Drift migration + collection `isLocked` (read model + `updateLocked` repo).
2. `AppLockRepository` + secure storage (hash PIN/recovery/lockout).
3. `BiometricService` (`local_auth`).
4. `LockSessionCubit` + DI registration.
5. PIN widgets (`PinPad`, `PinDots`) + 4 screens (Setup, Unlock, ChangePin, Recovery).
6. `AppLockGuard` + `AppLifecycleObserver` + wire vào `AppRouters`.
7. Settings toggle integration + create_moment `_privacy_card` enable.
8. Tests.

## 10. Ngoài phạm vi (YAGNI)

- Mã hoá-at-rest dữ liệu theo PIN.
- Reset PIN qua tài khoản/backend (làm khi có backend; recovery code là cầu nối tạm).
- Timeout re-lock chỉnh được trong settings (hằng số 60s trước).
- Per-app auto-lock schedule, lock theo từng asset lẻ.
