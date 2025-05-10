///@file : list_helpers.dart
///@description : provides functions to centralize list operations
///@usage : TListHelpers.function();
///@example : TListHelpers.removeDuplicates(list);
class TListHelpers{
  TListHelpers._();
  
  ///@description : remove duplicates from the list
  ///@args : {List<T>} list  -> list to remove duplicates from
  ///@return : {List<T>} -> list with no duplicates
  static List<T> removeDuplicates<T>(List<T> list){
    return list.toSet().toList();
  }

  ///@description : checks if array is empty or null
  ///@args : {List<T>} list -> list to check
  ///@return : {bool} -> is list empty or null?
  static bool isNullOrEmpty<T>(List<T>? list) {
    return list == null || list.isEmpty;
  }
  
  //@description: returns the first element of the list safely
  //@args : {List<T>} list -> list to get the first element from
  //@return : {T || null} -> returns null if list is empty and first element otherwise
  static T? safeFirst<T>(List<T> list) {
    return list.isEmpty ? null : list.first;
  }

  ///@description : retrieves the last element of the list safely
  ///@args : {List<T> } list -> list to get the last element from
  ///@return : {T || null} -> returns null if list is empty and null if otherwise
  T? safeLast<T>(List<T> list) {
    return list.isEmpty ? null : list.last;
  }

  ///@description: creates a list of lists with size defined by size
  ///@args : {List<T>} list -> list to divide to smaller chunks
  ///@args : {int} size -> size of the chucks (number of elements per chunk)
  ///@return : {List<List<T>>} -> returns a 2d array
  List<List<T>> chunk<T>(List<T> list, int size) {
    if (size <= 0) throw ArgumentError('Chunk size must be greater than 0');
    return [
      for (int i = 0; i < list.length; i += size)
        list.sublist(i, i + size > list.length ? list.length : i + size)
    ];
  }

  ///@description : reorders the list randomly
  ///@args : {List<T>} list -> list to reorder randomly
  ///@return : {List<T>} -> randomly reordered list
  List<T> shuffledCopy<T>(List<T> list) {
    final copy = List<T>.from(list);
    copy.shuffle();
    return copy;
  }

  ///@description : turns 2d array to a 1d array
  ///@args : {List<List<T>>} nestedList -> list to conver to 1d array\
  ///@return : {List<T>} -> 1d array
  List<T> flatten<T>(List<List<T>> nestedList) {
    return nestedList.expand((e) => e).toList();
  }
}