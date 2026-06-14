/// One already-persisted media file ready to be written into `moment_assets`.
///
/// The create-moment asset pipeline copies the picked file into app storage and
/// probes its dimensions/size, then hands this descriptor to the repository
/// which only inserts DB rows (it does no file I/O).
class MomentAssetInput {
  /// Absolute path of the file inside app storage (already copied, persistent).
  final String path;
  final int width;
  final int height;
  final int fileSize;
  final String? mimeType;
  final int sortOrder;

  const MomentAssetInput({
    required this.path,
    required this.width,
    required this.height,
    required this.fileSize,
    required this.sortOrder,
    this.mimeType,
  });
}
