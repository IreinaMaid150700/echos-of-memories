# Create Moment Code Review

Date: 2026-06-09
Scope: `lib/features/create_moment`

## Verdict

Code man hinh `create_moment` chua clean han.

UI duoc tach widget kha ro, co dung `BlocSelector` / `BlocBuilder` de giam rebuild va flow co Clean Architecture o muc use case/repository. Tuy nhien `CreateMomentCubit` dang om qua nhieu trach nhiem: image picker, xin quyen location, reverse geocoding, copy file, doc image metadata, build params va save orchestration. Mot so side effect/error state chua duoc UI handle day du.

## Findings

### High - Save loading set qua muon, co nguy co double-save

`saveMoment()` goi `_persistPickedImages(state.imagePicker)` truoc khi emit `saveAction.toLoading()`.

Impact:
- User double-tap nut save trong luc file I/O dang chay co the tao nhieu moment.
- Anh co the bi copy nhieu lan.
- Neu copy/doc file throw exception, loi khong di qua `Loaded.failure`.

References:
- `lib/features/create_moment/presentation/cubit/create_moment_cubit.dart:277`
- `lib/features/create_moment/presentation/cubit/create_moment_cubit.dart:305`

Recommendation:
- Emit loading ngay dau `saveMoment()`.
- Guard `if (state.saveAction.isLoading) return;`.
- Boc file persistence trong `try/catch` va map ve `saveAction.toFailure(...)`.

### High/Medium - UI yeu cau anh nhung save condition khong can anh

UI hien text `Them it nhat mot tam anh`, nhung nut save chi enable khi co note hoac tag.

Impact:
- Moment chi co anh bi chan save.
- Moment khong co anh van save duoc neu co note/tag.
- Behavior lech voi copy UI va ky vong nguoi dung.

References:
- `lib/features/create_moment/presentation/screens/widgets/_media_picker_section.dart:25`
- `lib/features/create_moment/presentation/screens/widgets/_bottom_save_cta.dart:17`

Recommendation:
- Chot requirement: moment co bat buoc anh khong.
- Neu bat buoc anh: enable khi `state.imagePicker.isNotEmpty`.
- Neu khong bat buoc anh: doi copy UI, khong ghi "it nhat mot tam anh".

### Medium - Save failure khong hien thi cho user

Cubit emit `saveAction.toFailure(...)`, nhung `BlocConsumer` cua bottom CTA chi handle success de pop man hinh.

Impact:
- Save fail thi user khong biet ly do.
- Nut quay lai enabled sau failure, nhung khong co feedback.

References:
- `lib/features/create_moment/presentation/cubit/create_moment_cubit.dart:298`
- `lib/features/create_moment/presentation/screens/widgets/_bottom_save_cta.dart:10`

Recommendation:
- Trong listener, handle `state.saveAction.isFailure`.
- Show `SnackBar` hoac dialog voi `state.saveAction.error`.

### Medium - Picker error event bi bo qua

`openImagePicker()` emit `CreateMomentDirectEnum.showDialogErrorWhenPicker`, nhung screen switch chi handle `showDialogDevelopment`.

Impact:
- Loi picker/im permission/platform exception bi im lang.
- User khong biet can thu lai hay cap quyen.

References:
- `lib/features/create_moment/presentation/cubit/create_moment_cubit.dart:140`
- `lib/features/create_moment/presentation/screens/create_moment_screen.dart:73`

Recommendation:
- Handle `showDialogErrorWhenPicker` trong listener.
- Reset one-shot direction sau khi UI consume, hoac dung timestamp/event id de tranh replay.

### Medium - Tap suggestion co the add them tag tu do ngoai y muon

Khi dang nhap tag roi tap suggestion, `TextField.onTapOutside` goi `_onFocusLost()` va add text hien tai truoc, sau do suggestion `onTap` tiep tuc add suggestion.

