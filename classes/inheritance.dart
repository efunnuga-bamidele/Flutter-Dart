class Animal {
  void eat() {
    print("Animal is eating!");
  }
}

//Normal dog class
// class Dog {
//   void bark() {
//     print("Dog is barking!");
//   }
// }

//Dog class inherits from Animal
class Dog extends Animal {
  void bark() {
    print("Dog is barking!");

    //call the inherited method without overriding it using super keywoard
    super.eat();
  }

  //Overide a parent method inherited
  @override
  void eat() {
    print("Dog is eating!");
  }
}

void main() {
  Dog myDog = new Dog();
  myDog.bark();
  myDog.eat();
}
