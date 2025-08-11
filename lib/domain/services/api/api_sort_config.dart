import 'package:mobile_app_template/core/enums/sort_order.dart';

class ApiSortConfig {
  SortOrder order;
  String field; //field to sort

  ApiSortConfig({
    required this.field,
    this.order = SortOrder.asc
  });

  Map<String, dynamic> toMap(){
    return {
      field: order.toString()
    };
  }

  factory ApiSortConfig.withDefaults(){
    return ApiSortConfig(field: "_id");
  }
}