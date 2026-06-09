import 'dart:io';
import 'dart:ui' as ui;

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/repositories/moment_asset_repository.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_input.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Copies picked images into persistent app storage (image_picker returns
/// temp cache paths) and probes each file's dimensions + size so they can be
/// written into `moment_assets`.
@LazySingleton(as: MomentAssetRepository)
class MomentAssetService implements MomentAssetRepository {
  @override
  Future<Either<Failure, List<MomentAssetInput>>> persist(
    List<File> files,
  ) async {
    if (files.isEmpty) return const Right(<MomentAssetInput>[]);

    try {
      final docsDir = await getApplicationDocumentsDirectory();
      final assetsDir = Directory(p.join(docsDir.path, 'moment_assets'));
      if (!await assetsDir.exists()) {
        await assetsDir.create(recursive: true);
      }

      final result = <MomentAssetInput>[];
      for (var i = 0; i < files.length; i++) {
        final source = files[i];
        final ext = p.extension(source.path);
        final fileName = '${DateTime.now().microsecondsSinceEpoch}_$i$ext';
        final copied = await source.copy(p.join(assetsDir.path, fileName));
        final bytes = await copied.readAsBytes();

        var width = 0;
        var height = 0;
        ui.Codec? codec;
        try {
          codec = await ui.instantiateImageCodec(bytes);
          final frame = await codec.getNextFrame();
          width = frame.image.width;
          height = frame.image.height;
          frame.image.dispose();
        } catch (_) {
          // Leave dimensions at 0 if image cannot be decoded.
        } finally {
          codec?.dispose();
        }

        result.add(
          MomentAssetInput(
            path: copied.path,
            width: width,
            height: height,
            fileSize: bytes.length,
            mimeType: _mimeFromExtension(ext),
            sortOrder: i,
          ),
        );
      }
      return Right(result);
    } catch (_) {
      return const Left(
        CacheFailure(message: 'Không thể lưu ảnh. Vui lòng thử lại.'),
      );
    }
  }

  @override
  Future<void> cleanup(List<MomentAssetInput> assets) async {
    for (final asset in assets) {
      try {
        final file = File(asset.path);
        if (await file.exists()) {
          await file.delete();
        }
      } catch (_) {
        // Best-effort cleanup; the save failure remains the primary UI error.
      }
    }
  }

  String _mimeFromExtension(String ext) {
    switch (ext.toLowerCase()) {
      case '.png':
        return 'image/png';
      case '.gif':
        return 'image/gif';
      case '.webp':
        return 'image/webp';
      case '.heic':
        return 'image/heic';
      case '.jpg':
      case '.jpeg':
      default:
        return 'image/jpeg';
    }
  }
}
