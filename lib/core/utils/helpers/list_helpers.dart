import 'dart:convert';

/// A utility class for list operations.
///
/// Use this to centralize logic related to lists.
/// Example usage: `TListHelpers.removeDuplicates(list);`
class TListHelpers {
  TListHelpers._();

  /// Removes duplicates from a list.
  ///
  /// Returns a new list with only unique elements.
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// Checks if a list is null or empty.
  ///
  /// Returns `true` if the list is either null or has no elements.
  static bool isNullOrEmpty<T>(List<T>? list) {
    return list == null || list.isEmpty;
  }

  /// Returns the first element of the list safely.
  ///
  /// Returns `null` if the list is empty.
  static T? safeFirst<T>(List<T> list) {
    return list.isEmpty ? null : list.first;
  }

  /// Returns the last element of the list safely.
  ///
  /// Returns `null` if the list is empty.
  static T? safeLast<T>(List<T> list) {
    return list.isEmpty ? null : list.last;
  }

  /// Divides a list into chunks of a given size.
  ///
  /// Returns a 2D list where each inner list has a maximum of [size] elements.
  /// Throws an [ArgumentError] if [size] is less than or equal to 0.
  static List<List<T>> chunk<T>(List<T> list, int size) {
    if (size <= 0) throw ArgumentError('Chunk size must be greater than 0');
    return [
      for (int i = 0; i < list.length; i += size)
        list.sublist(i, i + size > list.length ? list.length : i + size)
    ];
  }

  /// Returns a randomly shuffled copy of the list.
  static List<T> shuffledCopy<T>(List<T> list) {
    final copy = List<T>.from(list);
    copy.shuffle();
    return copy;
  }

  /// Flattens a 2D list into a 1D list.
  static List<T> flatten<T>(List<List<T>> nestedList) {
    return nestedList.expand((e) => e).toList();
  }

  /// Parses a dynamic value into a list of strings.
  ///
  /// Supports values that are either a JSON-encoded string or a List.
  /// Returns an empty list if parsing fails or value is invalid.
  static List<String> parseStringList(dynamic value) {
    if (value is String) {
      try {
        final decoded = jsonDecode(value);
        if (decoded is List) {
          return decoded.map((e) => e.toString()).toList();
        }
      } catch (_) {
        // Optionally log the error or handle parsing failure
      }
    } else if (value is List) {
      return value.map((e) => e.toString()).toList();
    }
    return [];
  }
}
