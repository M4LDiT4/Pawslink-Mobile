import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/isar_filter_helper.dart';


///creates a dynamic query based on an Isar collection
///@param collection - Isar collection where the query will be done
///
///@param whereClause - list of WhereClause expression
///
///@param filterGroup - group of filter expression
///
///@param sortBy - list of sort expressions
///
///@param offset - number of documents to skip
///
///@param limit - the maximum number of documents to return
Future<List<T>> buildDynamicQuery<T>({
  required IsarCollection<T> collection,
  List<WhereClause>? whereClauses,
  FilterGroup? filterGroup,
  List<SortProperty>? sortBy,
  int? offset,
  int? limit,
}) async {
  final query = collection.buildQuery(
    whereClauses: whereClauses ?? [],
    filter: filterGroup,
    sortBy: sortBy ?? [],
    offset: offset,
    limit: limit,
  );

  return query.findAll() as List<T>;
}

///checks if the given strategy for filtering is valid for the given type
///@param strategy - strategy to use in filtering; see FilterConditionType for list of strategy
///@param type - type of value used for filtering
/// -number - for number based values
/// -string - for string values
/// -listNum - for list of numbers (ideally with length of 2)
/// -listString - for list of strings
bool checkIfFilterStrategyValid(FilterConditionType strategy, ValueType type){
  if(
    strategy == FilterConditionType.equalTo 
    || strategy == FilterConditionType.isNotNull 
    || strategy == FilterConditionType.isNull 
  ){
    return true;
  }

  if(type == ValueType.number){
    switch(strategy){
      case FilterConditionType.greaterThan:
        return true;
      case FilterConditionType.lessThan:
        return true;
      default:
        return false;
    }
  }else if(type == ValueType.string){
    switch(strategy){
      case FilterConditionType.contains:
        return true;
      case FilterConditionType.startsWith:
        return true;
      case FilterConditionType.endsWith:
        return true;
      case FilterConditionType.matches:
        return true;
      default: 
        return false;
    }
  }else if(type == ValueType.listNum){
    if(strategy == FilterConditionType.between){
      return true;
    }
    return false;
  }else{
    throw FormatException("strategy ${strategy.toString()} or ${type.name} is not valid");
  }
}



