// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_animal_medication_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalAnimalMedicationRecordCollection on Isar {
  IsarCollection<LocalAnimalMedicationRecord>
      get localAnimalMedicationRecords => this.collection();
}

const LocalAnimalMedicationRecordSchema = CollectionSchema(
  name: r'LocalAnimalMedicationRecord',
  id: -8581976793897382670,
  properties: {
    r'dateGiven': PropertySchema(
      id: 0,
      name: r'dateGiven',
      type: IsarType.dateTime,
    ),
    r'dosage': PropertySchema(
      id: 1,
      name: r'dosage',
      type: IsarType.string,
    ),
    r'durationInDays': PropertySchema(
      id: 2,
      name: r'durationInDays',
      type: IsarType.long,
    ),
    r'medicationName': PropertySchema(
      id: 3,
      name: r'medicationName',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 4,
      name: r'notes',
      type: IsarType.stringList,
    ),
    r'prescribedBy': PropertySchema(
      id: 5,
      name: r'prescribedBy',
      type: IsarType.string,
    ),
    r'reason': PropertySchema(
      id: 6,
      name: r'reason',
      type: IsarType.string,
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
    )
  },
  estimateSize: _localAnimalMedicationRecordEstimateSize,
  serialize: _localAnimalMedicationRecordSerialize,
  deserialize: _localAnimalMedicationRecordDeserialize,
  deserializeProp: _localAnimalMedicationRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _localAnimalMedicationRecordGetId,
  getLinks: _localAnimalMedicationRecordGetLinks,
  attach: _localAnimalMedicationRecordAttach,
  version: '3.1.0+1',
);

int _localAnimalMedicationRecordEstimateSize(
  LocalAnimalMedicationRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dosage.length * 3;
  bytesCount += 3 + object.medicationName.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  {
    for (var i = 0; i < object.notes.length; i++) {
      final value = object.notes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.prescribedBy.length * 3;
  bytesCount += 3 + object.reason.length * 3;
  {
    final value = object.remoteAnimalId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.route.length * 3;
  return bytesCount;
}

void _localAnimalMedicationRecordSerialize(
  LocalAnimalMedicationRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateGiven);
  writer.writeString(offsets[1], object.dosage);
  writer.writeLong(offsets[2], object.durationInDays);
  writer.writeString(offsets[3], object.medicationName);
  writer.writeStringList(offsets[4], object.notes);
  writer.writeString(offsets[5], object.prescribedBy);
  writer.writeString(offsets[6], object.reason);
  writer.writeString(offsets[7], object.remoteAnimalId);
  writer.writeString(offsets[8], object.route);
}

LocalAnimalMedicationRecord _localAnimalMedicationRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalAnimalMedicationRecord();
  object.dateGiven = reader.readDateTime(offsets[0]);
  object.dosage = reader.readString(offsets[1]);
  object.durationInDays = reader.readLong(offsets[2]);
  object.id = id;
  object.medicationName = reader.readString(offsets[3]);
  object.notes = reader.readStringList(offsets[4]) ?? [];
  object.prescribedBy = reader.readString(offsets[5]);
  object.reason = reader.readString(offsets[6]);
  object.remoteAnimalId = reader.readStringOrNull(offsets[7]);
  object.route = reader.readString(offsets[8]);
  return object;
}

P _localAnimalMedicationRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localAnimalMedicationRecordGetId(LocalAnimalMedicationRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localAnimalMedicationRecordGetLinks(
    LocalAnimalMedicationRecord object) {
  return [];
}

void _localAnimalMedicationRecordAttach(
    IsarCollection<dynamic> col, Id id, LocalAnimalMedicationRecord object) {
  object.id = id;
}

extension LocalAnimalMedicationRecordQueryWhereSort on QueryBuilder<
    LocalAnimalMedicationRecord, LocalAnimalMedicationRecord, QWhere> {
  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalAnimalMedicationRecordQueryWhere on QueryBuilder<
    LocalAnimalMedicationRecord, LocalAnimalMedicationRecord, QWhereClause> {
  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

extension LocalAnimalMedicationRecordQueryFilter on QueryBuilder<
    LocalAnimalMedicationRecord,
    LocalAnimalMedicationRecord,
    QFilterCondition> {
  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> dateGivenEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateGiven',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> dosageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> dosageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> dosageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> dosageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> dosageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> dosageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
          QAfterFilterCondition>
      dosageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
          QAfterFilterCondition>
      dosageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dosage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> dosageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosage',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> dosageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dosage',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> durationInDaysEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationInDays',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> durationInDaysGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationInDays',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> durationInDaysLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationInDays',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> durationInDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationInDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> medicationNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> medicationNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> medicationNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> medicationNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medicationName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> medicationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> medicationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
          QAfterFilterCondition>
      medicationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
          QAfterFilterCondition>
      medicationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medicationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> medicationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicationName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> medicationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medicationName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> notesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> notesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> prescribedByEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prescribedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> prescribedByGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prescribedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> prescribedByLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prescribedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> prescribedByBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prescribedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> prescribedByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prescribedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> prescribedByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prescribedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
          QAfterFilterCondition>
      prescribedByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prescribedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
          QAfterFilterCondition>
      prescribedByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prescribedBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> prescribedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prescribedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> prescribedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prescribedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> reasonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> reasonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> reasonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> reasonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> reasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> reasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
          QAfterFilterCondition>
      reasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
          QAfterFilterCondition>
      reasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> reasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reason',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> reasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reason',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> remoteAnimalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteAnimalId',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> remoteAnimalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteAnimalId',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> remoteAnimalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteAnimalId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> remoteAnimalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteAnimalId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
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

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> routeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'route',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterFilterCondition> routeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'route',
        value: '',
      ));
    });
  }
}

