void main() {
  print("Main function");
  double numOne = 5;
  double numTwo = 10;

  double result = sumFunction(numOne, numTwo);
  print("Sum of $numTwo and $numOne is $result");
}

double sumFunction(double x, double y) {
  return x + y;
}
