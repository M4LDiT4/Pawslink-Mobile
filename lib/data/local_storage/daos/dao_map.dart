///@file : dao_registry.dart
///@description : contains all dao in a map
///@note : all data access objects present in the application should be here

import 'package:mobile_app_template/data/local_storage/models/model_map.dart';
import 'package:sqflite/sqflite.dart';

import 'package:mobile_app_template/data/local_storage/daos/base_dao.dart';
import 'package:mobile_app_template/data/local_storage/daos/sample_dao.dart';

typedef DaoFactory = BaseDao Function(Database db);

///@note : use the dao name defined above as the key
final Map<SQLITETableName, DaoFactory> daoFactories = {
  SQLITETableName.sample : (db) => SampleDao(db, SQLITETableName.sample),
};




