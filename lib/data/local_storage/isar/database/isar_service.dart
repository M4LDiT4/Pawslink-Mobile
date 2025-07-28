
import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/database/isar_collections.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
   static final IsarService _instance = IsarService._internal();
   late final Future<Isar> _isarFuture;
   
   factory IsarService() => _instance;

   IsarService._internal(){
      _isarFuture = _init();
   }

   Future<Isar> _init() async{
      if(Isar.instanceNames.isNotEmpty) {
        return Isar.getInstance()!;
      }
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
         isarSchemas, 
         directory: dir.path
      );
   }

   Future<Isar> get isar async => _isarFuture;
}