void main() {
//   Given the Map below:
  var employees = {
    // Key:    Value
    'David': 10,
    'Claire': 5,
    'Calvin': 3
  };
  print(employees);
// Figure out how to remove key Calvin from the Map
// and set it's value (3) as a variable
  var deletedVal = employees.remove('Calvin');
  print(deletedVal);
  print(employees);
}
