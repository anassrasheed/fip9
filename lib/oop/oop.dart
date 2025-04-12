// object
// class
// person   Name Age height weight ssn
// class ClassName { // upper camel case  class MyStudent
//
//
//
// }

// encapsulation

// access modifiers //  public private
class Person {
  String name;
  double age;
  double height;
  double weight;
  String? ssn; //

// syntax
// className (attributes);

  Person(
      {required this.name,
      this.age = 1,
      required this.weight,
      required this.height,
      this.ssn});

  Person.noSsnPerson(
      {required this.name,
      required this.age,
      required this.height,
      required this.weight});

  void printData() {
    // function method
    print(
        "Person name is $name , Person age is $age , Person height = $height , Person weight = $weight");
  }

  @override
  bool operator ==(Object other) {
    if (other is! Person) return false;
    return this.name == other.name &&
        this.age == other.age &&
        this.ssn == other.ssn &&
        this.height == other.height &&
        this.weight == other.weight;
  }

// void getData({String? name, int? age}) {
//   //private method
// }

// constructor fill default values
}

void main() {
  Person ahmad =
      Person(name: "anas", age: 30, height: 180, weight: 80); // calling class
  // ahmad.getData(name: "asd");
  // ahmad.getData(age: 15);
  Person anas =
      Person.noSsnPerson(name: "Anas", age: 40, weight: 90, height: 180);
  print(ahmad.name);
  print(ahmad.age);
  ahmad.ssn = "849465465465";
  print(ahmad.ssn);
  ahmad.ssn = "asdasd";
  ahmad.printData();
  ahmad.name = "";
  print(ahmad == anas);
  // Book book = Book(
  //   "Flutter Book",
  //   pages: 100,
  // );
  // print(book._bookName);
  // print(book.pages);
  //
  // book.pages = 120;
  // print(book.pages);

  // book._bookName = "Flutter Book2";
  // print(book._bookName);
}

class Book {
  // _ private
  String _bookName; // private  access same file
  int _pages;

  Book(this._bookName, this._pages); // public

// private getter setter   functions  set value for private data   and get value for private data

  int getPages() {
    // if (the user authorized)
    // getter
    return _pages;
  }

  int get pages {
    return _pages;
  }

  // setter
  void setPageNumber(int newPages) {
    // 99
    if (newPages < 100) {
      print("the minimum number of pages is 100");
      return;
    } // stop

    _pages = newPages;
  }

  set pages(int value) {
    if (value < 100) {
      print("the minimum number of pages is 100");
      return;
    } // stop
    _pages = value;
  }

  void setBookName(String nBookName) {
    if (nBookName.isEmpty) return;
    if (nBookName.toLowerCase().startsWith("book")) return;

    _bookName = nBookName;
  }
}

// inheritance
// composition
// polymorphism
// dependency injection
// design pattern

//
// 3-5 months  4
// sqlite hive

// create a Class Called Animal
// name //  type//  age//  numOfLegs//  food(dry food, )  type private , use namedParameter if applicable
// make a instance object variables from this class
// print all data
// change the food name using a method with anu rules
// prevent to change type
// add new method to add the age for the animal