Impact:
- Co the them 2 tag trong mot thao tac.
- Tag user dang go do dang co the duoc add ngoai y muon.

References:
- `lib/features/create_moment/presentation/screens/widgets/_tag_input_section.dart:106`
- `lib/features/create_moment/presentation/screens/widgets/_tag_input_section.dart:176`
- `lib/features/create_moment/presentation/screens/widgets/_tag_input_section.dart:257`

Recommendation:
- Khong auto-add trong `onTapOutside`; chi add khi submit/explicit action.
- Hoac khi tap suggestion, clear input/focus theo thu tu kiem soat duoc.

### Medium - Lock moment chi la flag, UI van cho bat khi PIN chua setup

UI hien `PIN chua duoc thiet lap...`, nhung switch van cho bat va Cubit persist `isLocked=true`.

Impact:
- User co the tin moment da duoc bao ve, trong khi flow lock/PIN chua duoc enforce trong create flow.
- Risk ve privacy/security expectation.

References:
- `lib/features/create_moment/presentation/screens/widgets/_privacy_card.dart:189`
- `lib/features/create_moment/presentation/cubit/create_moment_cubit.dart:286`

Recommendation:
- Disable switch khi PIN chua setup.
- Hoac route sang setup PIN truoc khi allow `isLockMoment=true`.
- Dam bao detail/list/read flow enforce lock, khong chi luu flag.

### Low - Dead code trong tag input

Analyzer bao 2 warning unused:
- `_clearInput`
- `_ClearButton`

References:
- `lib/features/create_moment/presentation/screens/widgets/_tag_input_section.dart:115`
- `lib/features/create_moment/presentation/screens/widgets/_tag_input_section.dart:186`

Recommendation:
- Neu can nut clear thi wire vao UI.
- Neu khong dung nua thi xoa dead code.

## Clean Code Notes

### Good points

- Feature co tach layer `data`, `domain`, `presentation`.
- UI screen duoc split thanh widget con, de doc hon so voi mot file build lon.
- `BlocSelector` duoc dung o cac phan state nho nhu location, privacy toggles, images.
- Repository create moment co transaction cho DB inserts.

### Issues

- `CreateMomentCubit` bi "god cubit": vua UI state, vua platform service orchestration, vua file persistence.
- Presentation layer dang import va lam viec truc tiep voi `dart:io`, `path_provider`, `geolocator`, `geocoding`, `image_picker`.
- Nhieu hardcoded UI strings, khong theo i18n rule.
- Co raw colors trong UI (`Colors.white`, `Colors.black`, `Color(0x...)`), khong hoan toan theo design token rule.
- File persistence chay truoc repository transaction; neu DB fail, file da copy co the thanh orphan file.
- Error handling chua dong nhat: use case/repository dung `Either`, nhung file I/O trong Cubit co the throw ngoai flow.

## Suggested Refactor Direction

1. Tach image persistence ra service/usecase rieng, vi du `PersistMomentAssetsUseCase`.
2. Tach location resolution ra abstraction/domain-facing service, Cubit chi goi method va consume result.
3. Doi save flow thanh:
   - guard loading
   - validate form
   - emit loading
   - persist assets voi error mapping
   - call create moment usecase
   - handle success/failure in screen listener
4. Chot validation rule cho image/note/tag va dong bo UI copy voi logic.
5. Hoan thien one-shot UI events: picker error, save error, development dialog.

## Verification

Command run:

```powershell
fvm flutter analyze lib/features/create_moment
```

Result:

```text
2 issues found
warning - The declaration '_clearInput' isn't referenced - lib/features/create_moment/presentation/screens/widgets/_tag_input_section.dart:115:8 - unused_element
warning - The declaration '_ClearButton' isn't referenced - lib/features/create_moment/presentation/screens/widgets/_tag_input_section.dart:186:7 - unused_element
```

Note:
- `flutter analyze lib/features/create_moment` failed because `flutter` is not available in PATH.
- Analyzer was run successfully via FVM.
