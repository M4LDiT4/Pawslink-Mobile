// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_adoption_request.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalAdoptionRequestCollection on Isar {
  IsarCollection<LocalAdoptionRequest> get localAdoptionRequests =>
      this.collection();
}

const LocalAdoptionRequestSchema = CollectionSchema(
  name: r'LocalAdoptionRequest',
  id: -5482816640365581650,
  properties: {
    r'adoptedAccommodation': PropertySchema(
      id: 0,
      name: r'adoptedAccommodation',
      type: IsarType.string,
    ),
    r'adoptedSterilizationWillingness': PropertySchema(
      id: 1,
      name: r'adoptedSterilizationWillingness',
      type: IsarType.bool,
    ),
    r'adoptionStatus': PropertySchema(
      id: 2,
      name: r'adoptionStatus',
      type: IsarType.byte,
      enumMap: _LocalAdoptionRequestadoptionStatusEnumValueMap,
    ),
    r'age': PropertySchema(
      id: 3,
      name: r'age',
      type: IsarType.long,
    ),
    r'agreedToTerms': PropertySchema(
      id: 4,
      name: r'agreedToTerms',
      type: IsarType.bool,
    ),
    r'basicNecessities': PropertySchema(
      id: 5,
      name: r'basicNecessities',
      type: IsarType.stringList,
    ),
    r'completeAddress': PropertySchema(
      id: 6,
      name: r'completeAddress',
      type: IsarType.string,
    ),
    r'completeCurrentAddress': PropertySchema(
      id: 7,
      name: r'completeCurrentAddress',
      type: IsarType.string,
    ),
    r'contactNumber': PropertySchema(
      id: 8,
      name: r'contactNumber',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 9,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currenPetCount': PropertySchema(
      id: 10,
      name: r'currenPetCount',
      type: IsarType.long,
    ),
    r'emailAddress': PropertySchema(
      id: 11,
      name: r'emailAddress',
      type: IsarType.string,
    ),
    r'facebookLink': PropertySchema(
      id: 12,
      name: r'facebookLink',
      type: IsarType.string,
    ),
    r'firstName': PropertySchema(
      id: 13,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'housingType': PropertySchema(
      id: 14,
      name: r'housingType',
      type: IsarType.string,
    ),
    r'idImageUrl': PropertySchema(
      id: 15,
      name: r'idImageUrl',
      type: IsarType.string,
    ),
    r'isStudent': PropertySchema(
      id: 16,
      name: r'isStudent',
      type: IsarType.bool,
    ),
    r'lastName': PropertySchema(
      id: 17,
      name: r'lastName',
      type: IsarType.string,
    ),
    r'oldestLivingPetAge': PropertySchema(
      id: 18,
      name: r'oldestLivingPetAge',
      type: IsarType.long,
    ),
    r'petActivity': PropertySchema(
      id: 19,
      name: r'petActivity',
      type: IsarType.string,
    ),
    r'petOwnershipDuration': PropertySchema(
      id: 20,
      name: r'petOwnershipDuration',
      type: IsarType.long,
    ),
    r'referralSource': PropertySchema(
      id: 21,
      name: r'referralSource',
      type: IsarType.string,
    ),
    r'regularVetClinic': PropertySchema(
      id: 22,
      name: r'regularVetClinic',
      type: IsarType.string,
    ),
    r'remoteAnimalId': PropertySchema(
      id: 23,
      name: r'remoteAnimalId',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 24,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'remoteUserId': PropertySchema(
      id: 25,
      name: r'remoteUserId',
      type: IsarType.string,
    ),
    r'restraintMethod': PropertySchema(
      id: 26,
      name: r'restraintMethod',
      type: IsarType.string,
    ),
    r'statusIndex': PropertySchema(
      id: 27,
      name: r'statusIndex',
      type: IsarType.string,
    ),
    r'sterilizationAwareness': PropertySchema(
      id: 28,
      name: r'sterilizationAwareness',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 29,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _localAdoptionRequestEstimateSize,
  serialize: _localAdoptionRequestSerialize,
  deserialize: _localAdoptionRequestDeserialize,
  deserializeProp: _localAdoptionRequestDeserializeProp,
  idName: r'id',
  indexes: {
    r'statusIndex': IndexSchema(
      id: -3068638669929638322,
      name: r'statusIndex',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'statusIndex',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
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
  links: {},
  embeddedSchemas: {},
  getId: _localAdoptionRequestGetId,
  getLinks: _localAdoptionRequestGetLinks,
  attach: _localAdoptionRequestAttach,
  version: '3.1.0+1',
);

int _localAdoptionRequestEstimateSize(
  LocalAdoptionRequest object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.adoptedAccommodation.length * 3;
  bytesCount += 3 + object.basicNecessities.length * 3;
  {
    for (var i = 0; i < object.basicNecessities.length; i++) {
      final value = object.basicNecessities[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.completeAddress.length * 3;
  bytesCount += 3 + object.completeCurrentAddress.length * 3;
  bytesCount += 3 + object.contactNumber.length * 3;
  bytesCount += 3 + object.emailAddress.length * 3;
  bytesCount += 3 + object.facebookLink.length * 3;
  bytesCount += 3 + object.firstName.length * 3;
  bytesCount += 3 + object.housingType.length * 3;
  bytesCount += 3 + object.idImageUrl.length * 3;
  bytesCount += 3 + object.lastName.length * 3;
  bytesCount += 3 + object.petActivity.length * 3;
  bytesCount += 3 + object.referralSource.length * 3;
  {
    final value = object.regularVetClinic;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.remoteAnimalId.length * 3;
  bytesCount += 3 + object.remoteId.length * 3;
  bytesCount += 3 + object.remoteUserId.length * 3;
  bytesCount += 3 + object.restraintMethod.length * 3;
  bytesCount += 3 + object.statusIndex.length * 3;
  return bytesCount;
}

void _localAdoptionRequestSerialize(
  LocalAdoptionRequest object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.adoptedAccommodation);
  writer.writeBool(offsets[1], object.adoptedSterilizationWillingness);
  writer.writeByte(offsets[2], object.adoptionStatus.index);
  writer.writeLong(offsets[3], object.age);
  writer.writeBool(offsets[4], object.agreedToTerms);
  writer.writeStringList(offsets[5], object.basicNecessities);
  writer.writeString(offsets[6], object.completeAddress);
  writer.writeString(offsets[7], object.completeCurrentAddress);
  writer.writeString(offsets[8], object.contactNumber);
  writer.writeDateTime(offsets[9], object.createdAt);
  writer.writeLong(offsets[10], object.currenPetCount);
  writer.writeString(offsets[11], object.emailAddress);
  writer.writeString(offsets[12], object.facebookLink);
  writer.writeString(offsets[13], object.firstName);
  writer.writeString(offsets[14], object.housingType);
  writer.writeString(offsets[15], object.idImageUrl);
  writer.writeBool(offsets[16], object.isStudent);
  writer.writeString(offsets[17], object.lastName);
  writer.writeLong(offsets[18], object.oldestLivingPetAge);
  writer.writeString(offsets[19], object.petActivity);
  writer.writeLong(offsets[20], object.petOwnershipDuration);
  writer.writeString(offsets[21], object.referralSource);
  writer.writeString(offsets[22], object.regularVetClinic);
  writer.writeString(offsets[23], object.remoteAnimalId);
  writer.writeString(offsets[24], object.remoteId);
  writer.writeString(offsets[25], object.remoteUserId);
  writer.writeString(offsets[26], object.restraintMethod);
  writer.writeString(offsets[27], object.statusIndex);
  writer.writeBool(offsets[28], object.sterilizationAwareness);
  writer.writeDateTime(offsets[29], object.updatedAt);
}

LocalAdoptionRequest _localAdoptionRequestDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalAdoptionRequest();
  object.adoptedAccommodation = reader.readString(offsets[0]);
  object.adoptedSterilizationWillingness = reader.readBool(offsets[1]);
  object.adoptionStatus = _LocalAdoptionRequestadoptionStatusValueEnumMap[
          reader.readByteOrNull(offsets[2])] ??
      AdoptionRequestStatus.pending;
  object.age = reader.readLong(offsets[3]);
  object.agreedToTerms = reader.readBool(offsets[4]);
  object.basicNecessities = reader.readStringList(offsets[5]) ?? [];
  object.completeAddress = reader.readString(offsets[6]);
  object.completeCurrentAddress = reader.readString(offsets[7]);
  object.contactNumber = reader.readString(offsets[8]);
  object.createdAt = reader.readDateTimeOrNull(offsets[9]);
  object.currenPetCount = reader.readLong(offsets[10]);
  object.emailAddress = reader.readString(offsets[11]);
  object.facebookLink = reader.readString(offsets[12]);
  object.firstName = reader.readString(offsets[13]);
  object.housingType = reader.readString(offsets[14]);
  object.id = id;
  object.idImageUrl = reader.readString(offsets[15]);
  object.isStudent = reader.readBool(offsets[16]);
  object.lastName = reader.readString(offsets[17]);
  object.oldestLivingPetAge = reader.readLong(offsets[18]);
  object.petActivity = reader.readString(offsets[19]);
  object.petOwnershipDuration = reader.readLong(offsets[20]);
  object.referralSource = reader.readString(offsets[21]);
  object.regularVetClinic = reader.readStringOrNull(offsets[22]);
  object.remoteAnimalId = reader.readString(offsets[23]);
  object.remoteId = reader.readString(offsets[24]);
  object.remoteUserId = reader.readString(offsets[25]);
  object.restraintMethod = reader.readString(offsets[26]);
  object.sterilizationAwareness = reader.readBool(offsets[28]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[29]);
  return object;
}

P _localAdoptionRequestDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (_LocalAdoptionRequestadoptionStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AdoptionRequestStatus.pending) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    case 28:
      return (reader.readBool(offset)) as P;
    case 29:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LocalAdoptionRequestadoptionStatusEnumValueMap = {
  'pending': 0,
  'underReview': 1,
  'approved': 2,
  'rejected': 3,
  'cancelled': 4,
  'completed': 5,
};
const _LocalAdoptionRequestadoptionStatusValueEnumMap = {
  0: AdoptionRequestStatus.pending,
  1: AdoptionRequestStatus.underReview,
  2: AdoptionRequestStatus.approved,
  3: AdoptionRequestStatus.rejected,
  4: AdoptionRequestStatus.cancelled,
  5: AdoptionRequestStatus.completed,
};

Id _localAdoptionRequestGetId(LocalAdoptionRequest object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localAdoptionRequestGetLinks(
    LocalAdoptionRequest object) {
  return [];
}

void _localAdoptionRequestAttach(
    IsarCollection<dynamic> col, Id id, LocalAdoptionRequest object) {
  object.id = id;
}

extension LocalAdoptionRequestQueryWhereSort
    on QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QWhere> {
  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhere>
      anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhere>
      anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }
}

extension LocalAdoptionRequestQueryWhere
    on QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QWhereClause> {
  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      statusIndexEqualTo(String statusIndex) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'statusIndex',
        value: [statusIndex],
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      statusIndexNotEqualTo(String statusIndex) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'statusIndex',
              lower: [],
              upper: [statusIndex],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'statusIndex',
              lower: [statusIndex],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'statusIndex',
              lower: [statusIndex],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'statusIndex',
              lower: [],
              upper: [statusIndex],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      createdAtEqualTo(DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      createdAtNotEqualTo(DateTime? createdAt) {
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      createdAtGreaterThan(
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      createdAtLessThan(
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      createdAtBetween(
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      updatedAtEqualTo(DateTime? updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [updatedAt],
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      updatedAtNotEqualTo(DateTime? updatedAt) {
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      updatedAtGreaterThan(
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      updatedAtLessThan(
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterWhereClause>
      updatedAtBetween(
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

extension LocalAdoptionRequestQueryFilter on QueryBuilder<LocalAdoptionRequest,
    LocalAdoptionRequest, QFilterCondition> {
  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> adoptedAccommodationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adoptedAccommodation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> adoptedAccommodationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adoptedAccommodation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> adoptedAccommodationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adoptedAccommodation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> adoptedAccommodationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adoptedAccommodation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> adoptedAccommodationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'adoptedAccommodation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> adoptedAccommodationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'adoptedAccommodation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      adoptedAccommodationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'adoptedAccommodation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      adoptedAccommodationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'adoptedAccommodation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> adoptedAccommodationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adoptedAccommodation',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> adoptedAccommodationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'adoptedAccommodation',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      adoptedSterilizationWillingnessEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adoptedSterilizationWillingness',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      adoptionStatusEqualTo(AdoptionRequestStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adoptionStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> adoptionStatusGreaterThan(
    AdoptionRequestStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adoptionStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> adoptionStatusLessThan(
    AdoptionRequestStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adoptionStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> adoptionStatusBetween(
    AdoptionRequestStatus lower,
    AdoptionRequestStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adoptionStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> ageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> ageGreaterThan(
    int value, {
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> ageLessThan(
    int value, {
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> ageBetween(
    int lower,
    int upper, {
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> agreedToTermsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'agreedToTerms',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'basicNecessities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'basicNecessities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'basicNecessities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'basicNecessities',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'basicNecessities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'basicNecessities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      basicNecessitiesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'basicNecessities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      basicNecessitiesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'basicNecessities',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'basicNecessities',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'basicNecessities',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'basicNecessities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'basicNecessities',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'basicNecessities',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'basicNecessities',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'basicNecessities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> basicNecessitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'basicNecessities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completeAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'completeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'completeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      completeAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'completeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      completeAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'completeAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completeAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'completeAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeCurrentAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completeCurrentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeCurrentAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completeCurrentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeCurrentAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completeCurrentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeCurrentAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completeCurrentAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeCurrentAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'completeCurrentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeCurrentAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'completeCurrentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      completeCurrentAddressContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'completeCurrentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      completeCurrentAddressMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'completeCurrentAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeCurrentAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completeCurrentAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> completeCurrentAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'completeCurrentAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> contactNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> contactNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> contactNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> contactNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> contactNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> contactNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      contactNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      contactNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> contactNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> contactNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> currenPetCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currenPetCount',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> currenPetCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currenPetCount',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> currenPetCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currenPetCount',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> currenPetCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currenPetCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> emailAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> emailAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> emailAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> emailAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emailAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> emailAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> emailAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      emailAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      emailAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> emailAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> emailAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> facebookLinkEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'facebookLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> facebookLinkGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'facebookLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> facebookLinkLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'facebookLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> facebookLinkBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'facebookLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> facebookLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'facebookLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> facebookLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'facebookLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      facebookLinkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'facebookLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      facebookLinkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'facebookLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> facebookLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'facebookLink',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> facebookLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'facebookLink',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> firstNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> firstNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> firstNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> firstNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> firstNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> firstNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      firstNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      firstNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> housingTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'housingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> housingTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'housingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> housingTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'housingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> housingTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'housingType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> housingTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'housingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> housingTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'housingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      housingTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'housingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      housingTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'housingType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> housingTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'housingType',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> housingTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'housingType',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> idImageUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> idImageUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> idImageUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> idImageUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idImageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> idImageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> idImageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      idImageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      idImageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idImageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> idImageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idImageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> idImageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idImageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> isStudentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isStudent',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> lastNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> lastNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> lastNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> lastNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> lastNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> lastNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      lastNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      lastNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> oldestLivingPetAgeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oldestLivingPetAge',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> oldestLivingPetAgeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'oldestLivingPetAge',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> oldestLivingPetAgeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'oldestLivingPetAge',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> oldestLivingPetAgeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'oldestLivingPetAge',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petActivityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'petActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petActivityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'petActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petActivityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'petActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petActivityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'petActivity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petActivityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'petActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petActivityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'petActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      petActivityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'petActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      petActivityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'petActivity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petActivityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'petActivity',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petActivityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'petActivity',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petOwnershipDurationEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'petOwnershipDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petOwnershipDurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'petOwnershipDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petOwnershipDurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'petOwnershipDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> petOwnershipDurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'petOwnershipDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> referralSourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referralSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> referralSourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referralSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> referralSourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referralSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> referralSourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referralSource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> referralSourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referralSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> referralSourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referralSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      referralSourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referralSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      referralSourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referralSource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> referralSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referralSource',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> referralSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referralSource',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> regularVetClinicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regularVetClinic',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> regularVetClinicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regularVetClinic',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> regularVetClinicEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regularVetClinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> regularVetClinicGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'regularVetClinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> regularVetClinicLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'regularVetClinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> regularVetClinicBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'regularVetClinic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> regularVetClinicStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'regularVetClinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> regularVetClinicEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'regularVetClinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      regularVetClinicContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'regularVetClinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      regularVetClinicMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'regularVetClinic',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> regularVetClinicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regularVetClinic',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> regularVetClinicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'regularVetClinic',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteAnimalIdEqualTo(
    String value, {
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteAnimalIdGreaterThan(
    String value, {
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteAnimalIdLessThan(
    String value, {
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteAnimalIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteAnimalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteAnimalId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteAnimalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteAnimalId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteIdEqualTo(
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteIdGreaterThan(
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteIdLessThan(
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteIdBetween(
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteUserIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteUserIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteUserIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteUserIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      remoteUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      remoteUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> remoteUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> restraintMethodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restraintMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> restraintMethodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'restraintMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> restraintMethodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'restraintMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> restraintMethodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'restraintMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> restraintMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'restraintMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> restraintMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'restraintMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      restraintMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'restraintMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      restraintMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'restraintMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> restraintMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restraintMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> restraintMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'restraintMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> statusIndexEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> statusIndexGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> statusIndexLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> statusIndexBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> statusIndexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> statusIndexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      statusIndexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
          QAfterFilterCondition>
      statusIndexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusIndex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> statusIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> statusIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> sterilizationAwarenessEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sterilizationAwareness',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest,
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

extension LocalAdoptionRequestQueryObject on QueryBuilder<LocalAdoptionRequest,
    LocalAdoptionRequest, QFilterCondition> {}

extension LocalAdoptionRequestQueryLinks on QueryBuilder<LocalAdoptionRequest,
    LocalAdoptionRequest, QFilterCondition> {}

extension LocalAdoptionRequestQuerySortBy
    on QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QSortBy> {
  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByAdoptedAccommodation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptedAccommodation', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByAdoptedAccommodationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptedAccommodation', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByAdoptedSterilizationWillingness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptedSterilizationWillingness', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByAdoptedSterilizationWillingnessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptedSterilizationWillingness', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByAdoptionStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionStatus', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByAdoptionStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionStatus', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByAgreedToTerms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agreedToTerms', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByAgreedToTermsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agreedToTerms', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByCompleteAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeAddress', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByCompleteAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeAddress', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByCompleteCurrentAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeCurrentAddress', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByCompleteCurrentAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeCurrentAddress', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByContactNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactNumber', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByContactNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactNumber', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByCurrenPetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currenPetCount', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByCurrenPetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currenPetCount', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByEmailAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAddress', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByEmailAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAddress', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByFacebookLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facebookLink', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByFacebookLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facebookLink', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByHousingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'housingType', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByHousingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'housingType', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByIdImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idImageUrl', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByIdImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idImageUrl', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByIsStudent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStudent', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByIsStudentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStudent', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByOldestLivingPetAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldestLivingPetAge', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByOldestLivingPetAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldestLivingPetAge', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByPetActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petActivity', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByPetActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petActivity', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByPetOwnershipDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petOwnershipDuration', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByPetOwnershipDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petOwnershipDuration', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByReferralSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referralSource', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByReferralSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referralSource', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByRegularVetClinic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regularVetClinic', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByRegularVetClinicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regularVetClinic', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByRemoteAnimalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByRemoteAnimalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByRemoteUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUserId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByRemoteUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUserId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByRestraintMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restraintMethod', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByRestraintMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restraintMethod', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByStatusIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusIndex', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByStatusIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusIndex', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortBySterilizationAwareness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sterilizationAwareness', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortBySterilizationAwarenessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sterilizationAwareness', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LocalAdoptionRequestQuerySortThenBy
    on QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QSortThenBy> {
  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByAdoptedAccommodation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptedAccommodation', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByAdoptedAccommodationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptedAccommodation', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByAdoptedSterilizationWillingness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptedSterilizationWillingness', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByAdoptedSterilizationWillingnessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptedSterilizationWillingness', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByAdoptionStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionStatus', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByAdoptionStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adoptionStatus', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByAgreedToTerms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agreedToTerms', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByAgreedToTermsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agreedToTerms', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByCompleteAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeAddress', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByCompleteAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeAddress', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByCompleteCurrentAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeCurrentAddress', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByCompleteCurrentAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeCurrentAddress', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByContactNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactNumber', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByContactNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactNumber', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByCurrenPetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currenPetCount', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByCurrenPetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currenPetCount', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByEmailAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAddress', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByEmailAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAddress', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByFacebookLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facebookLink', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByFacebookLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facebookLink', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByHousingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'housingType', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByHousingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'housingType', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByIdImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idImageUrl', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByIdImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idImageUrl', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByIsStudent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStudent', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByIsStudentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStudent', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByOldestLivingPetAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldestLivingPetAge', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByOldestLivingPetAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldestLivingPetAge', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByPetActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petActivity', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByPetActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petActivity', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByPetOwnershipDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petOwnershipDuration', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByPetOwnershipDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petOwnershipDuration', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByReferralSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referralSource', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByReferralSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referralSource', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByRegularVetClinic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regularVetClinic', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByRegularVetClinicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regularVetClinic', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByRemoteAnimalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByRemoteAnimalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteAnimalId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByRemoteUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUserId', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByRemoteUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUserId', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByRestraintMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restraintMethod', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByRestraintMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restraintMethod', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByStatusIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusIndex', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByStatusIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusIndex', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenBySterilizationAwareness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sterilizationAwareness', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenBySterilizationAwarenessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sterilizationAwareness', Sort.desc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LocalAdoptionRequestQueryWhereDistinct
    on QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct> {
  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByAdoptedAccommodation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adoptedAccommodation',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByAdoptedSterilizationWillingness() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adoptedSterilizationWillingness');
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByAdoptionStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adoptionStatus');
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByAgreedToTerms() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'agreedToTerms');
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByBasicNecessities() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'basicNecessities');
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByCompleteAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completeAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByCompleteCurrentAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completeCurrentAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByContactNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByCurrenPetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currenPetCount');
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByEmailAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByFacebookLink({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'facebookLink', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByFirstName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByHousingType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'housingType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByIdImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idImageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByIsStudent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isStudent');
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByLastName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByOldestLivingPetAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oldestLivingPetAge');
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByPetActivity({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'petActivity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByPetOwnershipDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'petOwnershipDuration');
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByReferralSource({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referralSource',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByRegularVetClinic({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regularVetClinic',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByRemoteAnimalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteAnimalId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByRemoteUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUserId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByRestraintMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restraintMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByStatusIndex({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusIndex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctBySterilizationAwareness() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sterilizationAwareness');
    });
  }

  QueryBuilder<LocalAdoptionRequest, LocalAdoptionRequest, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension LocalAdoptionRequestQueryProperty on QueryBuilder<
    LocalAdoptionRequest, LocalAdoptionRequest, QQueryProperty> {
  QueryBuilder<LocalAdoptionRequest, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      adoptedAccommodationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adoptedAccommodation');
    });
  }

  QueryBuilder<LocalAdoptionRequest, bool, QQueryOperations>
      adoptedSterilizationWillingnessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adoptedSterilizationWillingness');
    });
  }

  QueryBuilder<LocalAdoptionRequest, AdoptionRequestStatus, QQueryOperations>
      adoptionStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adoptionStatus');
    });
  }

  QueryBuilder<LocalAdoptionRequest, int, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<LocalAdoptionRequest, bool, QQueryOperations>
      agreedToTermsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'agreedToTerms');
    });
  }

  QueryBuilder<LocalAdoptionRequest, List<String>, QQueryOperations>
      basicNecessitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'basicNecessities');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      completeAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completeAddress');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      completeCurrentAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completeCurrentAddress');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      contactNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactNumber');
    });
  }

  QueryBuilder<LocalAdoptionRequest, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<LocalAdoptionRequest, int, QQueryOperations>
      currenPetCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currenPetCount');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      emailAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailAddress');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      facebookLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'facebookLink');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      housingTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'housingType');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      idImageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idImageUrl');
    });
  }

  QueryBuilder<LocalAdoptionRequest, bool, QQueryOperations>
      isStudentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isStudent');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<LocalAdoptionRequest, int, QQueryOperations>
      oldestLivingPetAgeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oldestLivingPetAge');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      petActivityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'petActivity');
    });
  }

  QueryBuilder<LocalAdoptionRequest, int, QQueryOperations>
      petOwnershipDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'petOwnershipDuration');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      referralSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referralSource');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String?, QQueryOperations>
      regularVetClinicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regularVetClinic');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      remoteAnimalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteAnimalId');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      remoteUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUserId');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      restraintMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restraintMethod');
    });
  }

  QueryBuilder<LocalAdoptionRequest, String, QQueryOperations>
      statusIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusIndex');
    });
  }

  QueryBuilder<LocalAdoptionRequest, bool, QQueryOperations>
      sterilizationAwarenessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sterilizationAwareness');
    });
  }

  QueryBuilder<LocalAdoptionRequest, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
