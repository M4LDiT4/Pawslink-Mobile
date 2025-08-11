

import 'package:mobile_app_template/core/enums/filter_condition_type.dart';

class ApiFilterConfig {
  FilterConditionType type;
  dynamic value;
  String field;

  ApiFilterConfig(
    this.type,
    this.value,
    this.field
  ) {
    // String-only checks
    if (
      type == FilterConditionType.startsWith ||
      type == FilterConditionType.endsWith ||
      type == FilterConditionType.contains ||
      type == FilterConditionType.matches
    ) {
      if (value is! String) {
        throw FormatException(
          "Expects `String` but received ${value.runtimeType}",
        );
      }
    }
    // Equality checks (equals, notEquals) can accept any value, so no strict type check needed

    // Numeric comparisons
    else if (
      type == FilterConditionType.greaterThan ||
      type == FilterConditionType.greaterThanOrEqual ||
      type == FilterConditionType.lessThan ||
      type == FilterConditionType.lessThanOrEqual
    ) {
      if (value is! num) {
        throw FormatException(
          "Expects a numeric type (int or double) but received ${value.runtimeType}",
        );
      }
    }
    // `inList` and `notInList` expect Iterable (List, Set, etc.)
    else if (
      type == FilterConditionType.inList ||
      type == FilterConditionType.notInList ||
      type == FilterConditionType.containsAll ||
      type == FilterConditionType.containsAny
    ) {
      if (value is! Iterable) {
        throw FormatException(
          "Expects an Iterable (e.g., List) but received ${value.runtimeType}",
        );
      }
    }
    // between expects a List or Iterable with exactly 2 numeric values (range)
    else if (type == FilterConditionType.between) {
      if (value is! Iterable || value.length != 2) {
        throw FormatException(
          "Expects an Iterable of length 2 for range but received ${value.runtimeType} with length ${value is Iterable ? value.length : 'N/A'}",
        );
      }
      final iter = value.iterator;
      iter.moveNext();
      final first = iter.current;
      iter.moveNext();
      final second = iter.current;
      if (first is! num || second is! num) {
        throw FormatException(
          "Both range values must be numeric but received ${first.runtimeType} and ${second.runtimeType}",
        );
      }
    }
    // isNull, isNotNull, exists do not expect any value or expect bool for exists maybe
    else if (
      type == FilterConditionType.isNull ||
      type == FilterConditionType.isNotNull
    ) {
      // Usually no value is required for null checks; ignore or allow null
      if (value != null) {
        throw FormatException(
          "No value expected for null check but received $value",
        );
      }
    }
    else if (type == FilterConditionType.exists) {
      // Some implementations expect a bool indicating existence or not
      if (value != null && value is! bool) {
        throw FormatException(
          "Expects a boolean value or null for 'exists' but received ${value.runtimeType}",
        );
      }
    }
    // Fallback: no validation, allow any type
  }
}
