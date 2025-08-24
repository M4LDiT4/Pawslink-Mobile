// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_file_mapping.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetImageFileMappingCollection on Isar {
  IsarCollection<ImageFileMapping> get imageFileMappings => this.collection();
}

const ImageFileMappingSchema = CollectionSchema(
  name: r'ImageFileMapping',
  id: -4211169647054212376,
  properties: {
    r'localPath': PropertySchema(
      id: 0,
      name: r'localPath',
      type: IsarType.string,
    ),
    r'parentRemoteId': PropertySchema(
      id: 1,
      name: r'parentRemoteId',
      type: IsarType.string,
    ),
    r'remoteLink': PropertySchema(
      id: 2,
      name: r'remoteLink',
      type: IsarType.string,
    )
  },
  estimateSize: _imageFileMappingEstimateSize,
  serialize: _imageFileMappingSerialize,
  deserialize: _imageFileMappingDeserialize,
  deserializeProp: _imageFileMappingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _imageFileMappingGetId,
  getLinks: _imageFileMappingGetLinks,
  attach: _imageFileMappingAttach,
  version: '3.1.0+1',
);

int _imageFileMappingEstimateSize(
  ImageFileMapping object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.localPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.parentRemoteId.length * 3;
  {
    final value = object.remoteLink;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _imageFileMappingSerialize(
  ImageFileMapping object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.localPath);
  writer.writeString(offsets[1], object.parentRemoteId);
  writer.writeString(offsets[2], object.remoteLink);
}

ImageFileMapping _imageFileMappingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ImageFileMapping();
  object.id = id;
  object.localPath = reader.readStringOrNull(offsets[0]);
  object.parentRemoteId = reader.readString(offsets[1]);
  object.remoteLink = reader.readStringOrNull(offsets[2]);
  return object;
}

P _imageFileMappingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _imageFileMappingGetId(ImageFileMapping object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _imageFileMappingGetLinks(ImageFileMapping object) {
  return [];
}

void _imageFileMappingAttach(
    IsarCollection<dynamic> col, Id id, ImageFileMapping object) {
  object.id = id;
}

extension ImageFileMappingQueryWhereSort
    on QueryBuilder<ImageFileMapping, ImageFileMapping, QWhere> {
  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ImageFileMappingQueryWhere
    on QueryBuilder<ImageFileMapping, ImageFileMapping, QWhereClause> {
  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterWhereClause>
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

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterWhereClause> idBetween(
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

extension ImageFileMappingQueryFilter
    on QueryBuilder<ImageFileMapping, ImageFileMapping, QFilterCondition> {
  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
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

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
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

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
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

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localPath',
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localPath',
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      localPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      parentRemoteIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      parentRemoteIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      parentRemoteIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      parentRemoteIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentRemoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      parentRemoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      parentRemoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      parentRemoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      parentRemoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parentRemoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      parentRemoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentRemoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      parentRemoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentRemoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteLink',
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteLink',
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteLink',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterFilterCondition>
      remoteLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteLink',
        value: '',
      ));
    });
  }
}

extension ImageFileMappingQueryObject
    on QueryBuilder<ImageFileMapping, ImageFileMapping, QFilterCondition> {}

extension ImageFileMappingQueryLinks
    on QueryBuilder<ImageFileMapping, ImageFileMapping, QFilterCondition> {}

extension ImageFileMappingQuerySortBy
    on QueryBuilder<ImageFileMapping, ImageFileMapping, QSortBy> {
  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      sortByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      sortByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      sortByParentRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentRemoteId', Sort.asc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      sortByParentRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentRemoteId', Sort.desc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      sortByRemoteLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteLink', Sort.asc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      sortByRemoteLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteLink', Sort.desc);
    });
  }
}

extension ImageFileMappingQuerySortThenBy
    on QueryBuilder<ImageFileMapping, ImageFileMapping, QSortThenBy> {
  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      thenByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      thenByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      thenByParentRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentRemoteId', Sort.asc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      thenByParentRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentRemoteId', Sort.desc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      thenByRemoteLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteLink', Sort.asc);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QAfterSortBy>
      thenByRemoteLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteLink', Sort.desc);
    });
  }
}

extension ImageFileMappingQueryWhereDistinct
    on QueryBuilder<ImageFileMapping, ImageFileMapping, QDistinct> {
  QueryBuilder<ImageFileMapping, ImageFileMapping, QDistinct>
      distinctByLocalPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QDistinct>
      distinctByParentRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentRemoteId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ImageFileMapping, ImageFileMapping, QDistinct>
      distinctByRemoteLink({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteLink', caseSensitive: caseSensitive);
    });
  }
}

extension ImageFileMappingQueryProperty
    on QueryBuilder<ImageFileMapping, ImageFileMapping, QQueryProperty> {
  QueryBuilder<ImageFileMapping, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ImageFileMapping, String?, QQueryOperations>
      localPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localPath');
    });
  }

  QueryBuilder<ImageFileMapping, String, QQueryOperations>
      parentRemoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentRemoteId');
    });
  }

  QueryBuilder<ImageFileMapping, String?, QQueryOperations>
      remoteLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteLink');
    });
  }
}
