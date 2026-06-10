import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/core/storage/app_database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  group('AppDatabase', () {
    test('fresh in-memory db is seeded with basic mood and tone packs', () async {
      final moods = await db.select(db.momentMoods).get();
      final tones = await db.select(db.momentTones).get();
      expect(moods, isNotEmpty);
      expect(tones, isNotEmpty);
    });
  });
}
