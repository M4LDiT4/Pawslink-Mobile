// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_adoption.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalAdoptionCollection on Isar {
  IsarCollection<LocalAdoption> get localAdoptions => this.collection();
}

const LocalAdoptionSchema = CollectionSchema(
  name: r'LocalAdoption',
  id: -419060110493140502,
  properties: {
    r'adopterId': PropertySchema(
      id: 0,
      name: r'adopterId',
      type: IsarType.string,
    ),
    r'adoptionDate': PropertySchema(
      id: 1,
      name: r'adoptionDate',
      type: IsarType.dateTime,
    ),
    r'adoptionRequestId': PropertySchema(
      id: 2,
      name: r'adoptionRequestId',
      type: IsarType.string,
    ),
    r'adoptionStatus': PropertySchema(
      id: 3,
      name: r'adoptionStatus',
      type: IsarType.string,
      enumMap: _LocalAdoptionadoptionStatusEnumValueMap,
    ),
    r'animalId': PropertySchema(
      id: 4,
      name: r'animalId',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 5,
      name: r'notes',
      type: IsarType.stringList,
    ),
    r'remoteId': PropertySchema(
      id: 6,
      name: r'remoteId',
      type: IsarType.string,
    )
  },
  estimateSize: _localAdoptionEstimateSize,
  serialize: _localAdoptionSerialize,
  deserialize: _localAdoptionDeserialize,
  deserializeProp: _localAdoptionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _localAdoptionGetId,
  getLinks: _localAdoptionGetLinks,
  attach: _localAdoptionAttach,
  version: '3.1.0+1',
);

int _localAdoptionEstimateSize(
  LocalAdoption object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.adopterId.length * 3;
  bytesCount += 3 + object.adoptionRequestId.length * 3;
  bytesCount += 3 + object.adoptionStatus.name.length * 3;
  bytesCount += 3 + object.animalId.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  {
    for (var i = 0; i < object.notes.length; i++) {
      final value = object.notes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.remoteId.length * 3;
  return bytesCount;
}

void _localAdoptionSerialize(
  LocalAdoption object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.adopterId);
  writer.writeDateTime(offsets[1], object.adoptionDate);
  writer.writeString(offsets[2], object.adoptionRequestId);
  writer.writeString(offsets[3], object.adoptionStatus.name);
  writer.writeString(offsets[4], object.animalId);
  writer.writeStringList(offsets[5], object.notes);
  writer.writeString(offsets[6], object.remoteId);
}

LocalAdoption _localAdoptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalAdoption();
  object.adopterId = reader.readString(offsets[0]);
  object.adoptionDate = reader.readDateTime(offsets[1]);
  object.adoptionRequestId = reader.readString(offsets[2]);
  object.adoptionStatus = _LocalAdoptionadoptionStatusValueEnumMap[
          reader.readStringOrNull(offsets[3])] ??
      AdoptionRequestStatus.pending;
  object.animalId = reader.readString(offsets[4]);
  object.id = id;
  object.notes = reader.readStringList(offsets[5]) ?? [];
  object.remoteId = reader.readString(offsets[6]);
  return object;
}

P _localAdoptionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_LocalAdoptionadoptionStatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          AdoptionRequestStatus.pending) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LocalAdoptionadoptionStatusEnumValueMap = {
  r'pending': r'pending',
  r'underReview': r'underReview',
  r'approved': r'approved',
  r'rejected': r'rejected',
  r'cancelled': r'cancelled',
  r'completed': r'completed',
};
const _LocalAdoptionadoptionStatusValueEnumMap = {
  r'pending': AdoptionRequestStatus.pending,
  r'underReview': AdoptionRequestStatus.underReview,
  r'approved': AdoptionRequestStatus.approved,
  r'rejected': AdoptionRequestStatus.rejected,
  r'cancelled': AdoptionRequestStatus.cancelled,
  r'completed': AdoptionRequestStatus.completed,
};

