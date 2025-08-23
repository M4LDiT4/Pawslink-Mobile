import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/database_actions.dart';
import 'package:mobile_app_template/core/enums/database_collections.dart';
import 'package:mobile_app_template/domain/models/time_stamp.dart';

part 'local_activity_log.g.dart';

@collection
class LocalActivityLog with Timestamped {
  Id id = Isar.autoIncrement;

  late String userId;

  @Enumerated(EnumType.name)
  late DatabaseAction action;
  @Enumerated(EnumType.name)
  late DatabaseCollections targetCollection;

  late int? targetId;

  late String description;

}
