import 'package:mobile_app_template/core/enums/general_data_types.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/domain/entities/base_dto.dart';


/// ## SerializationUtility
/// Utility class that processes an input to generate an easily serializable (e.g using jsonEncode) data
class SerializationUtility {

  SerializationUtility._();
  
  /// Serializes an [Iterable]
  /// ### Parameters
  /// - **[iterable]**: an [Iterable] that contains the data to serialize
  /// ### Returns
  /// [List] from the provided [Iterable]
  /// 
  /// ### Note:
  /// - Returns a [List] instead of [Iterable] as it is assumed that the data from this function will 
  /// be used as an argument for [jsonEncode]
  /// - allows only primitive items and objects that extends [BaseDto]
  /// - type of [List] is not enforced, therefore items within the returned list can have varied types
  static Iterable serializeIterableData(Iterable iterable){
    List valueList = iterable.toList();
    List result = [];
    for(var item in valueList){
      switch(getGenericDataType(item)){
        // primitives are good to go
        case GeneralDataTypes.isPrimitive:
          result.add(item);
          break;
        // check if object can be serialized
        case GeneralDataTypes.isObject:
          result.add(serializeObject(item));
          break;
        // log the items that cannot be serialized
        //remove in production
        default:
          TLogger.warning("cannot serialize non primitive or object list items");
          break;  
      }
    }
    return result;
  }

  /// Converts an object to a [Map] with key [String] and value [dynamic]
  /// ### Parameters
  /// - **[obj]**: object to serialize
  /// ### Return
  /// A [Map] with key [String] and value [dynamic] that represents the JSON form of the object
  /// ### Note
  /// - serializes only objects that extends BaseDto object
  static Map<String, dynamic> serializeObject(Object obj){
    if(obj is! BaseDto){
      throw Exception("Cannot convert object to map: No toMapMethod. Please extend BaseDto");
    }
    return obj.toMap();
  }

  /// Determines the `generic` type of the passed value
  /// ### Parameters
  /// - **[dynamicVar]**: variable to check the type
  /// ### Return
  /// Type of within the [GeneralDataTypes] enum
  /// ### Notes
  /// - This only divides primitives, iterables, no values and objects in general
  static GeneralDataTypes getGenericDataType(dynamic dynamicVar){
    if(dynamicVar == null){
      return GeneralDataTypes.isNoValue;
    }
    else if (dynamicVar is int
      ||dynamicVar is double 
      ||dynamicVar is String 
      ||dynamicVar is bool 
    ) {
      return GeneralDataTypes.isPrimitive;
    }else if (
      dynamicVar is List 
      ||dynamicVar is Map 
      ||dynamicVar is Set
    ){
      return GeneralDataTypes.isPrimitive;
    }

    return GeneralDataTypes.isObject;
  }
}