// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_vax_history_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAnimalVaxModelCollection on Isar {
  IsarCollection<AnimalVaxModel> get animalVaxModels => this.collection();
}

const AnimalVaxModelSchema = CollectionSchema(
  name: r'AnimalVaxModel',
  id: -8492657952589198271,
  properties: {
    r'vaxDate': PropertySchema(
      id: 0,
      name: r'vaxDate',
      type: IsarType.dateTime,
    ),
    r'vaxFor': PropertySchema(
      id: 1,
      name: r'vaxFor',
      type: IsarType.string,
    )
  },
  estimateSize: _animalVaxModelEstimateSize,
  serialize: _animalVaxModelSerialize,
  deserialize: _animalVaxModelDeserialize,
  deserializeProp: _animalVaxModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _animalVaxModelGetId,
  getLinks: _animalVaxModelGetLinks,
  attach: _animalVaxModelAttach,
  version: '3.1.0+1',
);

int _animalVaxModelEstimateSize(
  AnimalVaxModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.vaxFor.length * 3;
  return bytesCount;
}

void _animalVaxModelSerialize(
  AnimalVaxModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.vaxDate);
  writer.writeString(offsets[1], object.vaxFor);
}

AnimalVaxModel _animalVaxModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnimalVaxModel();
  object.id = id;
  object.vaxDate = reader.readDateTime(offsets[0]);
  object.vaxFor = reader.readString(offsets[1]);
  return object;
}

P _animalVaxModelDeserializeProp<P>(
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

Id _animalVaxModelGetId(AnimalVaxModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _animalVaxModelGetLinks(AnimalVaxModel object) {
  return [];
}

void _animalVaxModelAttach(
    IsarCollection<dynamic> col, Id id, AnimalVaxModel object) {
  object.id = id;
}

extension AnimalVaxModelQueryWhereSort
    on QueryBuilder<AnimalVaxModel, AnimalVaxModel, QWhere> {
  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnimalVaxModelQueryWhere
    on QueryBuilder<AnimalVaxModel, AnimalVaxModel, QWhereClause> {
  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterWhereClause> idBetween(
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

extension AnimalVaxModelQueryFilter
    on QueryBuilder<AnimalVaxModel, AnimalVaxModel, QFilterCondition> {
  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vaxDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vaxDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vaxDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vaxDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxForEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vaxFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxForGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vaxFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxForLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vaxFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxForBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vaxFor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxForStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vaxFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxForEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vaxFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxForContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vaxFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxForMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vaxFor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxForIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vaxFor',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterFilterCondition>
      vaxForIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vaxFor',
        value: '',
      ));
    });
  }
}

extension AnimalVaxModelQueryObject
    on QueryBuilder<AnimalVaxModel, AnimalVaxModel, QFilterCondition> {}

extension AnimalVaxModelQueryLinks
    on QueryBuilder<AnimalVaxModel, AnimalVaxModel, QFilterCondition> {}

extension AnimalVaxModelQuerySortBy
    on QueryBuilder<AnimalVaxModel, AnimalVaxModel, QSortBy> {
  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterSortBy> sortByVaxDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxDate', Sort.asc);
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterSortBy>
      sortByVaxDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxDate', Sort.desc);
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterSortBy> sortByVaxFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxFor', Sort.asc);
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterSortBy>
      sortByVaxForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxFor', Sort.desc);
    });
  }
}

extension AnimalVaxModelQuerySortThenBy
    on QueryBuilder<AnimalVaxModel, AnimalVaxModel, QSortThenBy> {
  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterSortBy> thenByVaxDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxDate', Sort.asc);
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterSortBy>
      thenByVaxDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxDate', Sort.desc);
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterSortBy> thenByVaxFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxFor', Sort.asc);
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QAfterSortBy>
      thenByVaxForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxFor', Sort.desc);
    });
  }
}

extension AnimalVaxModelQueryWhereDistinct
    on QueryBuilder<AnimalVaxModel, AnimalVaxModel, QDistinct> {
  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QDistinct> distinctByVaxDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vaxDate');
    });
  }

  QueryBuilder<AnimalVaxModel, AnimalVaxModel, QDistinct> distinctByVaxFor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vaxFor', caseSensitive: caseSensitive);
    });
  }
}

extension AnimalVaxModelQueryProperty
    on QueryBuilder<AnimalVaxModel, AnimalVaxModel, QQueryProperty> {
  QueryBuilder<AnimalVaxModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AnimalVaxModel, DateTime, QQueryOperations> vaxDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vaxDate');
    });
  }

  QueryBuilder<AnimalVaxModel, String, QQueryOperations> vaxForProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vaxFor');
    });
  }
}
