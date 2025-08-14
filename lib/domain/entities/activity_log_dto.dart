import 'package:mobile_app_template/domain/entities/base_dto.dart';
import 'package:mobile_app_template/core/enums/database_actions.dart';
import 'package:mobile_app_template/core/enums/database_collections.dart';
import 'package:mobile_app_template/core/utils/helpers/enum_helper.dart';
import 'package:mobile_app_template/domain/models/local_activity_log.dart';


class ActivityLogDTO extends BaseDto<LocalActivityLog> {
  final String userId;
  final DatabaseAction action;
  final DatabaseCollections targetCollection;
  final int? localTargetId;
  final String? remoteTargetId;
  final String description;

  ActivityLogDTO({
    int? localId,
    String? remoteId,
    required this.userId,
    required this.action,
    required this.targetCollection,
    this.localTargetId,
    this.remoteTargetId,
    required this.description,
  }) : super(localId: localId, remoteId: remoteId) {
    if (localId != null && remoteId != null) {
      throw ArgumentError(
        "Remote ID and Local ID must not both be present.\n"
        "Reason: Local activity log is different from cloud activity log",
      );
    }

    if (localId != null && localTargetId == null) {
      throw ArgumentError("Local operation requires a localTargetId.");
    }

    if (remoteId != null && remoteTargetId == null) {
      throw ArgumentError("Remote operation requires a remoteTargetId.");
    }
  }

  @override 
  LocalActivityLog toLocalModel(){
    return LocalActivityLog()
      ..userId = userId
      ..action = action
      ..targetCollection = targetCollection
      .. targetId = localTargetId
      .. description = description;
  }

  @override 
  Map<String, dynamic> toMap(){
    return {
      '_id': remoteId,
      'userId': userId,
      'action' :action.name,
      'targetCollection' : targetCollection.name,
      'targetId': remoteTargetId,
      'description': description
    };
  }

  factory ActivityLogDTO.fromLocalModel(LocalActivityLog log) {
    return ActivityLogDTO(
      localId: log.id,
      userId: log.userId,
      action: log.action,
      targetCollection: log.targetCollection,
      localTargetId: log.targetId,
      description: log.description,
    );
  }

  factory ActivityLogDTO.fromMap(Map<String, dynamic> map) {
    return ActivityLogDTO(
      remoteId: map['_id'],
      userId: map['userId'],
      action: TEnumHelper.enumFromString(DatabaseAction.values, map['action']),
      targetCollection: TEnumHelper.enumFromString(DatabaseCollections.values, map['targetCollection']),
      remoteTargetId: map['targetId'],
      description: map['description'],
    );
  }

}
