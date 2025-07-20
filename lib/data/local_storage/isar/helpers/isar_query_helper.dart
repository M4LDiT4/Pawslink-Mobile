import 'package:isar/isar.dart';

class IsarQueryHelper {
  IsarQueryHelper._();

  /// ## buildQuery 
  /// Constructs custom Isar queries
  /// 
  /// This method:
  /// - constructs an Isar query from the given where clauses, filtering, sorting and pagination options
  /// 
  /// ### Parameters
  /// - **[collection]**: Isar collection where the query will be applied
  /// - **[whereClauses]**: Optional list of WhereClauses
  /// - **[filters]**: Optional list of FilterConditions combined with `FilterGroup.and`
  /// - **[sorts]**: Optional list of SortProperty for sorting
  /// - **[offset]**: Optional offset for pagination
  /// - **[limit]**: Optional limit for pagination
  /// 
  /// ### Returns 
  /// A [Query] object that is a constructed query from the given query parameters
  static Query<T> buildQuery<T>({
    required IsarCollection<T> collection,
    List<WhereClause> whereClauses = const[],
    List<FilterCondition>? filters,
    List<SortProperty> sorts = const[],
    int? offset,
    int? limit,
  }) {
    return collection.buildQuery(
      whereClauses: whereClauses,
      filter: filters != null && filters.isNotEmpty
          ? FilterGroup.and(filters)
          : null,
      sortBy: sorts,
      offset: offset,
      limit: limit,
    );
  }
}
