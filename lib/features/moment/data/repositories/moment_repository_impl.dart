import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';
import 'package:music_app/features/moment/domain/models/create_moment_params.dart';
import 'package:music_app/features/moment/domain/models/moment_entity.dart';
import 'package:music_app/features/moment/domain/repositories/moment_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: MomentRepository)
class MomentRepositoryImpl implements MomentRepository {
  final AppDatabase _db;
  MomentRepositoryImpl(this._db);

  @override
  Future<Either<Failure, List<MomentEntity>>> getMoments() async {
    try {
      final rows = await (_db.select(_db.moments)
            ..where((t) => t.deletedAt.isNull())
            ..orderBy([(t) => OrderingTerm.desc(t.momentDate)]))
          .get();
      if (rows.isEmpty) return const Right([]);

      final momentIds = rows.map((r) => r.id).toList();
      final tagsByMoment = await _tagsForMoments(momentIds);

      final entities = rows
          .map((row) => _toEntity(row, tagsByMoment[row.id] ?? const []))
          .toList();
      return Right(entities);
    } catch (e, s) {
      log('getMoments failed', error: e, stackTrace: s);
      return const Left(CacheFailure(message: 'Không tải được danh sách khoảnh khắc'));
    }
  }

  @override
  Future<Either<Failure, MomentEntity>> getMomentById(String id) async {
    try {
      final row = await (_db.select(_db.moments)
            ..where((t) => t.id.equals(id) & t.deletedAt.isNull()))
          .getSingleOrNull();
      if (row == null) {
        return const Left(CacheFailure(message: 'Khoảnh khắc không tồn tại'));
      }
      final tags = await _tagsForMoment(row.id);
      return Right(_toEntity(row, tags));
    } catch (e, s) {
      log('getMomentById failed', error: e, stackTrace: s);
      return const Left(CacheFailure(message: 'Không tải được khoảnh khắc'));
    }
  }

