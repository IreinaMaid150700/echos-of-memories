import 'package:drift/drift.dart';

import 'moment_tags_table.dart';
import 'moments_table.dart';

class MomentTagLinks extends Table {
  TextColumn get momentId => text().references(Moments, #id)();
  TextColumn get tagId => text().references(MomentTags, #id)();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {momentId, tagId};
}
