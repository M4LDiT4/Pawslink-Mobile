// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_animal_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalAnimalModelCollection on Isar {
  IsarCollection<LocalAnimalModel> get localAnimalModels => this.collection();
}

const LocalAnimalModelSchema = CollectionSchema(
  name: r'LocalAnimalModel',
  id: 8581129412968673839,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.long,
    ),
    r'coatColor': PropertySchema(
      id: 1,
      name: r'coatColor',
      type: IsarType.stringList,
    ),
    r'imagePaths': PropertySchema(
      id: 2,
      name: r'imagePaths',
      type: IsarType.stringList,
    ),
    r'location': PropertySchema(
      id: 3,
      name: r'location',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 5,
      name: r'notes',
      type: IsarType.stringList,
    ),
    r'profileImagePath': PropertySchema(
      id: 6,
      name: r'profileImagePath',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 7,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'sex': PropertySchema(
      id: 8,
      name: r'sex',
      type: IsarType.string,
      enumMap: _LocalAnimalModelsexEnumValueMap,
    ),
    r'species': PropertySchema(
      id: 9,
      name: r'species',
      type: IsarType.string,
      enumMap: _LocalAnimalModelspeciesEnumValueMap,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.string,
      enumMap: _LocalAnimalModelstatusEnumValueMap,
    ),
    r'sterilizatonDate': PropertySchema(
      id: 11,
      name: r'sterilizatonDate',
      type: IsarType.dateTime,
    ),
    r'traitsAndPersonality': PropertySchema(
      id: 12,
      name: r'traitsAndPersonality',
      type: IsarType.stringList,
    )
  },
  estimateSize: _localAnimalModelEstimateSize,
  serialize: _localAnimalModelSerialize,
  deserialize: _localAnimalModelDeserialize,
  deserializeProp: _localAnimalModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'vaccinationHistory': LinkSchema(
      id: -5238092616886229582,
      name: r'vaccinationHistory',
      target: r'LocalAnimalVaccinationRecord',
      single: false,
    ),
    r'medicationHistory': LinkSchema(
      id: -5761438320954975361,
      name: r'medicationHistory',
      target: r'LocalAnimalMedicationRecord',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _localAnimalModelGetId,
  getLinks: _localAnimalModelGetLinks,
  attach: _localAnimalModelAttach,
  version: '3.1.0+1',
);

