import 'package:isar/isar.dart';

part 'image_file_mapping.g.dart';

@collection
class ImageFileMapping {
  Id id = Isar.autoIncrement;

  late String parentRemoteId;

  String? localPath; // device specific
  String? remoteLink; // cloud storage
}