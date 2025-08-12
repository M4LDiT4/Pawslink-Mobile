import 'package:mobile_app_template/core/enums/general_data_types.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/domain/entities/base_dto.dart';

class SerializationUtility {

  SerializationUtility._();
  
  static Iterable serializeIterableData(Iterable iterable){
    List valueList = iterable.toList();
    List result = [];
    for(var item in valueList){
      switch(getGenericDataType(item)){
        case GeneralDataTypes.isPrimitive:
          result.add(item);
          break;
        case GeneralDataTypes.isObject:
          result.add(serializeObject(item));
          break;
        default:
          TLogger.warning("cannot serialize non primitive or object list items");
          break;  
      }
    }
    return result;
  }

  static Map<String, dynamic> serializeObject(Object obj){
    if(obj is! BaseDto){
      throw Exception("Cannot convert object to map: No toMapMethod. Please extend BaseDto");
    }
    return obj.toMap();
  }

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