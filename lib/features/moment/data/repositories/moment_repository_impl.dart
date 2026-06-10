import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_entity.dart';
import 'package:music_app/features/moment/domain/models/moment_detail_entity.dart';
import 'package:music_app/features/moment/domain/models/moment_summary.dart';
import 'package:music_app/features/moment/domain/models/tag_entity.dart';
import 'package:music_app/features/moment/domain/models/create_moment_params.dart';
import 'package:music_app/features/moment/domain/repositories/moment_repository.dart';
import 'package:music_app/features/mood_tone/domain/models/mood_entity.dart';
import 'package:music_app/features/mood_tone/domain/models/tone_entity.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: MomentRepository)
class MomentRepositoryImpl implements MomentRepository {
  final AppDatabase _db;
  MomentRepositoryImpl(this._db);

  @override
  Stream<List<MomentSummary>> watchMomentSummaries() {
    final query = _db.select(_db.moments).join([
      leftOuterJoin(
        _db.momentMoods,
        _db.momentMoods.id.equalsExp(_db.moments.moodId),
      ),
      leftOuterJoin(
        _db.momentTones,
        _db.momentTones.id.equalsExp(_db.moments.toneId),
      ),
      leftOuterJoin(
        _db.momentAssets,
        _db.momentAssets.id.equalsExp(_db.moments.coverAssetId),
      ),
    ])
      ..where(_db.moments.deletedAt.isNull())
      ..orderBy([OrderingTerm.desc(_db.moments.momentDate)]);

    return query.watch().switchMap(
      (rows) => Stream.fromFuture(_summariesFromRows(rows)),
    );
  }

  Future<List<MomentSummary>> _summariesFromRows(List<TypedResult> rows) async {
    if (rows.isEmpty) return const [];
    final momentIds = rows.map((r) => r.readTable(_db.moments).id).toList();
    final tagsByMoment = await _tagsForMoments(momentIds);
    return rows.map((row) {
      final moment = row.readTable(_db.moments);
      final mood = row.readTableOrNull(_db.momentMoods);
      final tone = row.readTableOrNull(_db.momentTones);
      final cover = row.readTableOrNull(_db.momentAssets);
      return MomentSummary(
        id: moment.id,
        title: moment.title,
        note: moment.note,
        momentDate: moment.momentDate,
        coverAssetPath: cover?.path,
        coverThumbnailPath: cover?.thumbnailPath,
        tags: tagsByMoment[moment.id] ?? const [],
        mood: mood != null ? _moodToEntity(mood) : null,
        tone: tone != null ? _toneToEntity(tone) : null,
        isPinned: moment.isPinned,
        isFavorite: moment.isFavorite,
        isLocked: moment.isLocked,
        latitude: moment.latitude,
        longitude: moment.longitude,
      );
    }).toList();
  }

  @override
  Future<Either<Failure, MomentDetailEntity>> getMomentDetail(String id) async {
    try {
      final row = await (_db.select(_db.moments)
            ..where((t) => t.id.equals(id) & t.deletedAt.isNull()))
          .getSingleOrNull();
      if (row == null) {
        return const Left(CacheFailure(message: 'Khoảnh khắc không tồn tại'));
      }
      final tags = await _tagsForMoment(row.id);
      final assets = await _assetsForMoment(row.id);
      final mood = row.moodId != null ? await _moodById(row.moodId!) : null;
      final tone = row.toneId != null ? await _toneById(row.toneId!) : null;
      return Right(_toDetail(row, tags: tags, assets: assets, mood: mood, tone: tone));
    } catch (e, s) {
      log('getMomentDetail failed', error: e, stackTrace: s);
      return const Left(CacheFailure(message: 'Không tải được khoảnh khắc'));
    }
  }

