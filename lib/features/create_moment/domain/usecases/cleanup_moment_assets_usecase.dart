import 'package:injectable/injectable.dart';
import 'package:music_app/features/create_moment/domain/repositories/moment_asset_repository.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_input.dart';

@injectable
class CleanupMomentAssetsUseCase {
  final MomentAssetRepository _repository;

  CleanupMomentAssetsUseCase(this._repository);

  Future<void> call(List<MomentAssetInput> assets) =>
      _repository.cleanup(assets);
}
