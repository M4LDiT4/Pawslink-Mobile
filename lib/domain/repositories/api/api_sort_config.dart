import 'package:mobile_app_template/core/enums/sort_order.dart';

/// ### ApiSortConfig
/// Generates and serializes sort configurations
class ApiSortConfig {
  SortOrder order; //order of sort (e.g `ascending` or `descending)
  String field; //field to sort

  ApiSortConfig({
    required this.field,
    this.order = SortOrder.asc
  });

  /// Generates a map of the sort config for easier data transer through requests
  /// ### Return
  /// A [Map] with key [String] and value [dynamic] that represents the JSON representation of the sort config
  Map<String, dynamic> toMap(){
    return {
      field: order.toString()
    };
  }

  factory ApiSortConfig.withDefaults(){
    return ApiSortConfig(field: "_id");
  }
}