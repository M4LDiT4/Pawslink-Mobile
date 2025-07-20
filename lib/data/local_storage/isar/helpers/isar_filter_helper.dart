
import 'package:isar/isar.dart';

///```
///dart
///enum FilterValueType {
///string,
///num,
///listNum
///}
///```
enum FilterValueType {
  string,
  num,
  dateTime,
  bool,
  listNum
}

/// ## DynamicIsarFilter
/// A class for representing a self-sufficient filtering operation for Isar
/// 
/// This Class:
/// - creates a [DynamicIsarFilter] object
/// - checks if given value and filter strategy is compatible
/// - supports all filtering strategy for Isar
/// 
/// ### properties
/// - **[value]**: value that will be used for comparison in filtering process
/// - **[strategy]**: the method of filtering
/// - **[include1]**: determines if the given value is considered in filtering. 
/// Used only in `FilterConditionType.greaterThan` and `FilterConditionType.lessThan`
/// - **[include2]**: determines if the upper and lowerbound will be included in the sorting comparison
/// Used only in `FilterConditionType.between` together with [include1]
/// 
/// ### Methods
/// - **[isStrategyValid]**: checks if the given strategy is compatible with the value 
class DynamicIsarFilter<T> {
  final T value;
  final FilterConditionType strategy;
  final bool include1;
  final bool include2;
  final bool isCaseSensitive;
  String? _property;

  DynamicIsarFilter({
    required this.value,
    required this.strategy,
    String? property,
    this.include1 = false,
    this.include2 = false,
    this.isCaseSensitive = false
  }): _property = property;

  /// ### isStrategyValid
  /// Checks if the given [strategy] is compatible with the [value]
  /// 
  /// This method:
  /// - supports [String], [num] and [List] of [num]
  /// ## Returns
  /// A [bool], true if [strategy] and [value] are compatible otherwise false
  bool isStrategyValid() {
    if (value is String) {
      return _stringCompatibleStrategies.contains(strategy);
    } else if (value is num) {
      return _numberCompatibleStrategies.contains(strategy);
    } else if (value is DateTime) {
      return _dateCompatibleStrategies.contains(strategy);
    } else if (value is bool) {
      return _boolCompatibleStrategies.contains(strategy);
    } else if (value is List<num> && strategy == FilterConditionType.between) {
      return true;
    }
    return false;
  }
  /// ## getType
  /// Determines the type of the value. Types are defined by [FilterValueType]
  /// 
  /// ### Returns
  /// [FilterValueType] that represents the type of the value
  FilterValueType getType(){
    if(value is String){
      return FilterValueType.string;
    }else if(value is num){
      return FilterValueType.num;
    }else if(value is DateTime){
      return FilterValueType.dateTime;
    }else if (value is bool){
      return FilterValueType.bool;
    }
    else{
      return FilterValueType.listNum;
    }
  }
  /// ## getValue1
  /// Returns the value for the value1 property of [Isar]'s [FilterCondition]
  /// 
  /// This method:
  /// - determines the filtering strategy
  /// - retrieve the value1 from the [value] property using method specific for [strategy] property
  /// 
  /// ### Throws
  /// - [Exception] when the type of [value] is [List] and its length is not `2`
  /// 
  /// ### Returns
  /// [Object] that represents the value1
  Object getValue1(){
    if(strategy == FilterConditionType.between){
      final parsedList = value as List;
      if(parsedList.length != 2){
        throw Exception('value of type List<num> has length of ${parsedList.length}, program expects: 2');
      }
      return parsedList[0] as Object;
    }return value as Object;
  }

  /// ## getValue2
  /// Return the value for the value2 property for [Isar]'s [FilterCondition]
  /// 
  /// This method:
  /// - checks the [strategy]
  /// - retrieves the value2 based on the [value] and [strategy] properties
  Object? getValue2(){
    if(strategy == FilterConditionType.between){
      final parsedList = value as List;
      if(parsedList.length != 2){
        throw Exception('value of type List<num> has length of ${parsedList.length}, program expects: 2');
      }
      return parsedList[0] as Object;
    }
    return null;
  }

  /// list of [FilterConditionType]s that are compatible with string-based filtering
  static const _stringCompatibleStrategies = {
    FilterConditionType.equalTo,
    FilterConditionType.startsWith,
    FilterConditionType.endsWith,
    FilterConditionType.contains,
  };
  /// list of [FilterConditionType]s that are compatible with number-based filtering
  static const _numberCompatibleStrategies = {
    FilterConditionType.equalTo,
    FilterConditionType.lessThan,
    FilterConditionType.greaterThan,
    FilterConditionType.between,
  };
  /// list of [FilterConditionType]s that are compatible with date-based filtering
  static const _dateCompatibleStrategies = {
    FilterConditionType.equalTo,
    FilterConditionType.lessThan,
    FilterConditionType.greaterThan,
    FilterConditionType.between,
  };
  /// list of [FilterConditionType]s that are compatible with bool-based filtering
  static const _boolCompatibleStrategies = {
    FilterConditionType.equalTo,
  };

  ///set the field where the filter will be applied
  set property(String property){
    _property = property;
  }

  ///get the [_property] value
  ///throws a StateError when the property is not provide (is null)
  String get property{
    if(_property == null){
     throw StateError('DynamicIsarFilter: property has not been set. Use `.property = "fieldName"` before generating filter.');
    }
    return _property!;
  }

  /// ## generateFilterCondition
  /// Generates a [FilterCondition] using the provided data
  /// 
  /// This method:
  /// - checks if the given strategy is valid
  /// - retrieves the value for value1 property of [Isar]'s [FilterCondition]
  /// - retrieves the value for the value2 property of [Isar]'s [FilterCondition]
  /// - build the final [FilterCondition] object
  /// ### Throws
  /// - [StateError] when [_property] is not defined before building the [FilterCondition]
  /// = [FormatException] when [strategy] is not compatible with [value]
  /// ### Returns
  /// [FilterCondition] object from the data provided from the [DynamicIsarFilter] object
  FilterCondition generateFilterCondition () {
    if(!isStrategyValid()){
      throw FormatException('strategy ${strategy.toString()} is not compatible with value type: ${getType().toString()}');
    }
    return FilterCondition(
      type: strategy, 
      property: property,
      value1: getValue1(),
      value2: getValue2(), 
      include1: include1, 
      include2: include2, 
      caseSensitive: isCaseSensitive
    );
  }
}