  @override
  Future<Either<Failure, MomentDetailEntity>> createMoment(
    CreateMomentParams params,
  ) async {
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
        await _db
            .into(_db.moments)
            .insert(
              MomentsCompanion.insert(
                id: momentId,
                momentDate: params.momentDate,
                createdAt: now,
                updatedAt: now,
                deviceId: deviceId,
                title: params.title != null
                    ? Value(params.title!)
                    : const Value.absent(),
                note: params.note != null
                    ? Value(params.note!)
                    : const Value.absent(),
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
              ),
            );

        for (final asset in assetRows) {
          await _db
              .into(_db.momentAssets)
              .insert(
                MomentAssetsCompanion.insert(
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
                ),
              );
        }

        for (final tag in params.tags) {
          final displayName = tag.name.trim().replaceAll('#', '');
          final normalizedName = displayName.toLowerCase();
          final existing =
              await (_db.select(_db.momentTags)
                    ..where(
                      (t) =>
                          t.normalizedName.equals(normalizedName) &
                          t.deletedAt.isNull(),
                    ))
                  .getSingleOrNull();
          final String tagId;
          if (existing != null) {
            tagId = existing.id;
            resolvedTags.add(_tagToEntity(existing));
          } else {
            tagId = const Uuid().v4();
            await _db
                .into(_db.momentTags)
                .insert(
                  MomentTagsCompanion.insert(
                    id: tagId,
                    name: displayName,
                    normalizedName: normalizedName,
                    createdAt: now,
                    updatedAt: now,
                  ),
                );
            resolvedTags.add(
              TagEntity(
                id: tagId,
                name: displayName,
                normalizedName: normalizedName,
              ),
            );
          }
          await _db
              .into(_db.momentTagLinks)
              .insert(
                MomentTagLinksCompanion.insert(
                  momentId: momentId,
                  tagId: tagId,
                  createdAt: now,
                ),
              );
        }
      });

      final mood = params.moodId != null ? await _moodById(params.moodId!) : null;
      final tone = params.toneId != null ? await _toneById(params.toneId!) : null;
      final builtAssets = assetRows.map((asset) => MomentAssetEntity(
        id: asset.id,
        type: 'image',
        path: asset.input.path,
        width: asset.input.width,
        height: asset.input.height,
        sortOrder: asset.input.sortOrder,
        mimeType: asset.input.mimeType,
      )).toList();

      return Right(MomentDetailEntity(
        id: momentId,
        title: params.title,
        note: params.note,
        momentDate: params.momentDate,
        locationName: params.locationName,
        latitude: params.latitude,
        longitude: params.longitude,
        isFavorite: params.isFavorite,
        isHiddenFromWidget: params.isHiddenFromWidget,
        isLocked: params.isLocked,
        mood: mood,
        tone: tone,
        createdAt: now,
        updatedAt: now,
        assets: builtAssets,
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
      await (_db.update(_db.moments)..where((t) => t.id.equals(id))).write(
        MomentsCompanion(deletedAt: Value(DateTime.now())),
      );
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
          isHiddenFromWidget: isHiddenFromWidget != null
              ? Value(isHiddenFromWidget)
              : const Value.absent(),
          updatedAt: Value(DateTime.now()),
        ),
      );
      return const Right(unit);
    } catch (e, s) {
      log('updateMomentFlags failed', error: e, stackTrace: s);
      return const Left(
        CacheFailure(message: 'Không cập nhật được khoảnh khắc'),
      );
    }
  }

  Future<String> _getDeviceId() async {
    try {
      final existing = await (_db.select(
        _db.appSettings,
      )..where((t) => t.key.equals('device_id'))).getSingleOrNull();
      if (existing != null) return existing.value;

      final id = const Uuid().v4();
      await _db
          .into(_db.appSettings)
          .insert(
            AppSettingsCompanion.insert(
              key: 'device_id',
              value: id,
              updatedAt: DateTime.now(),
            ),
            mode: InsertMode.insertOrIgnore,
          );
      final row = await (_db.select(
        _db.appSettings,
      )..where((t) => t.key.equals('device_id'))).getSingle();
      return row.value;
    } catch (e, s) {
      log('_getDeviceId failed', error: e, stackTrace: s);
      throw CacheFailure(message: 'Không lấy được device ID');
    }
  }

  Future<List<TagEntity>> _tagsForMoment(String momentId) async {
    final links = await (_db.select(_db.momentTagLinks)
          ..where((l) => l.momentId.equals(momentId)))
        .get();
    if (links.isEmpty) return [];
    final tagIds = links.map((l) => l.tagId).toList();
    final tags = await (_db.select(_db.momentTags)
          ..where((t) => t.id.isIn(tagIds) & t.deletedAt.isNull()))
        .get();
    return tags.map(_tagToEntity).toList();
  }

  Future<Map<String, List<TagEntity>>> _tagsForMoments(
    List<String> momentIds,
  ) async {
    if (momentIds.isEmpty) return {};
    final links = await (_db.select(_db.momentTagLinks)
          ..where((l) => l.momentId.isIn(momentIds)))
        .get();
    if (links.isEmpty) return {};
    final tagIds = links.map((l) => l.tagId).toSet().toList();
    final tags = await (_db.select(_db.momentTags)
          ..where((t) => t.id.isIn(tagIds) & t.deletedAt.isNull()))
        .get();
    final tagMap = {for (final t in tags) t.id: _tagToEntity(t)};
    final result = <String, List<TagEntity>>{};
    for (final link in links) {
      final entity = tagMap[link.tagId];
      if (entity != null) {
        result.putIfAbsent(link.momentId, () => []).add(entity);
      }
    }
    return result;
  }

  Future<List<MomentAssetEntity>> _assetsForMoment(String momentId) async {
    final rows = await (_db.select(_db.momentAssets)
          ..where((a) => a.momentId.equals(momentId) & a.deletedAt.isNull())
          ..orderBy([(a) => OrderingTerm.asc(a.sortOrder)]))
        .get();
    return rows.map((a) => MomentAssetEntity(
      id: a.id,
      type: a.type,
      path: a.path,
      thumbnailPath: a.thumbnailPath,
      width: a.width,
      height: a.height,
      sortOrder: a.sortOrder,
      durationMs: a.durationMs,
      mimeType: a.mimeType,
    )).toList();
  }

  Future<MoodEntity?> _moodById(String id) async {
    final row = await (_db.select(_db.momentMoods)
          ..where((m) => m.id.equals(id)))
        .getSingleOrNull();
    return row != null ? _moodToEntity(row) : null;
  }

  Future<ToneEntity?> _toneById(String id) async {
    final row = await (_db.select(_db.momentTones)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row != null ? _toneToEntity(row) : null;
  }

  MoodEntity _moodToEntity(MomentMood m) => MoodEntity(
    id: m.id,
    code: m.code,
    name: m.name,
    emoji: m.emoji,
    key: m.key,
    colorHex: m.colorHex,
  );

  ToneEntity _toneToEntity(MomentTone t) => ToneEntity(
    id: t.id,
    code: t.code,
    name: t.name,
    key: t.key,
    lightColorHex: t.lightColorHex,
    darkColorHex: t.darkColorHex,
    sortOrder: t.sortOrder,
  );

  MomentDetailEntity _toDetail(
    Moment moment, {
    required List<TagEntity> tags,
    required List<MomentAssetEntity> assets,
    MoodEntity? mood,
    ToneEntity? tone,
  }) => MomentDetailEntity(
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
    mood: mood,
    tone: tone,
    createdAt: moment.createdAt,
    updatedAt: moment.updatedAt,
    assets: assets,
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