Id _localAdoptionGetId(LocalAdoption object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localAdoptionGetLinks(LocalAdoption object) {
  return [];
}

void _localAdoptionAttach(
    IsarCollection<dynamic> col, Id id, LocalAdoption object) {
  object.id = id;
}

extension LocalAdoptionQueryWhereSort
    on QueryBuilder<LocalAdoption, LocalAdoption, QWhere> {
  QueryBuilder<LocalAdoption, LocalAdoption, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalAdoptionQueryWhere
    on QueryBuilder<LocalAdoption, LocalAdoption, QWhereClause> {
  QueryBuilder<LocalAdoption, LocalAdoption, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterWhereClause> idBetween(
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

extension LocalAdoptionQueryFilter
    on QueryBuilder<LocalAdoption, LocalAdoption, QFilterCondition> {
  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adopterIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adopterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adopterIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adopterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adopterIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adopterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adopterIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adopterId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adopterIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'adopterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adopterIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'adopterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adopterIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'adopterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adopterIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'adopterId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adopterIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adopterId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adopterIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'adopterId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adoptionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adoptionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adoptionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adoptionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionRequestIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adoptionRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionRequestIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adoptionRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionRequestIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adoptionRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionRequestIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adoptionRequestId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionRequestIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'adoptionRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionRequestIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'adoptionRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionRequestIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'adoptionRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionRequestIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'adoptionRequestId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionRequestIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adoptionRequestId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionRequestIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'adoptionRequestId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionStatusEqualTo(
    AdoptionRequestStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adoptionStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionStatusGreaterThan(
    AdoptionRequestStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adoptionStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionStatusLessThan(
    AdoptionRequestStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adoptionStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionStatusBetween(
    AdoptionRequestStatus lower,
    AdoptionRequestStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adoptionStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'adoptionStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'adoptionStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'adoptionStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'adoptionStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adoptionStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      adoptionStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'adoptionStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      animalIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'animalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      animalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'animalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      animalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'animalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      animalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'animalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      animalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'animalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      animalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'animalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      animalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'animalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      animalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'animalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      animalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'animalId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      animalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'animalId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      notesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      notesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      notesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      notesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      remoteIdEqualTo(
    String value, {
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      remoteIdGreaterThan(
    String value, {
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      remoteIdLessThan(
    String value, {
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      remoteIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
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

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }
}

extension LocalAdoptionQueryObject
    on QueryBuilder<LocalAdoption, LocalAdoption, QFilterCondition> {}

extension LocalAdoptionQueryLinks
    on QueryBuilder<LocalAdoption, LocalAdoption, QFilterCondition> {}

extension LocalAdoptionQuerySortBy
    on QueryBuilder<LocalAdoption, LocalAdoption, QSortBy> {
  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy> sortByAdopterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adopterId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      sortByAdopterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adopterId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      sortByAdoptionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionDate', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      sortByAdoptionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionDate', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      sortByAdoptionRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionRequestId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      sortByAdoptionRequestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionRequestId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      sortByAdoptionStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionStatus', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      sortByAdoptionStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionStatus', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy> sortByAnimalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      sortByAnimalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }
}

extension LocalAdoptionQuerySortThenBy
    on QueryBuilder<LocalAdoption, LocalAdoption, QSortThenBy> {
  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy> thenByAdopterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adopterId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      thenByAdopterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adopterId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      thenByAdoptionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionDate', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      thenByAdoptionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionDate', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      thenByAdoptionRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionRequestId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      thenByAdoptionRequestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionRequestId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      thenByAdoptionStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionStatus', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      thenByAdoptionStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionStatus', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy> thenByAnimalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      thenByAnimalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }
}

extension LocalAdoptionQueryWhereDistinct
    on QueryBuilder<LocalAdoption, LocalAdoption, QDistinct> {
  QueryBuilder<LocalAdoption, LocalAdoption, QDistinct> distinctByAdopterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adopterId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QDistinct>
      distinctByAdoptionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adoptionDate');
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QDistinct>
      distinctByAdoptionRequestId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adoptionRequestId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QDistinct>
      distinctByAdoptionStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adoptionStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QDistinct> distinctByAnimalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'animalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QDistinct> distinctByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes');
    });
  }

  QueryBuilder<LocalAdoption, LocalAdoption, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }
}

extension LocalAdoptionQueryProperty
    on QueryBuilder<LocalAdoption, LocalAdoption, QQueryProperty> {
  QueryBuilder<LocalAdoption, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalAdoption, String, QQueryOperations> adopterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adopterId');
    });
  }

  QueryBuilder<LocalAdoption, DateTime, QQueryOperations>
      adoptionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adoptionDate');
    });
  }

  QueryBuilder<LocalAdoption, String, QQueryOperations>
      adoptionRequestIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adoptionRequestId');
    });
  }

  QueryBuilder<LocalAdoption, AdoptionRequestStatus, QQueryOperations>
      adoptionStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adoptionStatus');
    });
  }

  QueryBuilder<LocalAdoption, String, QQueryOperations> animalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'animalId');
    });
  }

  QueryBuilder<LocalAdoption, List<String>, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<LocalAdoption, String, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }
}
