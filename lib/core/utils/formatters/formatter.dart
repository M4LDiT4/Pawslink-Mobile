///@file : formatter.dart
///@description : responsible for formatting values to human readable strings
///@note : usage of this function is highly recommended
///@usage : TFormatter.function();
///@example : TFormatter.formatDate(date);
///
import 'package:intl/intl.dart';

class TFormatter {
  TFormatter._();

  //@descriptionformats DateTime to human readably date string
  //@args {string} date -> DateTime to format to date string
  static String formatDate(DateTime? date){
    date??=DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  //@description : formats phone number to human readable Philippine phone number
  //@args : {string} input -> phone number string to format, supports phone numbers starting with 63, 9 and 09
  //@note : if phone number does not start with 63, 9, 09, it will return the original input, stripped of non number chars
  static String formatPhilippinePhoneNumber(String input) {
    // Remove all non-digit characters
    String digits = input.replaceAll(RegExp(r'\D'), '');

    if (digits.startsWith('63')) {
      // +63 format
      if (digits.length >= 12) {
        return '+63 ${digits.substring(2, 5)} ${digits.substring(5, 8)} ${digits.substring(8, 12)}';
      }
    } else if (digits.startsWith('9')) {
      // Local mobile number without 0
      if (digits.length >= 10) {
        return '0${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6, 10)}';
      }
    } else if (digits.startsWith('09')) {
      // 09 format
      if (digits.length >= 11) {
        return '${digits.substring(0, 4)} ${digits.substring(4, 7)} ${digits.substring(7, 11)}';
      }
    }
    // Fallback: return original input if format not matched
    return input;
  } 

  //@description : formats value to value with Philippine peso prefix
  //@args : {num} amount -> value to format
  static String formatToPeso(num amount) {
    final formatCurrency = NumberFormat.currency(locale: 'en_PH', symbol: '₱');
    return formatCurrency.format(amount);
  }


}