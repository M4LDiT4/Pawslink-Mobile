import 'dart:convert';

import 'package:mobile_app_template/data/local_storage/models/model_map.dart';

class SampleModel {
  static final String _tableName = SQLITETableName.sample.name;

  final int? id;
  final String name;
  final int age;

  const SampleModel({
    this.id,
    required this.name,
    required this.age,
  });

  static String get tableName {
    return _tableName;
  }
  static String get createString => '''
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      age INTEGER NOT NULL
    );
  ''';

  // Convert a Map to a UserModel instance (STATIC)
  static SampleModel fromMap(Map<String, dynamic> map) {
    return SampleModel(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }

  // Convert a JSON string to a UserModel instance (STATIC)
  static SampleModel fromJson(String source) {
    return fromMap(json.decode(source));
  }

  // Convert UserModel instance to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Convert UserModel instance to JSON string
  String toJson() => json.encode(toMap());

  // Return a copy with optionally overridden fields
  SampleModel copyWith({
    int? id,
    String? name,
    int? age,
  }) {
    return SampleModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
