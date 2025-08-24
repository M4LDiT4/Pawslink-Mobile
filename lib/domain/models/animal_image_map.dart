
import 'package:isar/isar.dart';

part 'animal_image_map.g.dart';

@collection 
class ImageLink {
  Id id = Isar.autoIncrement;
  late String animalRemoteId;
  late String? localPath;
  String? remotePath;
}