  @override
  Future<Either<Failure, MomentEntity>> createMoment(CreateMomentParams params) async {
    try {
      final momentId = const Uuid().v4();
      final now = DateTime.now();
      final deviceId = await _getDeviceId();
      final resolvedTags = <TagEntity>[];

      final assetRows = [
        for (var i = 0; i < params.assets.length; i++)
          (id: const Uuid().v4(), input: params.assets[i]),
      ];
      final coverAssetId = assetRows.isNotEmpty ? assetRows.first.id : null;

      await _db.transaction(() async {
        await _db.into(_db.moments).insert(MomentsCompanion.insert(
              id: momentId,
              momentDate: params.momentDate,
              createdAt: now,
              updatedAt: now,
              deviceId: deviceId,
              title: params.title != null ? Value(params.title!) : const Value.absent(),
              note: params.note != null ? Value(params.note!) : const Value.absent(),
              isFavorite: Value(params.isFavorite),
              isHiddenFromWidget: Value(params.isHiddenFromWidget),
              isLocked: Value(params.isLocked),
              latitude: params.latitude != null
                  ? Value(params.latitude!)
                  : const Value.absent(),
              longitude: params.longitude != null
                  ? Value(params.longitude!)
                  : const Value.absent(),
              locationName: params.locationName != null
                  ? Value(params.locationName!)
                  : const Value.absent(),
              moodId: params.moodId != null
                  ? Value(params.moodId!)
                  : const Value.absent(),
              toneId: params.toneId != null
                  ? Value(params.toneId!)
                  : const Value.absent(),
              coverAssetId: coverAssetId != null
                  ? Value(coverAssetId)
                  : const Value.absent(),
            ));

        for (final asset in assetRows) {
          await _db.into(_db.momentAssets).insert(MomentAssetsCompanion.insert(
                id: asset.id,
                momentId: momentId,
                type: 'image',
                path: asset.input.path,
                width: asset.input.width,
                height: asset.input.height,
                fileSize: asset.input.fileSize,
                sortOrder: asset.input.sortOrder,
                createdAt: now,
                updatedAt: now,
                mimeType: asset.input.mimeType != null
                    ? Value(asset.input.mimeType!)
                    : const Value.absent(),
              ));
        }

        for (final tag in params.tags) {
          final normalizedName = tag.name.trim().toLowerCase().replaceAll('#', '');
          final existing = await (_db.select(_db.momentTags)
                ..where((t) => t.normalizedName.equals(normalizedName)))
              .getSingleOrNull();
          final String tagId;
          if (existing != null) {
            tagId = existing.id;
            resolvedTags.add(_tagToEntity(existing));
          } else {
            tagId = const Uuid().v4();
            await _db.into(_db.momentTags).insert(MomentTagsCompanion.insert(
                  id: tagId,
                  name: normalizedName,
                  normalizedName: normalizedName,
                  createdAt: now,
                  updatedAt: now,
                ));
            resolvedTags.add(TagEntity(
                id: tagId, name: normalizedName, normalizedName: normalizedName));
          }
          await _db.into(_db.momentTagLinks).insert(MomentTagLinksCompanion.insert(
                momentId: momentId, tagId: tagId, createdAt: now));
        }
      });

      return Right(MomentEntity(
        id: momentId,
        title: params.title,
        note: params.note,
        momentDate: params.momentDate,
        locationName: params.locationName,
        latitude: params.latitude,
        longitude: params.longitude,
        isFavorite: params.isFavorite,
        isPinned: false,
        isHiddenFromWidget: params.isHiddenFromWidget,
        isLocked: params.isLocked,
        createdAt: now,
        updatedAt: now,
        tags: resolvedTags,
      ));
    } catch (e, s) {
      log('createMoment failed', error: e, stackTrace: s);
      return const Left(CacheFailure(message: 'Không lưu được khoảnh khắc'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMoment(String id) async {
    try {
      await (_db.update(_db.moments)..where((t) => t.id.equals(id)))
          .write(MomentsCompanion(deletedAt: Value(DateTime.now())));
      return const Right(unit);
    } catch (e, s) {
      log('deleteMoment failed', error: e, stackTrace: s);
      return const Left(CacheFailure(message: 'Không xoá được khoảnh khắc'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateMomentFlags(
    String id, {
    bool? isPinned,
    bool? isHiddenFromWidget,
  }) async {
    try {
      await (_db.update(_db.moments)..where((t) => t.id.equals(id))).write(
        MomentsCompanion(
          isPinned: isPinned != null ? Value(isPinned) : const Value.absent(),
          isHiddenFromWidget:
              isHiddenFromWidget != null ? Value(isHiddenFromWidget) : const Value.absent(),
          updatedAt: Value(DateTime.now()),
        ),
      );
      return const Right(unit);
    } catch (e, s) {
      log('updateMomentFlags failed', error: e, stackTrace: s);
      return const Left(CacheFailure(message: 'Không cập nhật được khoảnh khắc'));
    }
  }

  Future<String> _getDeviceId() async {
    try {
      final existing = await (_db.select(_db.appSettings)
            ..where((t) => t.key.equals('device_id')))
          .getSingleOrNull();
      if (existing != null) return existing.value;

      final id = const Uuid().v4();
      await _db.into(_db.appSettings).insert(
            AppSettingsCompanion.insert(
                key: 'device_id', value: id, updatedAt: DateTime.now()),
            mode: InsertMode.insertOrIgnore,
          );
      // re-read: if concurrent call inserted first, get its value
      final row = await (_db.select(_db.appSettings)
            ..where((t) => t.key.equals('device_id')))
          .getSingle();
      return row.value;
    } catch (e, s) {
      log('_getDeviceId failed', error: e, stackTrace: s);
      throw CacheFailure(message: 'Không lấy được device ID');
    }
  }

  Future<List<TagEntity>> _tagsForMoment(String momentId) async {
    final rows = await (_db.select(_db.momentTagLinks)
          ..where((l) => l.momentId.equals(momentId)))
        .join([innerJoin(_db.momentTags, _db.momentTags.id.equalsExp(_db.momentTagLinks.tagId))])
        .get();
    return rows.map((row) => _tagToEntity(row.readTable(_db.momentTags))).toList();
  }

  Future<Map<String, List<TagEntity>>> _tagsForMoments(List<String> momentIds) async {
    final rows = await (_db.select(_db.momentTagLinks)
          ..where((l) => l.momentId.isIn(momentIds)))
        .join([innerJoin(_db.momentTags,
            _db.momentTags.id.equalsExp(_db.momentTagLinks.tagId))])
        .get();
    final map = <String, List<TagEntity>>{};
    for (final row in rows) {
      final link = row.readTable(_db.momentTagLinks);
      final tag = _tagToEntity(row.readTable(_db.momentTags));
      (map[link.momentId] ??= []).add(tag);
    }
    return map;
  }

  MomentEntity _toEntity(Moment moment, List<TagEntity> tags) => MomentEntity(
        id: moment.id,
        title: moment.title,
        note: moment.note,
        momentDate: moment.momentDate,
        locationName: moment.locationName,
        address: moment.address,
        city: moment.city,
        country: moment.country,
        latitude: moment.latitude,
        longitude: moment.longitude,
        isFavorite: moment.isFavorite,
        isPinned: moment.isPinned,
        isHiddenFromWidget: moment.isHiddenFromWidget,
        isLocked: moment.isLocked,
        moodId: moment.moodId,
        toneId: moment.toneId,
        createdAt: moment.createdAt,
        updatedAt: moment.updatedAt,
        tags: tags,
      );

  TagEntity _tagToEntity(MomentTag tag) => TagEntity(
        id: tag.id,
        name: tag.name,
        normalizedName: tag.normalizedName,
        colorHex: tag.colorHex,
        groupKey: tag.groupKey,
        usageCount: tag.usageCount,
      );
}
