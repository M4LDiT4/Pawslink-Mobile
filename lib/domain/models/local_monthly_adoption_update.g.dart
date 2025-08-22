// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_monthly_adoption_update.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalMonthlyAdoptionUpdateCollection on Isar {
  IsarCollection<LocalMonthlyAdoptionUpdate> get localMonthlyAdoptionUpdates =>
      this.collection();
}

const LocalMonthlyAdoptionUpdateSchema = CollectionSchema(
  name: r'LocalMonthlyAdoptionUpdate',
  id: -5871781970474467385,
  properties: {
    r'adoptionId': PropertySchema(
      id: 0,
      name: r'adoptionId',
      type: IsarType.string,
    ),
    r'behaviorNotes': PropertySchema(
      id: 1,
      name: r'behaviorNotes',
      type: IsarType.stringList,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'healthStatus': PropertySchema(
      id: 3,
      name: r'healthStatus',
      type: IsarType.string,
      enumMap: _LocalMonthlyAdoptionUpdatehealthStatusEnumValueMap,
    ),
    r'localImagePaths': PropertySchema(
      id: 4,
      name: r'localImagePaths',
      type: IsarType.stringList,
    ),
    r'month': PropertySchema(
      id: 5,
      name: r'month',
      type: IsarType.dateTime,
    ),
    r'remarks': PropertySchema(
      id: 6,
      name: r'remarks',
      type: IsarType.stringList,
    ),
    r'remoteId': PropertySchema(
      id: 7,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'remoteImageUrls': PropertySchema(
      id: 8,
      name: r'remoteImageUrls',
      type: IsarType.stringList,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _localMonthlyAdoptionUpdateEstimateSize,
  serialize: _localMonthlyAdoptionUpdateSerialize,
  deserialize: _localMonthlyAdoptionUpdateDeserialize,
  deserializeProp: _localMonthlyAdoptionUpdateDeserializeProp,
  idName: r'id',
  indexes: {
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'updatedAt': IndexSchema(
      id: -6238191080293565125,
      name: r'updatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'updatedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'medicationUpdates': LinkSchema(
      id: -7767217694513957913,
      name: r'medicationUpdates',
      target: r'LocalAnimalMedicationRecord',
      single: false,
    ),
    r'vaccinationUpdates': LinkSchema(
      id: -5297674693862129200,
      name: r'vaccinationUpdates',
      target: r'LocalAnimalVaccinationRecord',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _localMonthlyAdoptionUpdateGetId,
  getLinks: _localMonthlyAdoptionUpdateGetLinks,
  attach: _localMonthlyAdoptionUpdateAttach,
  version: '3.1.0+1',
);

int _localMonthlyAdoptionUpdateEstimateSize(
  LocalMonthlyAdoptionUpdate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.adoptionId.length * 3;
  bytesCount += 3 + object.behaviorNotes.length * 3;
  {
    for (var i = 0; i < object.behaviorNotes.length; i++) {
      final value = object.behaviorNotes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.healthStatus.name.length * 3;
  bytesCount += 3 + object.localImagePaths.length * 3;
  {
    for (var i = 0; i < object.localImagePaths.length; i++) {
      final value = object.localImagePaths[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.remarks.length * 3;
  {
    for (var i = 0; i < object.remarks.length; i++) {
      final value = object.remarks[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.remoteImageUrls.length * 3;
  {
    for (var i = 0; i < object.remoteImageUrls.length; i++) {
      final value = object.remoteImageUrls[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _localMonthlyAdoptionUpdateSerialize(
  LocalMonthlyAdoptionUpdate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.adoptionId);
  writer.writeStringList(offsets[1], object.behaviorNotes);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.healthStatus.name);
  writer.writeStringList(offsets[4], object.localImagePaths);
  writer.writeDateTime(offsets[5], object.month);
  writer.writeStringList(offsets[6], object.remarks);
  writer.writeString(offsets[7], object.remoteId);
  writer.writeStringList(offsets[8], object.remoteImageUrls);
  writer.writeDateTime(offsets[9], object.updatedAt);
}

LocalMonthlyAdoptionUpdate _localMonthlyAdoptionUpdateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalMonthlyAdoptionUpdate();
  object.adoptionId = reader.readString(offsets[0]);
  object.behaviorNotes = reader.readStringList(offsets[1]) ?? [];
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.healthStatus = _LocalMonthlyAdoptionUpdatehealthStatusValueEnumMap[
          reader.readStringOrNull(offsets[3])] ??
      AnimalHealthStatus.healthy;
  object.id = id;
  object.localImagePaths = reader.readStringList(offsets[4]) ?? [];
  object.month = reader.readDateTime(offsets[5]);
  object.remarks = reader.readStringList(offsets[6]) ?? [];
  object.remoteId = reader.readStringOrNull(offsets[7]);
  object.remoteImageUrls = reader.readStringList(offsets[8]) ?? [];
  object.updatedAt = reader.readDateTimeOrNull(offsets[9]);
  return object;
}

P _localMonthlyAdoptionUpdateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (_LocalMonthlyAdoptionUpdatehealthStatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          AnimalHealthStatus.healthy) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LocalMonthlyAdoptionUpdatehealthStatusEnumValueMap = {
  r'healthy': r'healthy',
  r'minorIssues': r'minorIssues',
  r'sick': r'sick',
  r'critical': r'critical',
  r'recovering': r'recovering',
  r'deceased': r'deceased',
};
const _LocalMonthlyAdoptionUpdatehealthStatusValueEnumMap = {
  r'healthy': AnimalHealthStatus.healthy,
  r'minorIssues': AnimalHealthStatus.minorIssues,
  r'sick': AnimalHealthStatus.sick,
  r'critical': AnimalHealthStatus.critical,
  r'recovering': AnimalHealthStatus.recovering,
  r'deceased': AnimalHealthStatus.deceased,
};

Id _localMonthlyAdoptionUpdateGetId(LocalMonthlyAdoptionUpdate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localMonthlyAdoptionUpdateGetLinks(
    LocalMonthlyAdoptionUpdate object) {
  return [object.medicationUpdates, object.vaccinationUpdates];
}

void _localMonthlyAdoptionUpdateAttach(
    IsarCollection<dynamic> col, Id id, LocalMonthlyAdoptionUpdate object) {
  object.id = id;
  object.medicationUpdates.attach(
      col,
      col.isar.collection<LocalAnimalMedicationRecord>(),
      r'medicationUpdates',
      id);
  object.vaccinationUpdates.attach(
      col,
      col.isar.collection<LocalAnimalVaccinationRecord>(),
      r'vaccinationUpdates',
      id);
}

extension LocalMonthlyAdoptionUpdateQueryWhereSort on QueryBuilder<
    LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate, QWhere> {
  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhere> anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }
}

extension LocalMonthlyAdoptionUpdateQueryWhere on QueryBuilder<
    LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate, QWhereClause> {
  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
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

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
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

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> createdAtEqualTo(DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> createdAtNotEqualTo(DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> createdAtGreaterThan(
    DateTime? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> createdAtLessThan(
    DateTime? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> createdAtBetween(
    DateTime? lowerCreatedAt,
    DateTime? upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> updatedAtEqualTo(DateTime? updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [updatedAt],
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> updatedAtNotEqualTo(DateTime? updatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> updatedAtGreaterThan(
    DateTime? updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [updatedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> updatedAtLessThan(
    DateTime? updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [],
        upper: [updatedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterWhereClause> updatedAtBetween(
    DateTime? lowerUpdatedAt,
    DateTime? upperUpdatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [lowerUpdatedAt],
        includeLower: includeLower,
        upper: [upperUpdatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocalMonthlyAdoptionUpdateQueryFilter on QueryBuilder<
    LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate, QFilterCondition> {
  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> adoptionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adoptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> adoptionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adoptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> adoptionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adoptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> adoptionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adoptionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> adoptionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'adoptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> adoptionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'adoptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      adoptionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'adoptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      adoptionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'adoptionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> adoptionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adoptionId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> adoptionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'adoptionId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'behaviorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'behaviorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'behaviorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'behaviorNotes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'behaviorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'behaviorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      behaviorNotesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'behaviorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      behaviorNotesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'behaviorNotes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'behaviorNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'behaviorNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'behaviorNotes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'behaviorNotes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'behaviorNotes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'behaviorNotes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'behaviorNotes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> behaviorNotesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'behaviorNotes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> healthStatusEqualTo(
    AnimalHealthStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'healthStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> healthStatusGreaterThan(
    AnimalHealthStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'healthStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> healthStatusLessThan(
    AnimalHealthStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'healthStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> healthStatusBetween(
    AnimalHealthStatus lower,
    AnimalHealthStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'healthStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> healthStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'healthStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> healthStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'healthStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      healthStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'healthStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      healthStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'healthStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> healthStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'healthStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> healthStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'healthStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
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

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
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

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
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

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localImagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localImagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localImagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localImagePaths',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localImagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localImagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      localImagePathsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localImagePaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      localImagePathsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localImagePaths',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localImagePaths',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localImagePaths',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localImagePaths',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localImagePaths',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localImagePaths',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localImagePaths',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localImagePaths',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> localImagePathsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localImagePaths',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> monthEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> monthGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> monthLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> monthBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remarks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      remarksElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      remarksElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remarks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remarks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remarks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remarks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remarks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remarks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remarksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remarks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteIdEqualTo(
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

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteIdGreaterThan(
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

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteIdLessThan(
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

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteIdBetween(
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

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteIdStartsWith(
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

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteIdEndsWith(
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

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteImageUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteImageUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteImageUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteImageUrls',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteImageUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteImageUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      remoteImageUrlsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteImageUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      remoteImageUrlsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteImageUrls',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteImageUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteImageUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remoteImageUrls',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remoteImageUrls',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remoteImageUrls',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remoteImageUrls',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remoteImageUrls',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> remoteImageUrlsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'remoteImageUrls',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocalMonthlyAdoptionUpdateQueryObject on QueryBuilder<
    LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate, QFilterCondition> {}

extension LocalMonthlyAdoptionUpdateQueryLinks on QueryBuilder<
    LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate, QFilterCondition> {
  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      medicationUpdates(FilterQuery<LocalAnimalMedicationRecord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'medicationUpdates');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> medicationUpdatesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'medicationUpdates', length, true, length, true);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> medicationUpdatesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'medicationUpdates', 0, true, 0, true);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> medicationUpdatesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'medicationUpdates', 0, false, 999999, true);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> medicationUpdatesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'medicationUpdates', 0, true, length, include);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> medicationUpdatesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'medicationUpdates', length, include, 999999, true);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> medicationUpdatesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'medicationUpdates', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
          QAfterFilterCondition>
      vaccinationUpdates(FilterQuery<LocalAnimalVaccinationRecord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'vaccinationUpdates');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> vaccinationUpdatesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'vaccinationUpdates', length, true, length, true);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> vaccinationUpdatesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vaccinationUpdates', 0, true, 0, true);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> vaccinationUpdatesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vaccinationUpdates', 0, false, 999999, true);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> vaccinationUpdatesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vaccinationUpdates', 0, true, length, include);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> vaccinationUpdatesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'vaccinationUpdates', length, include, 999999, true);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterFilterCondition> vaccinationUpdatesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'vaccinationUpdates', lower, includeLower, upper, includeUpper);
    });
  }
}

extension LocalMonthlyAdoptionUpdateQuerySortBy on QueryBuilder<
    LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate, QSortBy> {
  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByAdoptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionId', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByAdoptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionId', Sort.desc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByHealthStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthStatus', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByHealthStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthStatus', Sort.desc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LocalMonthlyAdoptionUpdateQuerySortThenBy on QueryBuilder<
    LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate, QSortThenBy> {
  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByAdoptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionId', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByAdoptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionId', Sort.desc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByHealthStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthStatus', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByHealthStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthStatus', Sort.desc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LocalMonthlyAdoptionUpdateQueryWhereDistinct on QueryBuilder<
    LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate, QDistinct> {
  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QDistinct> distinctByAdoptionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adoptionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QDistinct> distinctByBehaviorNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'behaviorNotes');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QDistinct> distinctByHealthStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'healthStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QDistinct> distinctByLocalImagePaths() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localImagePaths');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QDistinct> distinctByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remarks');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QDistinct> distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QDistinct> distinctByRemoteImageUrls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteImageUrls');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate,
      QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension LocalMonthlyAdoptionUpdateQueryProperty on QueryBuilder<
    LocalMonthlyAdoptionUpdate, LocalMonthlyAdoptionUpdate, QQueryProperty> {
  QueryBuilder<LocalMonthlyAdoptionUpdate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, String, QQueryOperations>
      adoptionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adoptionId');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, List<String>, QQueryOperations>
      behaviorNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'behaviorNotes');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, AnimalHealthStatus, QQueryOperations>
      healthStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'healthStatus');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, List<String>, QQueryOperations>
      localImagePathsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localImagePaths');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, DateTime, QQueryOperations>
      monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, List<String>, QQueryOperations>
      remarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remarks');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, String?, QQueryOperations>
      remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, List<String>, QQueryOperations>
      remoteImageUrlsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteImageUrls');
    });
  }

  QueryBuilder<LocalMonthlyAdoptionUpdate, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
