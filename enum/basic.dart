enum Meal {
  breakfast,
  lunch,
  dinner,
}

void main() {
  var todaysMeal = Meal.lunch;

  if (todaysMeal == Meal.breakfast) {
    print('I am having a breakfast!');
  } else if (todaysMeal == Meal.lunch) {
    print('I am having a lunch!');
  } else if (todaysMeal == Meal.dinner) {
    print('I am having a dinner!');
  }
}
