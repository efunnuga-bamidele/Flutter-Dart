class Person {
  String name = "default";
  int age = 0;

  void introduce() {
    print('Hello my name is $name and i am $age years old!');
  }
}

void main() {
  Person person = new Person();
  person.name = "Bamidele Efunnuga";
  person.age = 20;

  person.introduce();
}
