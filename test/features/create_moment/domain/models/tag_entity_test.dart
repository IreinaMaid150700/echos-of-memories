import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';

void main() {
  group('TagEntity', () {
    group('constructor', () {
      test('creates entity with required fields', () {
        const entity = TagEntity(
          id: '1',
          name: 'music',
          normalizedName: 'music',
        );

        expect(entity.id, '1');
        expect(entity.name, 'music');
        expect(entity.normalizedName, 'music');
        expect(entity.colorHex, isNull);
        expect(entity.groupKey, isNull);
        expect(entity.usageCount, 0);
      });

      test('creates entity with all fields', () {
        const entity = TagEntity(
          id: '42',
          name: 'Pop Music',
          normalizedName: 'pop music',
          colorHex: '#FF5733',
          groupKey: 'genre',
          usageCount: 10,
        );

        expect(entity.id, '42');
        expect(entity.name, 'Pop Music');
        expect(entity.normalizedName, 'pop music');
        expect(entity.colorHex, '#FF5733');
        expect(entity.groupKey, 'genre');
        expect(entity.usageCount, 10);
      });

      test('usageCount defaults to 0 when not provided', () {
        const entity = TagEntity(
          id: 'x',
          name: 'jazz',
          normalizedName: 'jazz',
        );
        expect(entity.usageCount, 0);
      });
    });

    group('equality (Equatable)', () {
      test('two entities with identical fields are equal', () {
        const a = TagEntity(
          id: '1',
          name: 'rock',
          normalizedName: 'rock',
          colorHex: '#000',
          groupKey: 'genre',
          usageCount: 5,
        );
        const b = TagEntity(
          id: '1',
          name: 'rock',
          normalizedName: 'rock',
          colorHex: '#000',
          groupKey: 'genre',
          usageCount: 5,
        );

        expect(a, equals(b));
        expect(a.hashCode, equals(b.hashCode));
      });

      test('entities with different ids are not equal', () {
        const a = TagEntity(id: '1', name: 'rock', normalizedName: 'rock');
        const b = TagEntity(id: '2', name: 'rock', normalizedName: 'rock');

        expect(a, isNot(equals(b)));
      });

      test('entities with different names are not equal', () {
        const a = TagEntity(id: '1', name: 'rock', normalizedName: 'rock');
        const b = TagEntity(id: '1', name: 'pop', normalizedName: 'pop');

        expect(a, isNot(equals(b)));
      });

      test('entities with different usageCount are not equal', () {
        const a = TagEntity(id: '1', name: 'rock', normalizedName: 'rock', usageCount: 1);
        const b = TagEntity(id: '1', name: 'rock', normalizedName: 'rock', usageCount: 2);

        expect(a, isNot(equals(b)));
      });

      test('entities with different optional fields are not equal', () {
        const a = TagEntity(
          id: '1',
          name: 'rock',
          normalizedName: 'rock',
          colorHex: '#FFF',
        );
        const b = TagEntity(
          id: '1',
          name: 'rock',
          normalizedName: 'rock',
          colorHex: '#000',
        );

        expect(a, isNot(equals(b)));
      });

      test('entity with null colorHex differs from entity with colorHex set', () {
        const a = TagEntity(id: '1', name: 'rock', normalizedName: 'rock');
        const b = TagEntity(id: '1', name: 'rock', normalizedName: 'rock', colorHex: '#FFF');

        expect(a, isNot(equals(b)));
      });

      test('entity with null groupKey differs from entity with groupKey set', () {
        const a = TagEntity(id: '1', name: 'rock', normalizedName: 'rock');
        const b = TagEntity(id: '1', name: 'rock', normalizedName: 'rock', groupKey: 'genre');

        expect(a, isNot(equals(b)));
      });
    });

    group('props', () {
      test('props contains all six fields in correct order', () {
        const entity = TagEntity(
          id: 'abc',
          name: 'jazz',
          normalizedName: 'jazz',
          colorHex: '#123',
          groupKey: 'style',
          usageCount: 3,
        );

        expect(
          entity.props,
          equals(['abc', 'jazz', 'jazz', '#123', 'style', 3]),
        );
      });

      test('props includes null values for optional fields', () {
        const entity = TagEntity(
          id: 'abc',
          name: 'jazz',
          normalizedName: 'jazz',
        );

        expect(entity.props, equals(['abc', 'jazz', 'jazz', null, null, 0]));
      });
    });
  });
}