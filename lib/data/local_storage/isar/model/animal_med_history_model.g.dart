// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_med_history_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAnimalMedicationCollection on Isar {
  IsarCollection<AnimalMedication> get animalMedications => this.collection();
}

const AnimalMedicationSchema = CollectionSchema(
  name: r'AnimalMedication',
  id: 3160208615764700326,
  properties: {
    r'medDate': PropertySchema(
      id: 0,
      name: r'medDate',
      type: IsarType.dateTime,
    ),
    r'medFor': PropertySchema(
      id: 1,
      name: r'medFor',
      type: IsarType.string,
    )
  },
  estimateSize: _animalMedicationEstimateSize,
  serialize: _animalMedicationSerialize,
  deserialize: _animalMedicationDeserialize,
  deserializeProp: _animalMedicationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _animalMedicationGetId,
  getLinks: _animalMedicationGetLinks,
  attach: _animalMedicationAttach,
  version: '3.1.0+1',
);

int _animalMedicationEstimateSize(
  AnimalMedication object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.medFor.length * 3;
  return bytesCount;
}

void _animalMedicationSerialize(
  AnimalMedication object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.medDate);
  writer.writeString(offsets[1], object.medFor);
}

AnimalMedication _animalMedicationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnimalMedication();
  object.id = id;
  object.medDate = reader.readDateTime(offsets[0]);
  object.medFor = reader.readString(offsets[1]);
  return object;
}

P _animalMedicationDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _animalMedicationGetId(AnimalMedication object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _animalMedicationGetLinks(AnimalMedication object) {
  return [];
}

void _animalMedicationAttach(
    IsarCollection<dynamic> col, Id id, AnimalMedication object) {
  object.id = id;
}

extension AnimalMedicationQueryWhereSort
    on QueryBuilder<AnimalMedication, AnimalMedication, QWhere> {
  QueryBuilder<AnimalMedication, AnimalMedication, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnimalMedicationQueryWhere
    on QueryBuilder<AnimalMedication, AnimalMedication, QWhereClause> {
  QueryBuilder<AnimalMedication, AnimalMedication, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterWhereClause>
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

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterWhereClause> idBetween(
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

extension AnimalMedicationQueryFilter
    on QueryBuilder<AnimalMedication, AnimalMedication, QFilterCondition> {
  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
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

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
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

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
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

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medForEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medForGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medForLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medForBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medFor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medForStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medForEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medForContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medForMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medFor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medForIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medFor',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterFilterCondition>
      medForIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medFor',
        value: '',
      ));
    });
  }
}

extension AnimalMedicationQueryObject
    on QueryBuilder<AnimalMedication, AnimalMedication, QFilterCondition> {}

extension AnimalMedicationQueryLinks
    on QueryBuilder<AnimalMedication, AnimalMedication, QFilterCondition> {}

extension AnimalMedicationQuerySortBy
    on QueryBuilder<AnimalMedication, AnimalMedication, QSortBy> {
  QueryBuilder<AnimalMedication, AnimalMedication, QAfterSortBy>
      sortByMedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medDate', Sort.asc);
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterSortBy>
      sortByMedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medDate', Sort.desc);
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterSortBy>
      sortByMedFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medFor', Sort.asc);
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterSortBy>
      sortByMedForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medFor', Sort.desc);
    });
  }
}

extension AnimalMedicationQuerySortThenBy
    on QueryBuilder<AnimalMedication, AnimalMedication, QSortThenBy> {
  QueryBuilder<AnimalMedication, AnimalMedication, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterSortBy>
      thenByMedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medDate', Sort.asc);
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterSortBy>
      thenByMedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medDate', Sort.desc);
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterSortBy>
      thenByMedFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medFor', Sort.asc);
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QAfterSortBy>
      thenByMedForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medFor', Sort.desc);
    });
  }
}

extension AnimalMedicationQueryWhereDistinct
    on QueryBuilder<AnimalMedication, AnimalMedication, QDistinct> {
  QueryBuilder<AnimalMedication, AnimalMedication, QDistinct>
      distinctByMedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medDate');
    });
  }

  QueryBuilder<AnimalMedication, AnimalMedication, QDistinct> distinctByMedFor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medFor', caseSensitive: caseSensitive);
    });
  }
}

extension AnimalMedicationQueryProperty
    on QueryBuilder<AnimalMedication, AnimalMedication, QQueryProperty> {
  QueryBuilder<AnimalMedication, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AnimalMedication, DateTime, QQueryOperations> medDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medDate');
    });
  }

  QueryBuilder<AnimalMedication, String, QQueryOperations> medForProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medFor');
    });
  }
}
