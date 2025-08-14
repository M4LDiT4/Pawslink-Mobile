class TEnumHelper{
  TEnumHelper._();

  static T enumFromString<T extends Enum>(List<T> values, String? value, {String? fieldName}) {
  if (value == null) {
    throw ArgumentError('Null enum value for ${fieldName ?? 'unknown field'}');
  }

  return values.firstWhere(
    (e) => e.name == value,
    orElse: () => throw ArgumentError('Invalid value "$value" for ${fieldName ?? 'enum'}'),
  );
}

}