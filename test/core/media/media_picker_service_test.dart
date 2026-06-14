import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_app/core/media/data/media_picker_service.dart';
import 'package:music_app/core/media/domain/media_type.dart';

class _MockImagePicker extends Mock implements ImagePicker {}

void main() {
  setUpAll(() => registerFallbackValue(ImageSource.gallery));

  late _MockImagePicker picker;
  late MediaPickerService service;

  setUp(() {
    picker = _MockImagePicker();
    service = MediaPickerService(picker);
  });

  test('image type returns multi-image selection as files', () async {
    when(() => picker.pickMultiImage())
        .thenAnswer((_) async => [XFile('/a.jpg'), XFile('/b.jpg')]);

    final result = await service.pickMultiple(MediaType.image);

    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('expected Right'),
      (files) => expect(files.map((f) => f.path), ['/a.jpg', '/b.jpg']),
    );
  });

  test('video type returns single picked video as a one-element list', () async {
    when(() => picker.pickVideo(source: any(named: 'source')))
        .thenAnswer((_) async => XFile('/clip.mp4'));

    final result = await service.pickMultiple(MediaType.video);

    result.fold(
      (_) => fail('expected Right'),
      (files) => expect(files.map((f) => f.path), ['/clip.mp4']),
    );
  });

  test('video cancel (null) returns empty list', () async {
    when(() => picker.pickVideo(source: any(named: 'source')))
        .thenAnswer((_) async => null);

    final result = await service.pickMultiple(MediaType.video);

    result.fold(
      (_) => fail('expected Right'),
      (files) => expect(files, isEmpty),
    );
  });

  test('picker throwing returns Left failure', () async {
    when(() => picker.pickMultiImage()).thenThrow(Exception('boom'));

    final result = await service.pickMultiple(MediaType.image);

    expect(result.isLeft(), isTrue);
  });
}
