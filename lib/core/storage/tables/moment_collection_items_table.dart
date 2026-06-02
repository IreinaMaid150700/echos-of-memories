import 'package:drift/drift.dart';

import 'moment_collections_table.dart';
import 'moments_table.dart';

class MomentCollectionItems extends Table {
  TextColumn get collectionId => text().references(MomentCollections, #id, onDelete: KeyAction.cascade)();
  TextColumn get momentId => text().references(Moments, #id, onDelete: KeyAction.cascade)();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get addedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {collectionId, momentId};
}
