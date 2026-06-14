import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_entity.dart';
import 'package:music_app/features/moment/domain/models/moment_detail_entity.dart';
import 'package:music_app/features/moment/domain/models/moment_summary.dart';
import 'package:music_app/features/mood_tone/domain/models/mood_entity.dart';

void main() {
  final date = DateTime(2026, 6, 11);

  test('MomentAssetEntity equality includes all fields', () {
    const a = MomentAssetEntity(
      id: '1', type: 'image', path: '/p.jpg', width: 100, height: 200, sortOrder: 0,
    );
    const b = MomentAssetEntity(
      id: '1', type: 'image', path: '/p.jpg', width: 100, height: 200, sortOrder: 0,
    );
    const c = MomentAssetEntity(
      id: '1', type: 'image', path: '/other.jpg', width: 100, height: 200, sortOrder: 0,
    );
    expect(a, b);
    expect(a == c, false);
  });

  test('MomentSummary equality reacts to mood change', () {
    const mood = MoodEntity(id: 'm1', code: 'happy', name: 'Vui', emoji: '😊', key: 'happy');
    final a = MomentSummary(id: '1', momentDate: date, mood: mood);
    final b = MomentSummary(id: '1', momentDate: date);
    expect(a == b, false);
  });

  test('MomentDetailEntity equality reacts to assets change', () {
    final a = MomentDetailEntity(id: '1', momentDate: date, createdAt: date, updatedAt: date);
    final b = MomentDetailEntity(
      id: '1', momentDate: date, createdAt: date, updatedAt: date,
      assets: const [MomentAssetEntity(id: 'a1', type: 'image', path: '/p.jpg', width: 1, height: 1, sortOrder: 0)],
    );
    expect(a == b, false);
  });
}
