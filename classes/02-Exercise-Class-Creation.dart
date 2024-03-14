// Define a class called BankAccount
class BankAccount {
  //TO DO: CREATE AN INSTANCE VARIABLE CALLED
  // BALANCE WITH A DEFAULT VALUE OF ZERO
  double balance = 0.0;
  double _privateBalance = 100;

  // BONUS: Can you figure out how to make it "private"

  // TODO: Create a Named constructor that can take in a
  // a double value and set that as the balance
  BankAccount(this.balance);

  // TODO: Create a deposit method that takes an amount a
  // and adds it to the balance
  double deposit(double amount) {
    return balance += amount;
  }

  // TODO: Create a withdraw method that takes an amount
  // and subtracts it from the balance
  double withdraw(double amount) {
    return balance -= amount;
  }
}

void main() {
  // Create a BankAccount object with an initial balance of 100.0
  BankAccount account = BankAccount(100.0);

  // Deposit 50.0 into the account
  account.deposit(50.0);

  // Withdraw 25.0 from the account
  account.withdraw(25.0);

  // Print the final balance
  print(account.balance);
}
