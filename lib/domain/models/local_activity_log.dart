import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/database_actions.dart';
import 'package:mobile_app_template/core/enums/database_collections.dart';

// part 'activity_log.g.dart';

@collection
class LocalActivityLog {
  Id id = Isar.autoIncrement;

  late String userId;

  late DatabaseAction action;

  late DatabaseCollections targetCollection;

  late int? targetId;

  late String description;

  DateTime createdAt = DateTime.now();
}
