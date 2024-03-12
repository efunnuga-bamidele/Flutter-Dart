void main() {
  var employees = {"David": 10, "John": 20, "Sarah": 30};
  print(employees);
  print(employees['David']);
  print(employees['Sarah']);
  print(employees['John']);

  // add new item
  employees['Andrew'] = 40;
  print(employees);
}
