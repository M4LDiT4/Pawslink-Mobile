enum FilterConditionType {
  //generic
  equals,
  notEquals,
  isNull,
  isNotNull,
  //string specific queries
  startsWith,
  endsWith,
  matches,
  contains,

  //number specific queries
  greaterThan,
  greaterThanOrEqual,
  lessThan,
  lessThanOrEqual,
  between,

  //list
  containsAll,
  containsAny,
  inList,
  notInList,

  //field
  exists
}