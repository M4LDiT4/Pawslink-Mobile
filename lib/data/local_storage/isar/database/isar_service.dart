import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/database/isar_collections.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  final Isar _isar;

  IsarService._(this._isar);

  static Future<IsarService> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = Isar.getInstance() ??
        await Isar.open(isarSchemas, directory: dir.path);
    return IsarService._(isar);
  }

  Isar get isar => _isar;
}
