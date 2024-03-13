void main() {
  //STATIC TYPING
  var num = 10;
  // num = "10";  // error due to static type
  print(num);

  // Dynamic type
  dynamic numTwo = 20;
  numTwo = "20";
  print(numTwo);
}
