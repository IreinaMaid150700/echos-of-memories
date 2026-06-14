import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/core/storage/preferences_service.dart';
import 'package:music_app/features/theme/data/repositories/theme_repository_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase db;
  late ThemeRepositoryImpl repo;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repo = ThemeRepositoryImpl(_FakePrefs(), db);
  });

  tearDown(() async => db.close());

  test('getAvailableThemes returns the 6 seeded themes', () async {
    final result = await repo.getAvailableThemes();
    final themes = result.getOrElse(() => []);
    expect(themes.length, 6);
    expect(themes.first.id, 'warm_sand');
  });

  test('getSelectedTheme defaults to warm_sand when none set', () async {
    final result = await repo.getSelectedTheme();
    final palette = result.fold((l) => throw StateError(l.message), (r) => r);
    expect(palette.id, 'warm_sand');
  });

  test('setSelectedTheme persists and getSelectedTheme returns it', () async {
    await repo.setSelectedTheme('ocean');
    final result = await repo.getSelectedTheme();
    final palette = result.fold((l) => throw StateError(l.message), (r) => r);
    expect(palette.id, 'ocean');
  });
}

class _FakePrefs implements PreferencesService {
  String _mode = 'system';
  @override
  String get themeMode => _mode;
  @override
  Future<void> setThemeMode(String mode) async => _mode = mode;
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
