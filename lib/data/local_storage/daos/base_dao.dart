///@file : base_dao.dart
///@description : a parent object for the app's dao
///@note : all daos must have implementation for the defined methods


import 'package:sqflite/sqflite.dart';

abstract class BaseDao<T> {
  final String tableName;
  final Database db;

  BaseDao(this.db, this.tableName);

  // Insert a new model into the database
  Future<int> insert(T model);

  // Get all models from the database
  Future<List<T>> getAll();

  // Update an existing model
  Future<int> update(T model);

  // Delete a model by ID
  Future<int> delete(int id);
}
