// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_vax_history_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAnimalVaccinationCollection on Isar {
  IsarCollection<AnimalVaccination> get animalVaccinations => this.collection();
}

const AnimalVaccinationSchema = CollectionSchema(
  name: r'AnimalVaccination',
  id: 8945377879885549348,
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
  estimateSize: _animalVaccinationEstimateSize,
  serialize: _animalVaccinationSerialize,
  deserialize: _animalVaccinationDeserialize,
  deserializeProp: _animalVaccinationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _animalVaccinationGetId,
  getLinks: _animalVaccinationGetLinks,
  attach: _animalVaccinationAttach,
  version: '3.1.0+1',
);

int _animalVaccinationEstimateSize(
  AnimalVaccination object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.vaxFor.length * 3;
  return bytesCount;
}

void _animalVaccinationSerialize(
  AnimalVaccination object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.vaxDate);
  writer.writeString(offsets[1], object.vaxFor);
}

AnimalVaccination _animalVaccinationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnimalVaccination();
  object.id = id;
  object.vaxDate = reader.readDateTime(offsets[0]);
  object.vaxFor = reader.readString(offsets[1]);
  return object;
}

P _animalVaccinationDeserializeProp<P>(
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

Id _animalVaccinationGetId(AnimalVaccination object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _animalVaccinationGetLinks(
    AnimalVaccination object) {
  return [];
}

void _animalVaccinationAttach(
    IsarCollection<dynamic> col, Id id, AnimalVaccination object) {
  object.id = id;
}

extension AnimalVaccinationQueryWhereSort
    on QueryBuilder<AnimalVaccination, AnimalVaccination, QWhere> {
  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnimalVaccinationQueryWhere
    on QueryBuilder<AnimalVaccination, AnimalVaccination, QWhereClause> {
  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterWhereClause>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterWhereClause>
      idBetween(
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

extension AnimalVaccinationQueryFilter
    on QueryBuilder<AnimalVaccination, AnimalVaccination, QFilterCondition> {
  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
      vaxDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vaxDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
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

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
      vaxForContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vaxFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
      vaxForMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vaxFor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
      vaxForIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vaxFor',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterFilterCondition>
      vaxForIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vaxFor',
        value: '',
      ));
    });
  }
}

extension AnimalVaccinationQueryObject
    on QueryBuilder<AnimalVaccination, AnimalVaccination, QFilterCondition> {}

extension AnimalVaccinationQueryLinks
    on QueryBuilder<AnimalVaccination, AnimalVaccination, QFilterCondition> {}

extension AnimalVaccinationQuerySortBy
    on QueryBuilder<AnimalVaccination, AnimalVaccination, QSortBy> {
  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterSortBy>
      sortByVaxDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxDate', Sort.asc);
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterSortBy>
      sortByVaxDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxDate', Sort.desc);
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterSortBy>
      sortByVaxFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxFor', Sort.asc);
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterSortBy>
      sortByVaxForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxFor', Sort.desc);
    });
  }
}

extension AnimalVaccinationQuerySortThenBy
    on QueryBuilder<AnimalVaccination, AnimalVaccination, QSortThenBy> {
  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterSortBy>
      thenByVaxDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxDate', Sort.asc);
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterSortBy>
      thenByVaxDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxDate', Sort.desc);
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterSortBy>
      thenByVaxFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxFor', Sort.asc);
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QAfterSortBy>
      thenByVaxForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaxFor', Sort.desc);
    });
  }
}

extension AnimalVaccinationQueryWhereDistinct
    on QueryBuilder<AnimalVaccination, AnimalVaccination, QDistinct> {
  QueryBuilder<AnimalVaccination, AnimalVaccination, QDistinct>
      distinctByVaxDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vaxDate');
    });
  }

  QueryBuilder<AnimalVaccination, AnimalVaccination, QDistinct>
      distinctByVaxFor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vaxFor', caseSensitive: caseSensitive);
    });
  }
}

extension AnimalVaccinationQueryProperty
    on QueryBuilder<AnimalVaccination, AnimalVaccination, QQueryProperty> {
  QueryBuilder<AnimalVaccination, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AnimalVaccination, DateTime, QQueryOperations>
      vaxDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vaxDate');
    });
  }

  QueryBuilder<AnimalVaccination, String, QQueryOperations> vaxForProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vaxFor');
    });
  }
}
