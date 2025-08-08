// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_animal_vaccination_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalAnimalVaccinationRecordCollection on Isar {
  IsarCollection<LocalAnimalVaccinationRecord>
      get localAnimalVaccinationRecords => this.collection();
}

const LocalAnimalVaccinationRecordSchema = CollectionSchema(
  name: r'LocalAnimalVaccinationRecord',
  id: -3957384028380286664,
  properties: {
    r'administeredBy': PropertySchema(
      id: 0,
      name: r'administeredBy',
      type: IsarType.string,
    ),
    r'batchNumber': PropertySchema(
      id: 1,
      name: r'batchNumber',
      type: IsarType.long,
    ),
    r'dateGiven': PropertySchema(
      id: 2,
      name: r'dateGiven',
      type: IsarType.dateTime,
    ),
    r'doseNumber': PropertySchema(
      id: 3,
      name: r'doseNumber',
      type: IsarType.long,
    ),
    r'expiryDate': PropertySchema(
      id: 4,
      name: r'expiryDate',
      type: IsarType.dateTime,
    ),
    r'nextDuedate': PropertySchema(
      id: 5,
      name: r'nextDuedate',
      type: IsarType.dateTime,
    ),
    r'notes': PropertySchema(
      id: 6,
      name: r'notes',
      type: IsarType.stringList,
    ),
    r'remoteAnimalId': PropertySchema(
      id: 7,
      name: r'remoteAnimalId',
      type: IsarType.string,
    ),
    r'route': PropertySchema(
      id: 8,
      name: r'route',
      type: IsarType.string,
    ),
    r'vaccineName': PropertySchema(
      id: 9,
      name: r'vaccineName',
      type: IsarType.string,
    )
  },
  estimateSize: _localAnimalVaccinationRecordEstimateSize,
  serialize: _localAnimalVaccinationRecordSerialize,
  deserialize: _localAnimalVaccinationRecordDeserialize,
  deserializeProp: _localAnimalVaccinationRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _localAnimalVaccinationRecordGetId,
  getLinks: _localAnimalVaccinationRecordGetLinks,
  attach: _localAnimalVaccinationRecordAttach,
  version: '3.1.0+1',
);

