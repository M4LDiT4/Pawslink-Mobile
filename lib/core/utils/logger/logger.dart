///@description : logger utility function for clearer log messages
///@example : TLogger.debug(message);
import 'package:logger/web.dart';

class TLogger{
  TLogger._();

  ///@description : singleton instance of Logger
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug
  );

  ///@description : logger for debug
  ///@args : {String} message -> String message to log
  ///@return : {void}
  static void debug(String message){
    _logger.d(message);
  }

  ///@description : logger for info
  ///@args : {String} message -> String message to log
  ///@return : {void}
  static void info(String message){
    _logger.i(message);
  }

  ///@description : logger for warning
  ///@args : {String} message -> String message to log
  ///@return : {void}
  static void warning(String message){
    _logger.w(message);
  }

  ///@description : logger for error
  ///@args : {String} message -> String message to log
  ///@args : {[dynamic]} error -> error that occurred
  static void error(String message, [dynamic error]){
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }
}