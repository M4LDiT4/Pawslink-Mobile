import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/activity_type.dart';
import 'package:mobile_app_template/data/local_storage/local_storage_models.dart';

@collection
class LocalActivityLog { 
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  LocalStorageModels collection;
  
  @Enumerated(EnumType.name)
  ActivityType operation;

  int? localDocumentId;

  String? remoteDocumentId; 

  DateTime timestamp;

  String userId;


  LocalActivityLog({
    required this.collection,
    required this.operation,
    this.localDocumentId,
    this.remoteDocumentId,
    required this.timestamp,
    required this.userId,
  });
}