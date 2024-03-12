void main() {
  var str1 = "This is a string.";
  print(str1.length);
  print(str1.toLowerCase());
  print(str1.toUpperCase());
  print(str1.contains(RegExp('a'), 0));

  //Number Data Types
  int numberOne = 12;
  double numberTwo = 2.55;
  print(numberOne / numberTwo);

  //exponentials
  var expNum = 1.2e4;
  print(expNum);

  //Type Check
  var stringNumber = "14.6";
  print(stringNumber.runtimeType);

  //converted type
  var convertedNumber = double.parse(stringNumber);
  print(convertedNumber.runtimeType);
}
