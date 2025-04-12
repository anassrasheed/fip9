class BankingAccount {
  String owner;
  double _balance;
  int id;
  String iban;
  List<String> _transactions = [];
  AccountType? type;
  String? type1;

  BankingAccount(
    this._balance, {
    required this.owner,
    required this.id,
    required this.iban,
    this.type,
    this.type1,
  });

  void transfer(BankingAccount targetAccount, double value) {
    // rules
    if (type == AccountType.savingAccount) {
      // 1%
    }
    if (_balance >= value) {
      targetAccount.addBalance(value, this);
      _balance = _balance -= value;
      _transactions.add(
          "Transfer $value  From myAccount $iban to ${targetAccount.owner} with iban ${targetAccount.iban}");
    } else {
      print("insufficient balance");
    }
  }

  void showBalance() {
    print(_balance);
  }

  void addBalance(double value, BankingAccount sourceAccount) {
    _balance += value;
    _transactions.add("Recevied $value from ${sourceAccount.owner}");
  }

  void accountHistory() {
    print(_transactions);
  }
}

void main() {
  BankingAccount myAccount = BankingAccount(100,
      owner: "Manar",
      id: 1,
      iban: 'sdf5s4dfsdf6s5d4',
      type: AccountType.savingAccount,
      type1: "Saving  Account "); // 80

  BankingAccount ahmadAccount = BankingAccount(300,
      owner: "Ahmad", id: 2, iban: 'sdf5s4dfsdasdf6s5d4'); // 320

  myAccount.transfer(ahmadAccount, 20);
  myAccount.showBalance(); // 80
  ahmadAccount.showBalance(); // 320

  myAccount.accountHistory();
  ahmadAccount.accountHistory();
  myAccount._balance = 1000;
}

// enum
enum Gender { male, female }

enum Days {
  sunday,
  monday,
}

enum AccountType { savingAccount, normalAccount }

//
