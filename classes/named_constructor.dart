class Person {
  String name = 'default';
  int age = 0;

  Person.fromMap(Map myMap) {
    name = myMap['name'];
    age = myMap['age'];
  }
}

void main() {
  Map personMap = {'name': 'Bamidele', 'age': 34};
  Person person1 = Person.fromMap(personMap);

  print(person1.name);
  print(person1.age);
}
