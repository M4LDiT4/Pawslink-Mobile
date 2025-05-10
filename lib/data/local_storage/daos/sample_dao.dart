import 'package:mobile_app_template/data/local_storage/models/model_map.dart';

import 'base_dao.dart';
import '../models/sample_model.dart';
import 'package:sqflite/sqflite.dart';

class SampleDao extends BaseDao<SampleModel> {
  SampleDao(Database db, SQLITETableName tableName) : super(db, tableName.name);

  @override
  Future<int> insert(SampleModel model) async {
    return await db.insert(tableName, model.toMap());
  }

  @override
  Future<List<SampleModel>> getAll() async {
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps.map((map) => SampleModel.fromMap(map)).toList();
  }

  @override
  Future<int> update(SampleModel model) async {
    return await db.update(
      tableName,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    ); 
  }

  @override
  Future<int> delete(int id) async {
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
