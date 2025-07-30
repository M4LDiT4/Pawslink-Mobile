// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_med_history_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAnimalMedModelCollection on Isar {
  IsarCollection<AnimalMedModel> get animalMedModels => this.collection();
}

const AnimalMedModelSchema = CollectionSchema(
  name: r'AnimalMedModel',
  id: -5815324984570406894,
  properties: {
    r'medData': PropertySchema(
      id: 0,
      name: r'medData',
      type: IsarType.dateTime,
    ),
    r'medFor': PropertySchema(
      id: 1,
      name: r'medFor',
      type: IsarType.string,
    )
  },
  estimateSize: _animalMedModelEstimateSize,
  serialize: _animalMedModelSerialize,
  deserialize: _animalMedModelDeserialize,
  deserializeProp: _animalMedModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _animalMedModelGetId,
  getLinks: _animalMedModelGetLinks,
  attach: _animalMedModelAttach,
  version: '3.1.0+1',
);

int _animalMedModelEstimateSize(
  AnimalMedModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.medFor.length * 3;
  return bytesCount;
}

void _animalMedModelSerialize(
  AnimalMedModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.medData);
  writer.writeString(offsets[1], object.medFor);
}

AnimalMedModel _animalMedModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnimalMedModel();
  object.id = id;
  object.medData = reader.readDateTime(offsets[0]);
  object.medFor = reader.readString(offsets[1]);
  return object;
}

P _animalMedModelDeserializeProp<P>(
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

Id _animalMedModelGetId(AnimalMedModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _animalMedModelGetLinks(AnimalMedModel object) {
  return [];
}

void _animalMedModelAttach(
    IsarCollection<dynamic> col, Id id, AnimalMedModel object) {
  object.id = id;
}

extension AnimalMedModelQueryWhereSort
    on QueryBuilder<AnimalMedModel, AnimalMedModel, QWhere> {
  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnimalMedModelQueryWhere
    on QueryBuilder<AnimalMedModel, AnimalMedModel, QWhereClause> {
  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterWhereClause> idBetween(
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

extension AnimalMedModelQueryFilter
    on QueryBuilder<AnimalMedModel, AnimalMedModel, QFilterCondition> {
  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
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

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
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

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
      medDataEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medData',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
      medDataGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medData',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
      medDataLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medData',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
      medDataBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
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

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
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

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
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

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
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

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
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

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
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

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
      medForContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
      medForMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medFor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
      medForIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medFor',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterFilterCondition>
      medForIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medFor',
        value: '',
      ));
    });
  }
}

extension AnimalMedModelQueryObject
    on QueryBuilder<AnimalMedModel, AnimalMedModel, QFilterCondition> {}

extension AnimalMedModelQueryLinks
    on QueryBuilder<AnimalMedModel, AnimalMedModel, QFilterCondition> {}

extension AnimalMedModelQuerySortBy
    on QueryBuilder<AnimalMedModel, AnimalMedModel, QSortBy> {
  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterSortBy> sortByMedData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medData', Sort.asc);
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterSortBy>
      sortByMedDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medData', Sort.desc);
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterSortBy> sortByMedFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medFor', Sort.asc);
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterSortBy>
      sortByMedForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medFor', Sort.desc);
    });
  }
}

extension AnimalMedModelQuerySortThenBy
    on QueryBuilder<AnimalMedModel, AnimalMedModel, QSortThenBy> {
  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterSortBy> thenByMedData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medData', Sort.asc);
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterSortBy>
      thenByMedDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medData', Sort.desc);
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterSortBy> thenByMedFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medFor', Sort.asc);
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QAfterSortBy>
      thenByMedForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medFor', Sort.desc);
    });
  }
}

extension AnimalMedModelQueryWhereDistinct
    on QueryBuilder<AnimalMedModel, AnimalMedModel, QDistinct> {
  QueryBuilder<AnimalMedModel, AnimalMedModel, QDistinct> distinctByMedData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medData');
    });
  }

  QueryBuilder<AnimalMedModel, AnimalMedModel, QDistinct> distinctByMedFor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medFor', caseSensitive: caseSensitive);
    });
  }
}

extension AnimalMedModelQueryProperty
    on QueryBuilder<AnimalMedModel, AnimalMedModel, QQueryProperty> {
  QueryBuilder<AnimalMedModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AnimalMedModel, DateTime, QQueryOperations> medDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medData');
    });
  }

  QueryBuilder<AnimalMedModel, String, QQueryOperations> medForProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medFor');
    });
  }
}
