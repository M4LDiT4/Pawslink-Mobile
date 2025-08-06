
import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/local_storage_models.dart';

@collection
class FileToDownload {
  Id id = Isar.autoIncrement;

  String fileName; //filename for the downloaded file
  String fileUrl; //url of the file to be downloaded

  @Enumerated(EnumType.name)
  LocalStorageModels collection; //which collection the file belongs to

  FileToDownload({
    required this.fileName,
    required this.fileUrl,
    required this.collection
  });
}