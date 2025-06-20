import 'dart:convert';

class TMapHelpers{
  TMapHelpers._();

  static stringifyDynamicMap(Map<String, dynamic> map){
    return map.map((key, value){
      return MapEntry(
        key, 
        value is List? json.encode(value) : value.toString()
      );
    });
  }
}