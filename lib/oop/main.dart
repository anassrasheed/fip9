// import 'dart:math';

// import 'dart:math';

import 'dart:math' as math;

import 'package:fip9/oop/oop.dart';

void main() {
  // dart
  print(10);
  print(20);
  print(10 + 20);
  print("10" + "10");
  print(true);
  print(false);
  //
  // data types

  // int        10,105,-55
  // double     10.15, -20.78  258.487
  // num        mix int double  10 , -22.58
  // String     characters   a   b  Anas Hello   ""   ''     "Anas"   'Sami'   'Farah is here'  "10"
  // bool       true false
  // var
  // dynamic
  // Object

  //variable

  print(10 + 50);
  print(10 - 50);
  print(10 * 10); // 100 int
  print(10 / 10); // double  1.0
  print(10 / 2); // double  5.0
  print(10 / 5); // double  2.0

  print(10 * 5 + (20 - 4) + 4); //
  //    10 * 5 + 16 + 4
  //    50 + 16 + 4
  //    66 + 4 = 70

  print(10 + 5 * (33 - 12) - 50);
  //    10 + 5 * 21 - 50
  //    10 + 105 - 50
  //    115 - 50
  // 65
  // ()   */ +-

  // >  <  >=   <=  == !=
  print(5 > 5); // 5 greater than 5
  print(10 > 8); // true
  print(10 >= 10); // true
  print(10 <= 20); // true
  print(10 >= 20); // false
  print(10 == 10); // true
  print(10 == 5 * 2); // true
  print(10 == 5 * 4 / 2); // true
  print(10 == 8); // false
  print(10 != 8); // true
  print(10 == 8 * 2); // false
  print('**************************');
  print(10 > 4 || 5 > 20); // true || false = true
  print(10 > 20 || 5 > 20); // false || false = false
  print(10 > 20 || 5 > 20 / 6); // false || true = false
  print(10 > 20 && 5 > 20 / 6); // false && true = false

  // Compailer
  //
  print(10 > 5 || 0 != 0); // true  hard coded const
  print(true || false); //  true
  print(false || true);

  print(false && true); // false

  print((15 / 3 * 4 + 5 > 15 * ((2 + 4) / 3) / 2) ||
      (1 >= 2.5 * 4 / 2)); // true false
  //    15 / 3 * 4 + 5 > 15 * (6/3/2)
  //     15 / 3 * 4 + 5 > 15 * 1
  //     5 * 4 + 5 > 15 *1
  //     25 > 15  true

  print(!(10 > 5)); // false

  // variable

  //   name has a value that can be changed
  //   letter or _
  // mark
  // _mark
  // X space
  // myAvg
  // my_avg
  // X my%avg
  // lower camel case
  //  the first letter is small
  // myAvg
  // myMark
  // numberOfStudents
  // numberOfClassesThatHas3Values

  // variable

  // mark = 30;
  // mark = 20;

  // || &&
  // OR ||
  // AND &&

  // true || false = true
  // true || true = true
  // false || true = true
  // false || false = false

  // true && true = true
  // true && false = false
  // false && true = false
  // false && false = false

  // data type to another data type   (Casting)

  // syntax
  // data type  name   ;
  int number; // variable   declaration
  number = 10; // init

  int number2 = 20; // declaration + init
  // null safety
  int count, number3; // int null
  count = -20;
  print(count); // syntax error
  count = 30;
  print(count);
  number3 = -1;
  print(count + number3);
  // posts null
  // try catch i will handle
  // print(index??0);
  int? index; // it can be nullable
  print(index);
  // index = 99;
  // print(index ?? 0);

  print(10 / 0); // crash  logical error semantic error
  print('anas');

  count = 10;
  print(count + 20); //30
  print(count); //  10

  count = count + 20;
  print(count + 20); // 30 +20 = 50
  print(count); // 30
  //
  // prefix and postfix
  count = 10;
  count++; // count = count +1
  count--; // count = count -1
  count += 20; // count = count +20
  count -= 5; // count = count - 5;
  print(count); // 25
  ++count; // count = count +1
  --count; // count  = count - 1;
  --count;
  print(count);

  // prefix postfix
  // count 24  25 26
  print(++count + 1 - count++); //  25 + 1 - 25    = 1

  // count 26
  print(count);
  count = 1;
  // prefix    process
  // postfix ignore

  //count 1 2 1 2
  print(++count + 2 + 5 + --count + count++); // 2 + 2 + 5 + 1 + 1 = 11
  print(count); //

  // math

  // cos sin

  print(math.cos(90));
  print(math.sin(90));
  print(math.tan(90));
  print(math.min(10, 22)); // 10
  print(math.max(10, 22)); // 22
  print(math.pi); // 3.14
  print(math.pow(2, 4));
  print(math.sqrt(16)); // 4.0

  double value = 20.00001;
  print(value);
  print(value.toInt()); // casting datatype - > datatype
  print(value.floor()); //  20 round to down
  print(value.round()); // 21 round
  print(value.ceil()); // round to up  21

  print(value.floorToDouble());
  // ctrl + b
  // alt + ctrl + l   reformat code

  value = 10;
  String myMark = value.toInt().toString(); // casting 2
  print(value.toStringAsFixed(0)); // 10.00
  print(myMark);
  // String

  String myName = "Anas Rasheed";
  print(myName);
  String nValue = "10";
  String oldValue = "20";

  print(nValue + oldValue); // 30   1020 concatenation  دمج

  // String methods
  print(myName.length); // 12
  int length = myName.length; // 12
  print(length);

  print(myName.toLowerCase());
  print(myName.toUpperCase());
  print(myName);

  myName = myName.toUpperCase(); // ANAS RASHEED
  print(myName);
  myName = "Anas Rasheed"; // asci code    A 61  a 97
  print(myName.indexOf('n')); // index address  0  ////   answer 1
  print(myName.indexOf('a')); // case sensitive  2
  print(myName.indexOf('k')); // case sensitive  -1
  print(myName.indexOf('e')); // case sensitive  9
  print(myName.lastIndexOf('e')); // case sensitive  10
  print(myName.lastIndexOf('P')); // case sensitive  -1
  //
  print(myName.contains("anas")); // bool false
  print(myName.contains("Anas")); // bool true
  print(myName.contains("eed")); // bool true
  print(myName.contains("e")); // bool true
  print(myName.contains(" ")); // bool true
  print(myName.contains("")); // bool true

  print("         my name is       Ahmad ".trim());
  print(" my name is Anas".trimLeft()); //
  print(" my name is Anas  ".trimRight()); //

  myName = "Anas Rasheed";
  print(myName.replaceAll("a", 'A'));
  print(myName.replaceAll("a", 'Anas'));
  print(myName.replaceAll("Anas", 'Ahmad'));
  print(myName.replaceAll("Soso", 'Ahmad'));
  print(myName.startsWith("A")); // true
  print(myName.startsWith("anas")); // false
  print(myName.startsWith("ed")); // false
  print(myName.endsWith("ed")); // true
  print(myName.endsWith("Rasheed")); // true
  print(myName.endsWith(" Rasheed")); // true
  print(myName.endsWith("Anas Rasheed")); // true
  print(myName.startsWith("Anas Rasheed")); // true

  print(myName.replaceFirst("a", 'R')); // AnRs Rasheed
  print(myName.replaceFirst("a", 'R', 3)); // Anas RRsheed
  print(myName.replaceRange(1, 6, "H")); // range index  1 - 6  AHasheed

  print(myName.substring(6)); // Anas Rasheed   asheed
  print(myName.substring(4)); // Anas Rasheed    Rasheed
  print(myName.substring(2, 6)); // Anas Rasheed    as R
  print(myName[7]); // s
  print(myName[6]); // A   range error
  print(myName.indexOf('K')); // -1
  myName = "hello everyone my name is Hamzeh";
  print(myName.length); // 32
  print(myName[myName.length - 4]); //myName[31];
  // print(myName[40]); //myName[31];

  //

  // conditions

  // syntax
  // if (condition) { // true

  // }

  if (10 > 5) {
    print('10>5');
  }

  if (10 > 20) {
    // false
    print('10>20');
  }

  myName = 'Anas Rasheed'; // 11   12
  if (myName.length >= 30) {
    print(myName[29]);
  }

  // syntax if (condition) {}  else {}

  if (10 > 20) {
    print('success');
  } else {
    print('failed');
  }

  if (myName.length > 12) {
    print('my name is too long');
  } else {
    print('my name is too short');
  }

  int mark = 40;

  if (mark >= 90) {
    print("A+");
  } else {
    if (mark >= 80) {
      print('A-');
    } else {
      if (mark >= 70) {
        print('B+');
      } else {
        if (mark >= 60) {
          print('B-');
        } else {
          if (mark >= 50) {
            print('D');
          } else {
            print('F');
          }
        }
      }
    }
  }

  // else if

  if (mark >= 90) {
    print('A+');
  } else if (mark >= 80) {
    print('A-');
  } else if (mark >= 70) {
    print('B+');
  } else if (mark >= 60) {
    print('B-');
  } else if (mark >= 50) {
    print('D');
  } else {
    print('F');
  }

  // task
  // create new 3 double variables  num1 , num2 , num3
  // create a condition to print the biggest number
  // create a condition to print the smallest number

  // task

  // create a String variable  String sent='lsjhdflsdfjdslhfk slkjd fhkjsd fhkjlsd fhklsd fh';
  // and make a 3 substring from the base variable // String var1 , var2 ,var3
  // each variable if the length is greater than the base variable /3 print(success + variable name)

  // Hello everyone this is anas rasheed
  // var1 = Hello everyone;
  // var2 = Hello everyone this is;
  // var3 ='anas'
  //  success hello everyone this is

  // conditions switch
  // switch static conditions
  // syntax
  // switch (value) {
  //  case value : {process};
  // break;
  // case value : {process};
  // break;
  // }

  String ali = "Ali"; //
  switch (ali) {
    case 'ALI':
      print("ALI");
      break; // end case
    case 'Ali ':
      print('Ali with space');
      break;
    case "AlI":
      print('AlI');
      break;
    // default:
    //   print('None of the option is correct');
  } // enums
  // factory design pattern

  // for loop

  // print(1-10)
  print(1);
  print(2);
  print(3);
  print(4);
  print(5);
  print(6);
  print(7);
  print(8);
  print(9);
  print(10);
  // loop
  // syntax
  // for ( initial value (optional)    ;    Condition (Mandatory) when to stop         ;   increment/decrement    (Optional)   ) {

  // }

  // for (int counter = 1; counter <= 7; counter++) {
  //   print(counter); // 1 2 3 4 5 6 7
  // }
  // for (int counter = 1; counter <= 1000; counter++) {
  //   // for
  //   print(counter); // 1 2 3 4 5 6 7 8 ... 1000
  // }
  // // 8
  // for (int counter = 10; counter > 1; counter -= 2) {
  //   print(counter); // 10 8 6 4 2
  // }

  // for (int counter = 10; counter > 11; counter--) {
  //   print(counter); //
  // }

  // for (int counter = 10; counter > 9; counter++) {
  //   print(counter); // 10 11 12 13 14  infinite loop   Stack Over Flow
  // }

  int _counter = 1;
  for (; _counter <= 10; _counter += 3) {
    print(_counter); // 1 5 9
    _counter++;
  }
  print('the value of counter is $_counter');
  print('the value of counter is $_counter');

  _counter = 1;
  for (; _counter <= 20;) {
    // condition
    print(_counter); // 1 6 11 16
    _counter += 5;
  }

  // while
  // syntax
  // while(condition){
  //
  // }
  _counter = 1;
  while (_counter <= 20) {
    print(_counter);
    _counter += 5;
  }

  _counter = 10;
  while (_counter >= 11) {
    print('Hello');
  } // 0
  // do while

  // syntax do {    }while(condition);

  do {
    print('hello'); // 1
  } while (_counter >= 11);

  for (int index = 1; index <= 9; index += 2) {
    if (index / 3 == 1) {
      continue; //
    }
    print(index); // 1 5 7 9
  }

  for (int index = 1; index <= 9; index += 2) {
    if (index / 3 == 1) {
      break; //
    }
    print(index); // 1
  }
  // int 4 byte
  // double 8 byte
  // 16 byte

  num myAge = 36; // int double
  num yourAge = 38.5; // // bigDecimal long

  // var
  // dynamic

  var data = "anas"; // any data type
  data = "anas Rasheed";
  data = "Ahmad";
  data = "Batata";

  var myNumber = 15.7;
  myNumber = 20;
  myNumber = -55.17;
  myNumber = 22;

  dynamic dData = 10;
  dData = "Anas";
  dData = false;

  //
  // List  array
  //
  String anasRasheed = 'Anas Rasheed';
  // one variable - multi values
  // syntax
  // List <data type (optional)> generic type  variable name = [ values ];
  List fip9 = []; //
  List fip99 = ['Anas', 'Ahmad', 'Halla', 'Sa3id', 20, false, 17.25]; //
  print(fip99);

  List<String> myClassNames = [
    "Farah",
    'Ibrahim',
    'Jawad',
    "Issa",
    "Sara",
  ];
  // []
  myClassNames.add("Ahmad");
  print(myClassNames);
  myClassNames.addAll(["Mohammad", 'Ashraf']);
  print(myClassNames);
  myClassNames.insert(2, 'Wa2el');
  print(myClassNames);
  myClassNames.insertAll(1, []);
  myClassNames.insertAll(1, []);
  print(myClassNames);
  myClassNames.insertAll(1, ['Sami', 'Yousef']);
  print(myClassNames);
  myClassNames.insertAll(11, ['Leen', '7ala']);
  print(myClassNames);
  myClassNames.insertAll(9, ['Leen', '7ala']);
  print(myClassNames);
  print(myClassNames.contains('Anas'));
  print(myClassNames.contains('leen'));
  print(myClassNames.contains('Leen'));
  print(myClassNames.length);
  print(myClassNames.isEmpty); // false
  print(myClassNames.isNotEmpty); // true
  print(myClassNames.first); // Farah
  print(myClassNames.last); // 7ala
  print(myClassNames.indexOf('Jawad')); // 5
  print(myClassNames.indexOf('Leen')); // 9
  print(myClassNames.lastIndexOf('Leen')); // 13
  print(myClassNames[4]); // index 4 => Wa2el
  // print(myClassNames[25]); // index 25 Error

  List<String> yourClassNames = ["Muath", "Feras"];
  print(myClassNames + yourClassNames); // concatenation
  print(myClassNames); // concatenation
  print(yourClassNames); // concatenation
  myClassNames.addAll(yourClassNames);
  print(myClassNames);

  List<int> temp = [-10, -7, 2, -1, 11, 20, 35, 15, 22];
  temp.remove(-10);
  print(temp);
  temp.removeRange(0, 3); // 0 1 2
  print(temp);
  temp.removeAt(1); // index 1 = > 20
  print(temp);
  temp.removeLast();
  print(temp);
  temp.removeWhere((element) => element > 30);
  print(temp);
  temp.addAll([12, 35, 24, 14, 28, 14, 15]);
  print(temp);
  //
  print(temp.where((v) => v > 20).toList()); // ()  []
  print(temp.where((v) => v > 10).toList()); // filter
  print(temp.where((v) => v < 25).toList());
  // list
  List<int> filteredTemps =
      temp.where((v) => v > 10).toList(); // iterable  -> List
  print(filteredTemps);

  print(temp.take(5).where((e) => e > 13).toList());
  print(temp.every((e) => e > 20)); // true false
  print(temp.every((e) => e > 10)); // true false
  print(temp.any((e) => e > 10)); //  true
  print(temp.any((e) => e > 35)); //  false
  print(temp);
  //  12, 24, 14
  print(temp.take(6).where((e) => e.isEven).any((v) => v / 2 == 12.0)); // true
  print(temp.take(6).where((e) => e.isEven).every((v) => v < 30)); // true

  print(temp.reversed); // ()
  print(temp.reversed.toList()); // ()
  // how to remove duplicate
  temp = temp.toSet().toList(); // collection set // remove duplicate
  print(temp);
  // temp.clear();
  // map
  print(temp);

  // task
  // 1
  // create a list of String that contains student names
  // add at least 20 students using add and addAll
  // insert new 3 students at index 1 , 10 , 15
  // print all the students that their names starts with a or A
  // print all the students that their names contains more than  or equal 5 letters
  // print all students that their names ends with a,e,i,o,u

  //
  // create for loop for
  // 1 print all odd numbers between 33-107
  // 2 print all numbers that accept division by 5 between 1-347
  // print all number between 1-100 except all numbers that can be divided by 3

  // collection Map
  //   key - Value
  //   Anas Rasheed -> 38
  //   Halla Halla  -> 19
  //   Farah  -> 19

  // data type key   , datatype value

  // syntax
  // Map <String,int> map= {};
  Map<String, int> map = {
    // syntax
    // "anas" : 20,
    // "sami" : 35,
    // 'Ibrahim: 22
    "Anas": 35,
  };

  //
  print(map.length); // 1
  map.putIfAbsent("Sami", () => 25);
  print(map.length); // 2
  print(map);
  map.putIfAbsent("Anas", () => 5); // ignore
  print(map);
  map['Anas'] = 5;
  print(map);
  map['Sara'] = 55;
  print(map);

  print(map['Sara']);
  // print(map['saeed']); // null
  if (map.containsKey('saeed')) {
    print(map['saeed']);
  }

  if (map.containsValue(55)) {
    print('The people in the map is 55');
  }

  List<int> values = map.values.toList();
  print(values);
  List<String> keys = map.keys.toList();
  print(keys);
  map.removeWhere((k, v) => k.length > 3 && v > 30);
  print(map);
  map.remove('Anas'); // key
  print(map);
  map.clear();
  print(map); // {}
  map.putIfAbsent("sa3d", () => 34);
  map.putIfAbsent("Sami", () => 40);
  map.putIfAbsent("Hekmat", () => 27);
  map.forEach((k, v) => print("$k : $v")); // ctrl b
  map.update('sa3d', (v) => 40);
  // crash
  if (map.containsKey("Anas")) {
    map.update('Anas', (v) => 40);
  }
  map.update('Hekmat', (v) => v + 10);
  print(map);
  // map.updateAll((k, v) => v + 2);
  map.updateAll((k, v) {
    if (k.length > 4) {
      return v + 2;
    } else {
      return v;
    }
  });
  print(map);
  // Map  UI   // Map json  basics dart collections   -> database online server backend  json  data from mobile -> server JSON       receive server -> mobile Map json
  //
  map['Anas Rasheed'];
  //
  List<int> stuMarks = [10, 20, 7, 13, 18, 32, 44, 49, 16];
  // find a max
  //
  // for
  // i assume max first value

  int max = stuMarks.first; // 10
  for (int index = 0; index < stuMarks.length; index++) {
    if (stuMarks[index] > max) {
      max = stuMarks[index]; // 20 32  44 49
    }
  } // index < 9
  print(max);

  //min

  int min = stuMarks.first;
  for (int index = 0; index < stuMarks.length; index++) {
    if (stuMarks[index] < min) {
      min = stuMarks[index];
    }
  }
  print(min);

  // where
  max = stuMarks.first;
  stuMarks.forEach((v) {
    if (v > max) {
      max = v;
    }
  });
  print(max);
  max = stuMarks.first;
  for (int value in stuMarks) {
    if (value > max) {
      max = value;
    }
  }
  print(max);

  List<int> stuMakrs2 = [
    12,
    156,
    48,
    56,
    65,
    789,
    12,
    9,
    489,
    456,
  ];
  max = stuMakrs2.first;
  for (int value in stuMakrs2) {
    if (value > max) {
      max = value;
    }
  }
  print(max);

  List<int> stuMakrs3 = [
    12,
    156,
    48,
    165,
    651,
    651,
    654,
    6489,
    9489,
    7,
    5465,
    456,
  ];
  max = stuMakrs3.first;
  for (int value in stuMakrs3) {
    if (value > max) {
      max = value;
    }
  }
  print(max);
  //
  //
  //
  //
  // oop
  // methods functions
  print(findMax(5, 10));
  print(findMin(5, 10));
  print(findMaxFromList(stuMarks));
  print(findMaxFromList(stuMakrs2));
  print(findMaxFromList(stuMakrs3)); // method
  int result = findMaxFromList(stuMakrs3);
  print("Result is $result");
  print(findMinFromList(stuMarks));
  print(findMinFromList(stuMakrs2));
  print(findMinFromList(stuMakrs3));
  //
  print(getName(map, 'Anas'));
  print(getName(map, 'Hekmat'));
  printAllNamesInTheMap(map);
  // find all the even values   -> List
  print(stuMakrs3.where((v) => v.isEven).toList());
  print(stuMakrs2.where((v) => v.isEven).toList());
  print(stuMarks.where((v) => v.isEven).toList());
  print(getFilteredDataFromList(stuMarks));
  print(getFilteredDataFromList(stuMakrs2));
  print(getFilteredDataFromList(stuMakrs3));
  getData("v", 15, false, "sdfy");
  getData2(name: "anas", ssn: "9981651651", isMale: true, age: 15);
  getData2(
      ssn: "9981651651",
      name: "anas",
      isMale: true,
      age: 15); // named parameter arguments

  getData3(name: "Halla");
  getData4(name: 'asasd');
  getData5(name: "anas");
  getData6(20, age: 20, data: "aSdasd"); // ctrl + space
// find max
  //
  //
  //  collections {  list map stack queue set }
  // oop
  // github Version Control
  // Widgets
  //
  // Book book = Book();
  // book._bookName;

  Book flutterBook = Book("Flutter", 450);
  print(flutterBook.getPages());
  flutterBook.setPageNumber(300);
  print(flutterBook.getPages());
  flutterBook.setPageNumber(-20);
  print(flutterBook.getPages());
  // print(person.ssn);
  // person.ssn='';
  print(flutterBook.pages); //
  flutterBook.pages = 50; //
  // flutterBook. = 1;
}

