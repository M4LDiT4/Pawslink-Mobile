
import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/isar_helper.dart';

enum ValueType {string, number, listNum, listString}

///@class for creating dynamic filter objects
///@property value -value that will be used to determine which document will be included
///
///@property strategy -strategy to use in filtering (see FilterConditionType for more info)
///
///@property include1 (optional) -used for list of number. Determines if the lowerbound value is included in the filtered documents
///
///@property include2 (optional) -used for list of number. Determines if the upperbound value is included in the filtered documents
///
///@method getValueType -used to get the data type of the @value property
class DynamicFilter<T>{
  T value;
  FilterConditionType strategy;
  String property;
  bool include1;
  bool include2;
  DynamicFilter({
    required this.value,
    required this.property,
    required this.strategy,
    this.include1 = false,
    this.include2 = false,
  });

  ///@method getValueType
  ///
  ///@description -used to get the datatype of the @value property
  ///
  ///@return ValueType if datatype of the @value property is included in the ValueType enum, otherwise null
  ///
  ///see ValueType enum for list of supported datatypes
  ValueType? getValueType(){
    if(value is String){
      return ValueType.string;
    }else if(value is num){
      return ValueType.number;
    }else if(value is List){
      final list = value as List;
      if(list.isEmpty) null;

      if(list.every((e) => e is String)){
        return ValueType.listString;
      }

      if(list.every((e) => e is num)){
        return ValueType.listNum;
      }
    }
    return null;
  }
}

///@class IsarFilterHelper
///@description -helper class for isar filter operations
///
///@method (static) buildStringFilterCondition - generates a FilterCondition for String values
///
///@method (static) buildNumFilterCondition -generates a FilterCondition for number based values
class IsarFilterHelper {
  IsarFilterHelper._();
  ///@method buildStringFilterCondition
  ///
  ///@description - generates a FilterCondition strictly for String values only
  ///
  ///@param filter - contains the metadata for the filter operations (see @DynamicFilterClass for more info)
  ///
  ///@param isCaseSensitive -determines if the filter operation for string is case-sensitive
  ///
  ///@throws FormatException if passed @param filter does not contain a valid string value
  ///
  ///@throws FormatException if passed @param filter does not have a compatible strategy to its value
  ///
  ///@return FilterCondition for dynamic isar queries
  static FilterCondition buildStringFilterCondition(
    DynamicFilter<String> filter,
    bool isCaseSensitive,
  ){
    if(filter.getValueType() != ValueType.string){
      throw FormatException('value ${filter.value.toString()} is not of type ${ValueType.string.name}');
    }
    if(!checkIfFilterStrategyValid(filter.strategy, ValueType.string)){
      throw FormatException('strategy ${filter.strategy.toString()} is not compatible with ${ValueType.string.name}');
    }

    final strategy = filter.strategy;
    dynamic finalVal = filter.value;
    bool include = true;
    if(strategy == FilterConditionType.isNotNull || strategy == FilterConditionType.isNull){
      include = false;
      finalVal = null;
    }

    return FilterCondition(
      type: filter.strategy, 
      property: filter.property,
      value1: finalVal,
      value2: null, //not relevant to string filters
      include1: include, 
      include2: false, //not relevant to string filters
      caseSensitive: isCaseSensitive
    );
  }

  ///@method _buildSingleNumFilterCondition
  ///
  ///@description -generates a FilterCondition for number based values
  ///
  ///@param fitler -contains the metadata for the filter operations (see @DynamicFilterClass for more info)
  ///
  ///@throws FormatException if passed @param filter does not contain a valid string value
  ///
  ///@throws FormatException if passed @param filter does not have a compatible strategy to its value
  ///
  ///@return FilterCondition for dynamic isar queries
  static FilterCondition _buildSingleNumFilterCondition(
    DynamicFilter<num> filter,
  ){
    if(filter.getValueType() != ValueType.number){
      throw Exception('value ${filter.value.toString()} is not a number');
    }
    if(!checkIfFilterStrategyValid(filter.strategy, ValueType.number)){
      throw FormatException('strategy ${filter.strategy.name} is not compatible with ${ValueType.number.name}');
    }

    return FilterCondition(
      type: filter.strategy, 
      property: filter.property,
      value1: filter.value, 
      include1: filter.include1, 
      include2: false, 
      caseSensitive: false
    );
  }

  ///@method _buildDoubleNumFilterCondtion
  ///
  ///@description -generates a FilterCondition for list of num values
  ///
  ///@param filter -contains the metadata for the filter operations (see @DynamicFilterClass for more info)
  ///
  ///@throws FormatException if passed @param filter does not contain a valid string value
  ///
  ///@throws FormatException if passed @param filter does not have a compatible strategy to its value
  ///
  ///@throws FormatException if passed @param value is a list with length not exactly 2
  ///
  ///@return FilterCondition for dynamic isar queries
  static FilterCondition _buildDoubleNumFilterCondition(
    DynamicFilter<List<num>> filter,
  ){
    if(filter.getValueType() != ValueType.listNum){
      throw FormatException("value ${filter.value.toString()} is not list of number");
    }
    if(checkIfFilterStrategyValid(filter.strategy, ValueType.listNum)){
      throw FormatException("strategy ${filter.strategy.toString()} is not compatible with ${ValueType.listNum.name}");
    }

    final value = filter.value;

    if(value.length != 2) {
      throw FormatException("length of value is ${filter.value.length}, expected is 2");
    }

    final value1 = value.reduce((a, b) => a < b? a : b);
    final value2 = value.reduce((a, b) => a > b? a : b);

    return FilterCondition(
      type: filter.strategy, 
      property: filter.property,
      value1: value1,
      value2: value2, 
      include1: filter.include1, 
      include2: filter.include2, 
      caseSensitive: false
    );
  }

  ///@method buildNumFilterCondition
  ///
  ///@description -generates FilterCondition for number-based filtering operations 
  ///
  ///@param filter --contains the metadata for the filter operations (see @DynamicFilterClass for more info)
  ///
  ///@throws FormatException if passed @param filter does not contain a valid string value
  ///
  ///@throws FormatException if passed @param filter does not have a compatible strategy to its value
  ///
  ///@throws FormatException if passed @param value is a list with length not exactly 2
  ///
  ///@return FilterCondition for dynamic isar queries
  static FilterCondition buildNumFilterCondition(
    DynamicFilter filter,
  ){
    if(filter.strategy == FilterConditionType.between){
      //parse to type List<num> as we expect between to have a list of num as value
      return _buildDoubleNumFilterCondition(filter as DynamicFilter<List<num>>);
    }
    //parse to num as number filter operations except for between requires num as data type of the value
    return _buildSingleNumFilterCondition(filter as DynamicFilter<num>);
  }
}