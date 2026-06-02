import 'package:drift/drift.dart';

import 'moments_table.dart';

class MomentAssets extends Table {
  TextColumn get id => text()();
  TextColumn get momentId => text().references(Moments, #id, onDelete: KeyAction.cascade)();
  TextColumn get type => text()();
  TextColumn get path => text()();
  TextColumn get thumbnailPath => text().nullable()();
  IntColumn get width => integer()();
  IntColumn get height => integer()();
  IntColumn get fileSize => integer()();
  IntColumn get sortOrder => integer()();
  IntColumn get durationMs => integer().nullable()();
  DateTimeColumn get capturedAt => dateTime().nullable()();
  TextColumn get mimeType => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  BoolColumn get isEncrypted => boolean().withDefault(const Constant(false))();
  IntColumn get encryptionVersion => integer().nullable()();
  TextColumn get checksum => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
