/// Static definitions of the built-in "Basic" mood & tone packs.
///
/// These are seeded into the database on every open (insert-or-ignore by id),
/// so every user gets the same default packs. Values mirror the colors/labels
/// that were previously hard-coded in the create-moment UI.
library;

class SeedMood {
  final String id;
  final String code;
  final String name;
  final String emoji;
  final String key;
  final String colorHex;

  const SeedMood({
    required this.id,
    required this.code,
    required this.name,
    required this.emoji,
    required this.key,
    required this.colorHex,
  });
}

class SeedTone {
  final String id;
  final String code;
  final String name;
  final String key;
  final String lightColorHex;
  final String? darkColorHex;
  final int sortOrder;

  const SeedTone({
    required this.id,
    required this.code,
    required this.name,
    required this.key,
    required this.lightColorHex,
    this.darkColorHex,
    required this.sortOrder,
  });
}

// ── Basic Mood Pack ──────────────────────────────────────────────────────────

const String kBasicMoodPackId = 'pack_basic_mood';
const String kBasicMoodPackCode = 'basic';
const String kBasicMoodPackName = 'Cơ bản';

const List<SeedMood> kBasicMoods = [
  SeedMood(
    id: 'mood_calm',
    code: 'calm',
    name: 'Bình yên',
    emoji: '🌿',
    key: 'calm',
    colorHex: '#E6F1DF',
  ),
  SeedMood(
    id: 'mood_happy',
    code: 'happy',
    name: 'Vui vẻ',
    emoji: '😊',
    key: 'happy',
    colorHex: '#FFE2D8',
  ),
  SeedMood(
    id: 'mood_reflective',
    code: 'reflective',
    name: 'Trầm lắng',
    emoji: '🌙',
    key: 'reflective',
    colorHex: '#F4DFC7',
  ),
  SeedMood(
    id: 'mood_tired',
    code: 'tired',
    name: 'Mệt mỏi',
    emoji: '😮‍💨',
    key: 'tired',
    colorHex: '#F5E8DF',
  ),
  SeedMood(
    id: 'mood_grateful',
    code: 'grateful',
    name: 'Biết ơn',
    emoji: '✨',
    key: 'grateful',
    colorHex: '#FFF0C8',
  ),
];

// ── Basic Tone Pack ──────────────────────────────────────────────────────────

const String kBasicTonePackId = 'pack_basic_tone';
const String kBasicTonePackCode = 'basic';
const String kBasicTonePackName = 'Cơ bản';

const List<SeedTone> kBasicTones = [
  SeedTone(
    id: 'tone_golden_hour',
    code: 'golden_hour',
    name: 'Golden Hour',
    key: 'golden_hour',
    lightColorHex: '#F4C3A0',
    sortOrder: 0,
  ),
  SeedTone(
    id: 'tone_foggy_forest',
    code: 'foggy_forest',
    name: 'Foggy Forest',
    key: 'foggy_forest',
    lightColorHex: '#C8D4C0',
    sortOrder: 1,
  ),
  SeedTone(
    id: 'tone_cozy_hearth',
    code: 'cozy_hearth',
    name: 'Cozy Hearth',
    key: 'cozy_hearth',
    lightColorHex: '#D9C4B0',
    sortOrder: 2,
  ),
  SeedTone(
    id: 'tone_ocean_mist',
    code: 'ocean_mist',
    name: 'Ocean Mist',
    key: 'ocean_mist',
    lightColorHex: '#B8C8D4',
    sortOrder: 3,
  ),
  SeedTone(
    id: 'tone_dusk_sky',
    code: 'dusk_sky',
    name: 'Dusk Sky',
    key: 'dusk_sky',
    lightColorHex: '#C8B8D4',
    sortOrder: 4,
  ),
];
