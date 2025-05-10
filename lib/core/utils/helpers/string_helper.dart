///@description : provides functions to simplify string operations
///@usage : TStringHelpers.function();
///@example : TStringHelpers.truncateText(text, maxLength);
///@note: usage of this class is highly recommended
class TStringHelpers {
  TStringHelpers._();

  ///@description : truncates texts with lengths longer than the specified maxleght
  ///@description : replaces extra characters with ...
  ///@arguments : {String} text -> text to truncate
  ///@arguments : {int} maxLength -> the max number of chars string could have
  ///@return : {String} -> returns the truncated text
  static String truncateText(String text, int maxLength){
    if(text.length <= maxLength){
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }

  ///@description : capitalizes the first letter and converts the remaining chars to lowercase
  ///@args : {String} input -> the string to capitalize
  ///@return : {String} -> returns the capitalized string
  static String capitalize(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  ///@description : capitalize words from a groupd of words
  ///@args : {String} input -> String to capitalize, ideally space seperated words
  ///@return : {String} -> returns capitalized String
  static String capitalizeWords(String input) {
    return input
        .split(' ')
        .map((word) => capitalize(word))
        .join(' ');
  }

  ///@description : removes extra spaces in strings
  ///@args : {String} input -> String input to remove extra strings
  ///@return : {String} -> returns a string with no extra spaces
  static String normalizeSpaces(String input) {
    return input.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  ///@description : hides strings in between by masking with asterisk (*)
  ///@args : {String} input -> String to mask
  ///@args : {int} visibleStart -> order of char to start masking
  ///@args : {int} visibleEnd -> order of char to stop masking
  ///@return : {String} -> masked string
  static String maskString(String input, {int visibleStart = 1, int visibleEnd = 1}) {
    if (input.length <= visibleStart + visibleEnd) return '*' * input.length;
    final start = input.substring(0, visibleStart);
    final end = input.substring(input.length - visibleEnd);
    return '$start${'*' * (input.length - visibleStart - visibleEnd)}$end';
  }
}