// syntax
// return data type (output type)    method name  (input) {
//
// process
//  return result
// }
// 20 , 10
int findMax(int value1, int value2) {
  // parameters arguments

  if (value1 > value2) {
    return value1; // end of the function and give it the result  20
  } else {
    return value2;
  }
}

int findMin(int v1, int v2) {
  if (v1 < v2) {
    return v1;
  }
  return v2;
}

int findMaxFromList(List<int> data) {
  int max = data.first;
  for (int value in data) {
    if (value > max) max = value;
  }
  return max;
}

int findMinFromList(List<int> batata) {
  int min = batata.first;
  for (int v in batata) {
    if (v < min) {
      min = v;
    }
  }
  return min;
}

//
String getName(Map<String, int> map, String key) {
  if (map.containsKey(key)) {
    return "$key is Found in the map";
  }
  return "$key Not Found";
}

void printAllNamesInTheMap(Map<String, int> data) {
  List<String> keys = data.keys.toList();
  print(keys);
  return; // stop break
  print('anas');
}

List<int> getFilteredDataFromList(List<int> data) {
  return data.where((v) => v.isOdd && v > 20).toList();
}

void getData(String v, int v2, bool v3, String v4) {}

void getData2(
    {required String name, int? age, required bool isMale, String ssn = ""}) {}

void getData3({required String name}) {}

void getData4({String? name}) {}

void getData5({String name = 'Undefined'}) {
  print(name);
}

void getData6(int value, {String data = '', required int age}) {
  // handling UX Better
}

void login({String? username, String? mobileNumber, required String password}) {
  // assertions
  assert(username != null || mobileNumber != null,
      "You should enter username or mobile number"); // both null

  // login mobile username
  // overload dart
}

// optional arguments
// mandatory required
// named parameter

// task make a map
// map key int value String
// { 10 : "Ahmad" , 15: "Anas"   20: "sami" }
// insert 10 randomly data
// make a 3 functions
// input map  output list   ->   return all the keys that their values length is grater that 4
// input map  output list   ->   return all the values that their keys is greater that 20 and isEven
// input map  output value   ->   return the longest value's length from the map
