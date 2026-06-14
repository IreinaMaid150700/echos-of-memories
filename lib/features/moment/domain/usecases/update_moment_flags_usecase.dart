import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/moment/domain/repositories/moment_repository.dart';

@injectable
class UpdateMomentFlagsUseCase {
  final MomentRepository _repository;
  UpdateMomentFlagsUseCase(this._repository);

  Future<Either<Failure, Unit>> call(
    String id, {
    bool? isPinned,
    bool? isHiddenFromWidget,
  }) => _repository.updateMomentFlags(
    id,
    isPinned: isPinned,
    isHiddenFromWidget: isHiddenFromWidget,
  );
}
