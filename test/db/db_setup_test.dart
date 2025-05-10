import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:mobile_app_template/data/local_storage/database_helper.dart';
import 'package:mobile_app_template/data/local_storage/registries/dao_registry.dart';
import 'package:mobile_app_template/data/local_storage/daos/base_dao.dart';
import 'package:mobile_app_template/data/local_storage/daos/dao_map.dart';
import 'package:mobile_app_template/data/local_storage/models/model_map.dart';

void main() {
  // Enable FFI for tests
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  setUp(() async {
    await DatabaseHelper.close(); // Ensure a clean slate before each test
  });

  test('Initializes database and creates tables', () async {
    final db = await DatabaseHelper.database;
    for (var entry in modelFactories.entries) {
      final result = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='${entry.key}';"
      );
      expect(result, isNotEmpty, reason: 'Table ${entry.key} should exist');
    }
    db.close();
  });

  test('DAO Registry retrieves correct DAO type', () async {
    final db = await DatabaseHelper.database;

    for (var key in daoFactories.keys) {
      final dao = DaoRegistry.instance.getDao<BaseDao>(key);
      expect(dao, isA<BaseDao>(), reason: '$key DAO should be an instance of BaseDao');
    }
    db.close();
  });
}
