void main() {
  // String to int
  String stringToInt = "6";
  int intResult = int.parse(stringToInt);
  print(intResult.runtimeType);

  // String to double
  String stringToDouble = "3.14";
  double doubleResult = double.parse(stringToDouble);
  print(doubleResult.runtimeType);

  // int to String
  int intToString = 7;
  String stringIntResult = intToString.toString();
  print(stringIntResult.runtimeType);

  // double to String
  double doubleToString = 3.14;
  String stringDoubleResult = doubleToString.toString();
  print(stringDoubleResult.runtimeType);

  // boolean to String
  bool booleanValue = true;
  String stringBoolResult = booleanValue.toString();
  print(stringBoolResult.runtimeType);

  // String to boolean
  String stringToBool = "true";
  bool boolResult = (stringToBool.toLowerCase() == 'true');
  print(boolResult.runtimeType);
}
