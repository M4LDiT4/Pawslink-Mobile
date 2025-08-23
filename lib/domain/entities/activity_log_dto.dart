import 'package:mobile_app_template/core/enums/sync_status.dart';
import 'package:mobile_app_template/domain/entities/base_dto.dart';
import 'package:mobile_app_template/core/enums/database_actions.dart';
import 'package:mobile_app_template/core/enums/database_collections.dart';
import 'package:mobile_app_template/core/utils/helpers/enum_helper.dart';
import 'package:mobile_app_template/domain/models/local_activity_log.dart';


class ActivityLogDTO extends BaseDto<LocalActivityLog> {
  final DatabaseAction action;
  final DatabaseCollections targetCollection;
  final String targetObjectId;
  final String description;
  final SyncStatus syncStatus;

  ActivityLogDTO({
    required this.action,
    required this.targetCollection,
    required this.targetObjectId,
    required this.description,
    required this.syncStatus
  });
  @override 
  LocalActivityLog toLocalModel(){
    return LocalActivityLog()
      ..action = action
      ..targetCollection = targetCollection
      .. targetObjectId
      .. description = description
      ..syncStatus = syncStatus;
  }

  @override 
  Map<String, dynamic> toMap(){
    return {
      '_id': remoteId,
      'action' :action.name,
      'targetCollection' : targetCollection.name,
      'targetId': targetObjectId,
      'description': description
    };
  }

  factory ActivityLogDTO.fromLocalModel(LocalActivityLog log) {
    return ActivityLogDTO(
      action: log.action,
      targetCollection: log.targetCollection,
      targetObjectId: log.targetObjectId,
      description: log.description,
      syncStatus: log.syncStatus
    );
  }

  //update this later
  factory ActivityLogDTO.fromMap(Map<String, dynamic> map) {
    return ActivityLogDTO(
      action: TEnumHelper.enumFromString(DatabaseAction.values, map['action']),
      targetCollection: TEnumHelper.enumFromString(DatabaseCollections.values, map['targetCollection']),
      targetObjectId: map['targetId'],
      description: map['description'],
      syncStatus: map['syncStatus']
    );
  }
}