int _localAnimalModelEstimateSize(
  LocalAnimalModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.coatColor.length * 3;
  {
    for (var i = 0; i < object.coatColor.length; i++) {
      final value = object.coatColor[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.imagePaths.length * 3;
  {
    for (var i = 0; i < object.imagePaths.length; i++) {
      final value = object.imagePaths[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.location.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  {
    for (var i = 0; i < object.notes.length; i++) {
      final value = object.notes[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.profileImagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sex.name.length * 3;
  bytesCount += 3 + object.species.name.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.traitsAndPersonality.length * 3;
  {
    for (var i = 0; i < object.traitsAndPersonality.length; i++) {
      final value = object.traitsAndPersonality[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _localAnimalModelSerialize(
  LocalAnimalModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.age);
  writer.writeStringList(offsets[1], object.coatColor);
  writer.writeStringList(offsets[2], object.imagePaths);
  writer.writeString(offsets[3], object.location);
  writer.writeString(offsets[4], object.name);
  writer.writeStringList(offsets[5], object.notes);
  writer.writeString(offsets[6], object.profileImagePath);
  writer.writeString(offsets[7], object.remoteId);
  writer.writeString(offsets[8], object.sex.name);
  writer.writeString(offsets[9], object.species.name);
  writer.writeString(offsets[10], object.status.name);
  writer.writeDateTime(offsets[11], object.sterilizatonDate);
  writer.writeStringList(offsets[12], object.traitsAndPersonality);
}

LocalAnimalModel _localAnimalModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalAnimalModel();
  object.age = reader.readLongOrNull(offsets[0]);
  object.coatColor = reader.readStringList(offsets[1]) ?? [];
  object.id = id;
  object.imagePaths = reader.readStringList(offsets[2]) ?? [];
  object.location = reader.readString(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.notes = reader.readStringList(offsets[5]) ?? [];
  object.profileImagePath = reader.readStringOrNull(offsets[6]);
  object.remoteId = reader.readStringOrNull(offsets[7]);
  object.sex =
      _LocalAnimalModelsexValueEnumMap[reader.readStringOrNull(offsets[8])] ??
          AnimalSex.male;
  object.species = _LocalAnimalModelspeciesValueEnumMap[
          reader.readStringOrNull(offsets[9])] ??
      AnimalSpecies.dog;
  object.status = _LocalAnimalModelstatusValueEnumMap[
          reader.readStringOrNull(offsets[10])] ??
      AnimalStatus.transient;
  object.sterilizatonDate = reader.readDateTimeOrNull(offsets[11]);
  object.traitsAndPersonality = reader.readStringList(offsets[12]) ?? [];
  return object;
}

P _localAnimalModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (_LocalAnimalModelsexValueEnumMap[
              reader.readStringOrNull(offset)] ??
          AnimalSex.male) as P;
    case 9:
      return (_LocalAnimalModelspeciesValueEnumMap[
              reader.readStringOrNull(offset)] ??
          AnimalSpecies.dog) as P;
    case 10:
      return (_LocalAnimalModelstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          AnimalStatus.transient) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LocalAnimalModelsexEnumValueMap = {
  r'male': r'male',
  r'female': r'female',
  r'unknown': r'unknown',
};
const _LocalAnimalModelsexValueEnumMap = {
  r'male': AnimalSex.male,
  r'female': AnimalSex.female,
  r'unknown': AnimalSex.unknown,
};
const _LocalAnimalModelspeciesEnumValueMap = {
  r'dog': r'dog',
  r'cat': r'cat',
  r'unknown': r'unknown',
};
const _LocalAnimalModelspeciesValueEnumMap = {
  r'dog': AnimalSpecies.dog,
  r'cat': AnimalSpecies.cat,
  r'unknown': AnimalSpecies.unknown,
};
const _LocalAnimalModelstatusEnumValueMap = {
  r'transient': r'transient',
  r'rainbow_bridge': r'rainbow_bridge',
  r'adopted': r'adopted',
  r'on_campus': r'on_campus',
  r'owned': r'owned',
  r'unknown': r'unknown',
};
const _LocalAnimalModelstatusValueEnumMap = {
  r'transient': AnimalStatus.transient,
  r'rainbow_bridge': AnimalStatus.rainbow_bridge,
  r'adopted': AnimalStatus.adopted,
  r'on_campus': AnimalStatus.on_campus,
  r'owned': AnimalStatus.owned,
  r'unknown': AnimalStatus.unknown,
};

Id _localAnimalModelGetId(LocalAnimalModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localAnimalModelGetLinks(LocalAnimalModel object) {
  return [object.vaccinationHistory, object.medicationHistory];
}

void _localAnimalModelAttach(
    IsarCollection<dynamic> col, Id id, LocalAnimalModel object) {
  object.id = id;
  object.vaccinationHistory.attach(
      col,
      col.isar.collection<LocalAnimalVaccinationRecord>(),
      r'vaccinationHistory',
      id);
  object.medicationHistory.attach(
      col,
      col.isar.collection<LocalAnimalMedicationRecord>(),
      r'medicationHistory',
      id);
}

extension LocalAnimalModelQueryWhereSort
    on QueryBuilder<LocalAnimalModel, LocalAnimalModel, QWhere> {
  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalAnimalModelQueryWhere
    on QueryBuilder<LocalAnimalModel, LocalAnimalModel, QWhereClause> {
  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocalAnimalModelQueryFilter
    on QueryBuilder<LocalAnimalModel, LocalAnimalModel, QFilterCondition> {
  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      ageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      ageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      ageEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      ageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      ageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      ageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coatColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coatColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coatColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coatColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coatColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coatColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coatColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coatColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coatColor',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coatColor',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coatColor',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coatColor',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coatColor',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coatColor',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coatColor',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      coatColorLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coatColor',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePaths',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePaths',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePaths',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePaths',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagePaths',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagePaths',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagePaths',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagePaths',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagePaths',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      imagePathsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagePaths',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      locationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      locationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      locationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      locationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      locationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      notesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'profileImagePath',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'profileImagePath',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profileImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'profileImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'profileImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'profileImagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'profileImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'profileImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'profileImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'profileImagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profileImagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      profileImagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'profileImagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sexEqualTo(
    AnimalSex value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sexGreaterThan(
    AnimalSex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sexLessThan(
    AnimalSex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sexBetween(
    AnimalSex lower,
    AnimalSex upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sex',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sex',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      speciesEqualTo(
    AnimalSpecies value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      speciesGreaterThan(
    AnimalSpecies value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      speciesLessThan(
    AnimalSpecies value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      speciesBetween(
    AnimalSpecies lower,
    AnimalSpecies upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'species',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      speciesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      speciesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      speciesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      speciesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'species',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      speciesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'species',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      speciesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'species',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      statusEqualTo(
    AnimalStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      statusGreaterThan(
    AnimalStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      statusLessThan(
    AnimalStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      statusBetween(
    AnimalStatus lower,
    AnimalStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sterilizatonDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sterilizatonDate',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sterilizatonDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sterilizatonDate',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sterilizatonDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sterilizatonDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sterilizatonDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sterilizatonDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sterilizatonDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sterilizatonDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      sterilizatonDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sterilizatonDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'traitsAndPersonality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'traitsAndPersonality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'traitsAndPersonality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'traitsAndPersonality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'traitsAndPersonality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'traitsAndPersonality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'traitsAndPersonality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'traitsAndPersonality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'traitsAndPersonality',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'traitsAndPersonality',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitsAndPersonality',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitsAndPersonality',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitsAndPersonality',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitsAndPersonality',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitsAndPersonality',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      traitsAndPersonalityLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitsAndPersonality',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension LocalAnimalModelQueryObject
    on QueryBuilder<LocalAnimalModel, LocalAnimalModel, QFilterCondition> {}

extension LocalAnimalModelQueryLinks
    on QueryBuilder<LocalAnimalModel, LocalAnimalModel, QFilterCondition> {
  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      vaccinationHistory(FilterQuery<LocalAnimalVaccinationRecord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'vaccinationHistory');
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      vaccinationHistoryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'vaccinationHistory', length, true, length, true);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      vaccinationHistoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vaccinationHistory', 0, true, 0, true);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      vaccinationHistoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vaccinationHistory', 0, false, 999999, true);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      vaccinationHistoryLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vaccinationHistory', 0, true, length, include);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      vaccinationHistoryLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'vaccinationHistory', length, include, 999999, true);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      vaccinationHistoryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'vaccinationHistory', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      medicationHistory(FilterQuery<LocalAnimalMedicationRecord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'medicationHistory');
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      medicationHistoryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'medicationHistory', length, true, length, true);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      medicationHistoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'medicationHistory', 0, true, 0, true);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      medicationHistoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'medicationHistory', 0, false, 999999, true);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      medicationHistoryLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'medicationHistory', 0, true, length, include);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      medicationHistoryLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'medicationHistory', length, include, 999999, true);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
      medicationHistoryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'medicationHistory', lower, includeLower, upper, includeUpper);
    });
  }
}

extension LocalAnimalModelQuerySortBy
    on QueryBuilder<LocalAnimalModel, LocalAnimalModel, QSortBy> {
  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy> sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortByProfileImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileImagePath', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortByProfileImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileImagePath', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy> sortBySex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sex', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortBySexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sex', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortBySpecies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'species', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortBySpeciesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'species', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortBySterilizatonDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sterilizatonDate', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      sortBySterilizatonDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sterilizatonDate', Sort.desc);
    });
  }
}

extension LocalAnimalModelQuerySortThenBy
    on QueryBuilder<LocalAnimalModel, LocalAnimalModel, QSortThenBy> {
  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy> thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenByProfileImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileImagePath', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenByProfileImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileImagePath', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy> thenBySex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sex', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenBySexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sex', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenBySpecies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'species', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenBySpeciesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'species', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenBySterilizatonDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sterilizatonDate', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy>
      thenBySterilizatonDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sterilizatonDate', Sort.desc);
    });
  }
}

extension LocalAnimalModelQueryWhereDistinct
    on QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct> {
  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct> distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct>
      distinctByCoatColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coatColor');
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct>
      distinctByImagePaths() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePaths');
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct>
      distinctByLocation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct>
      distinctByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes');
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct>
      distinctByProfileImagePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profileImagePath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct> distinctBySex(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct> distinctBySpecies(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'species', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct>
      distinctBySterilizatonDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sterilizatonDate');
    });
  }

  QueryBuilder<LocalAnimalModel, LocalAnimalModel, QDistinct>
      distinctByTraitsAndPersonality() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'traitsAndPersonality');
    });
  }
}

extension LocalAnimalModelQueryProperty
    on QueryBuilder<LocalAnimalModel, LocalAnimalModel, QQueryProperty> {
  QueryBuilder<LocalAnimalModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalAnimalModel, int?, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<LocalAnimalModel, List<String>, QQueryOperations>
      coatColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coatColor');
    });
  }

  QueryBuilder<LocalAnimalModel, List<String>, QQueryOperations>
      imagePathsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePaths');
    });
  }

  QueryBuilder<LocalAnimalModel, String, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<LocalAnimalModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<LocalAnimalModel, List<String>, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<LocalAnimalModel, String?, QQueryOperations>
      profileImagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileImagePath');
    });
  }

  QueryBuilder<LocalAnimalModel, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<LocalAnimalModel, AnimalSex, QQueryOperations> sexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sex');
    });
  }

  QueryBuilder<LocalAnimalModel, AnimalSpecies, QQueryOperations>
      speciesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'species');
    });
  }

  QueryBuilder<LocalAnimalModel, AnimalStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<LocalAnimalModel, DateTime?, QQueryOperations>
      sterilizatonDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sterilizatonDate');
    });
  }

  QueryBuilder<LocalAnimalModel, List<String>, QQueryOperations>
      traitsAndPersonalityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'traitsAndPersonality');
    });
  }
}
