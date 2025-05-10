///@file : database_helper.dart
///@description : manages local database 
///@use : create sqlite tables
///@use : initialize data access objects

import 'package:mobile_app_template/data/local_storage/registries/dao_registry.dart';
import 'package:mobile_app_template/data/local_storage/models/model_map.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _dbName = 'template.db';
  static const _dbVersion = 1;

  static Database? _database;

  //singleton
  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    DaoRegistry.instance.initialize(_database!);
    return _database!;
  }

  //intialize database
  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  //create database tables
  static Future<void> _onCreate(Database db, int version) async {
    for (var sql in modelFactories.values) {
      await db.execute(sql);
    }
  }

  // Optional: close DB
  static Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null; // Reset to allow fresh init next time
    }
    DaoRegistry.instance.close();
  }
}
