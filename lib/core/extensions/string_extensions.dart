
extension EnumParsing on String {
  T enumFromString<T>(List<T> values){
    return values.firstWhere((e) => e.toString().split(".").last.replaceAll("_", " ").toLowerCase() == toLowerCase());
  }
}