///@file model_registry.dart
///@description : registry for the app's data access objects
///@description : centralized management for daos
import 'package:mobile_app_template/data/local_storage/daos/base_dao.dart';
import 'package:mobile_app_template/data/local_storage/daos/dao_map.dart';
import 'package:mobile_app_template/data/local_storage/models/model_map.dart';
import 'package:sqflite/sqflite.dart';

class DaoRegistry {
  final Map<SQLITETableName, BaseDao> _daos = {};

  DaoRegistry._();

  static final DaoRegistry _instance = DaoRegistry._();

  //singleton
  static DaoRegistry get instance => _instance;

  Database? _db;

  void initialize(Database db){
    _db??=db;
  }

  //get dao lookup
  //lazy loading of daos
  //creates a singleton dao instance if it is needed
  T getDao<T extends BaseDao>(SQLITETableName key) {
    final dao = _daos[key];

    //check if dao exists in the _daos repository
    //return if it is present and if it is of type BaseDao
    if (dao != null) {
      if (dao is T) {
        return dao;
      } else {
        throw Exception("DAO with key $key is not of expected type ${T.toString()}");
      }
    }

    //get the dao from the dao factories
    final daoConstructor = daoFactories[key];
    if (daoConstructor == null) {
      throw Exception("No factory registered for key $key");
    }

    //create a dao and insert it on the _daos repository
    final createdDao = daoConstructor(_db!);
    _daos[key] = createdDao;

    //check if the created dao is of type BaseDao
    if (createdDao is T) {
      return createdDao;
    } else {
      throw Exception("Created DAO is not of expected type ${T.toString()}");
    }
  }

  void close(){
    _db = null;
  }

}