int _localAnimalVaccinationRecordEstimateSize(
  LocalAnimalVaccinationRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.administeredBy.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  {
    for (var i = 0; i < object.notes.length; i++) {
      final value = object.notes[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.remoteAnimalId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.route.length * 3;
  bytesCount += 3 + object.vaccineName.length * 3;
  return bytesCount;
}

void _localAnimalVaccinationRecordSerialize(
  LocalAnimalVaccinationRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.administeredBy);
  writer.writeLong(offsets[1], object.batchNumber);
  writer.writeDateTime(offsets[2], object.dateGiven);
  writer.writeLong(offsets[3], object.doseNumber);
  writer.writeDateTime(offsets[4], object.expiryDate);
  writer.writeDateTime(offsets[5], object.nextDuedate);
  writer.writeStringList(offsets[6], object.notes);
  writer.writeString(offsets[7], object.remoteAnimalId);
  writer.writeString(offsets[8], object.route);
  writer.writeString(offsets[9], object.vaccineName);
}

LocalAnimalVaccinationRecord _localAnimalVaccinationRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalAnimalVaccinationRecord();
  object.administeredBy = reader.readString(offsets[0]);
  object.batchNumber = reader.readLong(offsets[1]);
  object.dateGiven = reader.readDateTime(offsets[2]);
  object.doseNumber = reader.readLong(offsets[3]);
  object.expiryDate = reader.readDateTime(offsets[4]);
  object.id = id;
  object.nextDuedate = reader.readDateTimeOrNull(offsets[5]);
  object.notes = reader.readStringList(offsets[6]) ?? [];
  object.remoteAnimalId = reader.readStringOrNull(offsets[7]);
  object.route = reader.readString(offsets[8]);
  object.vaccineName = reader.readString(offsets[9]);
  return object;
}

P _localAnimalVaccinationRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localAnimalVaccinationRecordGetId(LocalAnimalVaccinationRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localAnimalVaccinationRecordGetLinks(
    LocalAnimalVaccinationRecord object) {
  return [];
}

void _localAnimalVaccinationRecordAttach(
    IsarCollection<dynamic> col, Id id, LocalAnimalVaccinationRecord object) {
  object.id = id;
}

extension LocalAnimalVaccinationRecordQueryWhereSort on QueryBuilder<
    LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord, QWhere> {
  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalAnimalVaccinationRecordQueryWhere on QueryBuilder<
    LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord, QWhereClause> {
  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterWhereClause> idBetween(
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

extension LocalAnimalVaccinationRecordQueryFilter on QueryBuilder<
    LocalAnimalVaccinationRecord,
    LocalAnimalVaccinationRecord,
    QFilterCondition> {
  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> administeredByEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'administeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> administeredByGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'administeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> administeredByLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'administeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> administeredByBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'administeredBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> administeredByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'administeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> administeredByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'administeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
          QAfterFilterCondition>
      administeredByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'administeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
          QAfterFilterCondition>
      administeredByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'administeredBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> administeredByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'administeredBy',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> administeredByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'administeredBy',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> batchNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> batchNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batchNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> batchNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batchNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> batchNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batchNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> dateGivenEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateGiven',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> dateGivenGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateGiven',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> dateGivenLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateGiven',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> dateGivenBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateGiven',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> doseNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doseNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> doseNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'doseNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> doseNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'doseNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> doseNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'doseNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> expiryDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> expiryDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> expiryDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> expiryDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> nextDuedateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nextDuedate',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> nextDuedateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nextDuedate',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> nextDuedateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextDuedate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> nextDuedateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextDuedate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> nextDuedateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextDuedate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> nextDuedateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextDuedate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesElementEqualTo(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesElementGreaterThan(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesElementLessThan(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesElementBetween(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesElementStartsWith(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesElementEndsWith(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
          QAfterFilterCondition>
      notesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
          QAfterFilterCondition>
      notesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesLengthEqualTo(int length) {
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesIsEmpty() {
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesIsNotEmpty() {
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesLengthLessThan(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesLengthGreaterThan(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> notesLengthBetween(
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

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> remoteAnimalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteAnimalId',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> remoteAnimalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteAnimalId',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> remoteAnimalIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteAnimalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> remoteAnimalIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteAnimalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> remoteAnimalIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteAnimalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> remoteAnimalIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteAnimalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> remoteAnimalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteAnimalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> remoteAnimalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteAnimalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
          QAfterFilterCondition>
      remoteAnimalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteAnimalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
          QAfterFilterCondition>
      remoteAnimalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteAnimalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> remoteAnimalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteAnimalId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> remoteAnimalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteAnimalId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> routeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> routeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> routeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> routeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'route',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> routeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> routeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
          QAfterFilterCondition>
      routeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
          QAfterFilterCondition>
      routeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'route',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> routeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'route',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> routeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'route',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> vaccineNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vaccineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> vaccineNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vaccineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> vaccineNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vaccineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> vaccineNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vaccineName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> vaccineNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vaccineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> vaccineNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vaccineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
          QAfterFilterCondition>
      vaccineNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vaccineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
          QAfterFilterCondition>
      vaccineNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vaccineName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> vaccineNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vaccineName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterFilterCondition> vaccineNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vaccineName',
        value: '',
      ));
    });
  }
}

extension LocalAnimalVaccinationRecordQueryObject on QueryBuilder<
    LocalAnimalVaccinationRecord,
    LocalAnimalVaccinationRecord,
    QFilterCondition> {}

extension LocalAnimalVaccinationRecordQueryLinks on QueryBuilder<
    LocalAnimalVaccinationRecord,
    LocalAnimalVaccinationRecord,
    QFilterCondition> {}

extension LocalAnimalVaccinationRecordQuerySortBy on QueryBuilder<
    LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord, QSortBy> {
  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByAdministeredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administeredBy', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByAdministeredByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administeredBy', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByBatchNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByBatchNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByDateGiven() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateGiven', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByDateGivenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateGiven', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByDoseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doseNumber', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByDoseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doseNumber', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByNextDuedate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextDuedate', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByNextDuedateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextDuedate', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByRemoteAnimalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByRemoteAnimalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByRoute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByRouteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByVaccineName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaccineName', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> sortByVaccineNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaccineName', Sort.desc);
    });
  }
}

extension LocalAnimalVaccinationRecordQuerySortThenBy on QueryBuilder<
    LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord, QSortThenBy> {
  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByAdministeredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administeredBy', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByAdministeredByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administeredBy', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByBatchNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByBatchNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByDateGiven() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateGiven', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByDateGivenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateGiven', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByDoseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doseNumber', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByDoseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doseNumber', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByNextDuedate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextDuedate', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByNextDuedateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextDuedate', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByRemoteAnimalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByRemoteAnimalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByRoute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByRouteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByVaccineName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaccineName', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QAfterSortBy> thenByVaccineNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaccineName', Sort.desc);
    });
  }
}

extension LocalAnimalVaccinationRecordQueryWhereDistinct on QueryBuilder<
    LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord, QDistinct> {
  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QDistinct> distinctByAdministeredBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'administeredBy',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QDistinct> distinctByBatchNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchNumber');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QDistinct> distinctByDateGiven() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateGiven');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QDistinct> distinctByDoseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'doseNumber');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QDistinct> distinctByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryDate');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QDistinct> distinctByNextDuedate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextDuedate');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QDistinct> distinctByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QDistinct> distinctByRemoteAnimalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteAnimalId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QDistinct> distinctByRoute({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'route', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, LocalAnimalVaccinationRecord,
      QDistinct> distinctByVaccineName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vaccineName', caseSensitive: caseSensitive);
    });
  }
}

extension LocalAnimalVaccinationRecordQueryProperty on QueryBuilder<
    LocalAnimalVaccinationRecord,
    LocalAnimalVaccinationRecord,
    QQueryProperty> {
  QueryBuilder<LocalAnimalVaccinationRecord, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, String, QQueryOperations>
      administeredByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'administeredBy');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, int, QQueryOperations>
      batchNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchNumber');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, DateTime, QQueryOperations>
      dateGivenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateGiven');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, int, QQueryOperations>
      doseNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'doseNumber');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, DateTime, QQueryOperations>
      expiryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryDate');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, DateTime?, QQueryOperations>
      nextDuedateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextDuedate');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, List<String>, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, String?, QQueryOperations>
      remoteAnimalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteAnimalId');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, String, QQueryOperations>
      routeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'route');
    });
  }

  QueryBuilder<LocalAnimalVaccinationRecord, String, QQueryOperations>
      vaccineNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vaccineName');
    });
  }
}