extension LocalAnimalMedicationRecordQueryObject on QueryBuilder<
    LocalAnimalMedicationRecord,
    LocalAnimalMedicationRecord,
    QFilterCondition> {}

extension LocalAnimalMedicationRecordQueryLinks on QueryBuilder<
    LocalAnimalMedicationRecord,
    LocalAnimalMedicationRecord,
    QFilterCondition> {}

extension LocalAnimalMedicationRecordQuerySortBy on QueryBuilder<
    LocalAnimalMedicationRecord, LocalAnimalMedicationRecord, QSortBy> {
  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByDateGiven() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateGiven', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByDateGivenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateGiven', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByDurationInDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInDays', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByDurationInDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInDays', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByMedicationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationName', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByMedicationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationName', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByPrescribedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prescribedBy', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByPrescribedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prescribedBy', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByRemoteAnimalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByRemoteAnimalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByRoute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> sortByRouteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.desc);
    });
  }
}

extension LocalAnimalMedicationRecordQuerySortThenBy on QueryBuilder<
    LocalAnimalMedicationRecord, LocalAnimalMedicationRecord, QSortThenBy> {
  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByDateGiven() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateGiven', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByDateGivenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateGiven', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByDurationInDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInDays', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByDurationInDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInDays', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByMedicationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationName', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByMedicationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationName', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByPrescribedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prescribedBy', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByPrescribedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prescribedBy', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByRemoteAnimalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByRemoteAnimalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.desc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByRoute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.asc);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QAfterSortBy> thenByRouteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.desc);
    });
  }
}

extension LocalAnimalMedicationRecordQueryWhereDistinct on QueryBuilder<
    LocalAnimalMedicationRecord, LocalAnimalMedicationRecord, QDistinct> {
  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QDistinct> distinctByDateGiven() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateGiven');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QDistinct> distinctByDosage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QDistinct> distinctByDurationInDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationInDays');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QDistinct> distinctByMedicationName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medicationName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QDistinct> distinctByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QDistinct> distinctByPrescribedBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prescribedBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QDistinct> distinctByReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reason', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QDistinct> distinctByRemoteAnimalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteAnimalId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, LocalAnimalMedicationRecord,
      QDistinct> distinctByRoute({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'route', caseSensitive: caseSensitive);
    });
  }
}

extension LocalAnimalMedicationRecordQueryProperty on QueryBuilder<
    LocalAnimalMedicationRecord, LocalAnimalMedicationRecord, QQueryProperty> {
  QueryBuilder<LocalAnimalMedicationRecord, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, DateTime, QQueryOperations>
      dateGivenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateGiven');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, String, QQueryOperations>
      dosageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosage');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, int, QQueryOperations>
      durationInDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationInDays');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, String, QQueryOperations>
      medicationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicationName');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, List<String>, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, String, QQueryOperations>
      prescribedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prescribedBy');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, String, QQueryOperations>
      reasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reason');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, String?, QQueryOperations>
      remoteAnimalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteAnimalId');
    });
  }

  QueryBuilder<LocalAnimalMedicationRecord, String, QQueryOperations>
      routeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'route');
    });
  }
}
