import 'package:mobile_app_template/core/enums/filter_condition_type.dart';

class ApiFilterConfig {
  final FilterConditionType condition;
  final dynamic value;
  final String field;

  ApiFilterConfig(this.condition, this.value, this.field) {
    _validate();
  }

  // Named constructor for equality
  ApiFilterConfig.equals(this.field, this.value)
    : condition = FilterConditionType.equals {
      _validate();
    }

  // Named constructor of non equality
  ApiFilterConfig.notEquals(this.field, this.value)
    :condition = FilterConditionType.notEquals {
      _validate();
    }
  // Named constructor for null values 
  ApiFilterConfig.isNull(this.field)
    :condition = FilterConditionType.isNull,
    value = null {
      _validate();
    }
  //named constructor for null values
  ApiFilterConfig.isNotNull(this.field)
    :condition = FilterConditionType.isNotNull,
    value = null{
      _validate();
    }

  // Named constructor for "startsWith" strings
  ApiFilterConfig.startsWith(this.field, String prefix)
      : value = prefix,
        condition = FilterConditionType.startsWith {
    _validate();
  }

  //Named constructor for "endsWith" strings
  ApiFilterConfig.endsWith(this.field, String suffix)
      : value = suffix,
        condition = FilterConditionType.endsWith {
    _validate();
  }
  // Named constructor for the "matches" strings
  ApiFilterConfig.matches(this.field, String pattern)
      : value = pattern,
        condition = FilterConditionType.matches {
    _validate();
  }

  // Named constructor for the "contains" strings
  ApiFilterConfig.contains(this.field, String string)
      : value = string,
        condition = FilterConditionType.startsWith {
    _validate();
  }

  // Named constructor for numeric comparisons
  ApiFilterConfig.greaterThan(this.field, num number)
      : value = number,
        condition = FilterConditionType.greaterThan {
    _validate();
  }

  // Named constructor for greater than or equal
  ApiFilterConfig.greaterThanOrEqual(this.field, num number)
      : value = number,
        condition = FilterConditionType.greaterThanOrEqual {
    _validate();
  }

  // Named constructor for less than
  ApiFilterConfig.lessThan(this.field, num number)
      : value = number,
        condition = FilterConditionType.lessThan {
    _validate();
  }
  // Named constructor for less than or equal
  ApiFilterConfig.lessThanOrEqual(this.field, num number)
      : value = number,
        condition = FilterConditionType.lessThanOrEqual {
    _validate();
  }
  // Named constructor for between
  ApiFilterConfig.between(this.field, Iterable range)
      : value = range,
        condition = FilterConditionType.between {
    _validate();
  
  }
  // Named constructor for contains all
  ApiFilterConfig.containsAll(this.field, Iterable items )
      : value = items,
        condition = FilterConditionType.containsAll {
    _validate();
  }

  // Named constructor for contains any
  ApiFilterConfig.containsAny(this.field, Iterable items)
      : value = items,
        condition = FilterConditionType.containsAny {
    _validate();
  }

  // Named constructor for in list
  ApiFilterConfig.inList(this.field, Iterable items)
      : value = items,
        condition = FilterConditionType.inList {
    _validate();
  }

  // Named constructor for not in list
  ApiFilterConfig.notInList(this.field, Iterable items)
      : value = items,
        condition = FilterConditionType.notInList {
    _validate();
  }

  // Named constructor for exists
  ApiFilterConfig.exists(this.field, this.value)
    :condition = FilterConditionType.exists {
    _validate();
  }
  void _validate() {
    if (
      condition == FilterConditionType.startsWith ||
      condition == FilterConditionType.endsWith ||
      condition == FilterConditionType.contains ||
      condition == FilterConditionType.matches
    ) {
      if (value is! String) {
        throw FormatException("Expects `String` but received ${value.runtimeType}");
      }
    }
    else if (
      condition == FilterConditionType.greaterThan ||
      condition == FilterConditionType.greaterThanOrEqual ||
      condition == FilterConditionType.lessThan ||
      condition == FilterConditionType.lessThanOrEqual
    ) {
      if (value is! num) {
        throw FormatException("Expects a numeric type but received ${value.runtimeType}");
      }
    }
    else if (
      condition == FilterConditionType.inList ||
      condition == FilterConditionType.notInList ||
      condition == FilterConditionType.containsAll ||
      condition == FilterConditionType.containsAny
    ) {
      if (value is! Iterable) {
        throw FormatException("Expects an Iterable but received ${value.runtimeType}");
      }
    }
    else if (condition == FilterConditionType.between) {
      if (value is! Iterable || value.length != 2) {
        throw FormatException("Expects an Iterable of length 2 for range but got ${value.runtimeType}");
      }
      final list = value.toList();
      if (list[0] is! num || list[1] is! num) {
        throw const FormatException("Both range values must be numeric");
      }
    }
    else if (condition == FilterConditionType.isNull || condition == FilterConditionType.isNotNull) {
      if (value != null) {
        throw const 
        FormatException("No value expected for null check");
      }
    }
    else if (condition == FilterConditionType.exists) {
      if (value != null && value is! bool) {
        throw const FormatException("Expects a boolean value or null for 'exists'");
      }
    }
  }
}