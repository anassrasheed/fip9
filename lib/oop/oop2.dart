// inheritance

//
//
//
import 'package:flutter/material.dart';

import 'oop.dart';

// every employee is a  person
class Employee extends Person {
  double salary;
  String positionName;

  Employee(
      {required super.name,
      super.age,
      required super.height,
      required super.weight,
      super.ssn,
      required this.salary,
      required this.positionName});

  // override
  @override
  void printData() {
    // factory design pattern
    // map <key,value> = values ;
    print('batata');
    print(salary);
    print(name);
  }
/*

temp

Providers
class Weather
GoogleWeather
ArabWeather
..




* */

// Employee(
//     {required String employeeName,
//     required double height,
//     required double weight,
//     double? age,
//     String? ssn,
//     required this.salary,
//     required this.positionName})
//     : super(
//           name: employeeName,
//           height: height,
//           weight: weight,
//           age: age ?? 18,
//           ssn: ssn);
//
}

void main() {
  Employee employee = Employee(
      salary: 123,
      positionName: "Senior Mobile Developer",
      name: "Anas",
      weight: 80,
      age: 25,
      height: 150);
  // print(employee is Person);
  // polymorphism
  // print(employee is String);
  employee.printData();
  Weather weather = ArabWeather();
  print(weather.getAmmanTemp());

  Weather googleWeather = GoogleWeather();
  print(googleWeather.getAmmanTemp());

  List<Job> jobs = [];
  JobProvider googleProvider = GoogleProvider();
  jobs.addAll(googleProvider.getJobs());
  JobProvider linkedinProvider = LinkedInProvider();
  jobs.addAll(linkedinProvider.getJobs());
  print(jobs.length);

  PartTimeEmployee ibrahim = PartTimeEmployee(
      salaryPerHour: 10,
      name: "Ibrahim",
      height: 183,
      positionName: "Java Developer",
      salary: 3000,
      weight: 80);

  Person ahmad = Person(
      name: "Ahmad", weight: 80, height: 160); // new instance  new object
  Person ahmadArabi = Person(name: "Ahmad", weight: 80, height: 160);

  print(ahmad ==
      ahmadArabi); // true , false  // == operator address override check values
  print(ahmadArabi == 5);
  print(ahmadArabi == true);
  print(ahmadArabi == "sami");
  // == method address   X   values
  // ahmad.hashCode

  Home myHome = Home(rooms: [
    Room(
        door: Door(height: 200, width: 90, color: Colors.brown),
        wallColor: Colors.white,
        window: Window(color: Colors.white, width: 60, height: 60)),
    Room(
        door: Door(height: 200, width: 90, color: Colors.brown),
        wallColor: Colors.white,
        window: Window(color: Colors.white, width: 60, height: 60)),
    Room(
        door: Door(height: 200, width: 90, color: Colors.brown),
        wallColor: Colors.white,
        window: Window(color: Colors.white, width: 60, height: 60)),
    Room(
        door: Door(height: 200, width: 90, color: Colors.brown),
        wallColor: Colors.white,
        window: Window(color: Colors.white, width: 60, height: 60)),
  ]);

  print(myHome.toString()); // @classHome
}

abstract class Weather {
  // abstract method
  // abstract method and non abstract method
  double getAmmanTemp(); // abstract method

  String providerName() {
    return "Weather";
  }
}
// implementations

class ArabWeather extends Weather {
  @override
  double getAmmanTemp() {
    return 20;
  }
// @override
// double getAmmanTemp() {
//   // code api
//   //
//   return 20;
// }
}

class GoogleWeather extends Weather {
  @override
  double getAmmanTemp() {
    // api
    return 20.2;
  }
}

abstract class JobProvider {
  List<Job> getJobs(); // abstract method
}

class LinkedInProvider extends JobProvider {
  @override
  List<Job> getJobs() {
    // api  jobs
    //
    return [
      Job(
          jobName: "Flutter Developer",
          jobLocation: "Amman-Jordan",
          jobType: 'Remotly',
          salary: 1200,
          yearsOfExperience: 3),
      Job(
          jobName: "Java Developer",
          jobLocation: "Amman-Jordan",
          jobType: 'Remotly',
          salary: 1500,
          yearsOfExperience: 5),
    ];
  }
}

class GoogleProvider extends JobProvider {
  @override
  List<Job> getJobs() {
    return [
      Job(
          jobName: "Asp.net Developer",
          jobLocation: "Amman-Jordan",
          jobType: 'On-Site',
          salary: 1200,
          yearsOfExperience: 3),
      Job(
          jobName: "Oracle Developer",
          jobLocation: "Amman-Jordan",
          jobType: 'Remotly',
          salary: 1500,
          yearsOfExperience: 5),
    ];
  }
}

class Job {
  String jobName;
  String jobLocation;
  String jobType;
  double salary;
  int yearsOfExperience;

  Job(
      {required this.jobName,
      required this.jobLocation,
      required this.jobType,
      required this.salary,
      required this.yearsOfExperience});
}

// Jobs
// Linkedin
// Google Jobs
// Bayt.com
// facebook jobs
//
//

class PartTimeEmployee extends Employee {
  double salaryPerHour;

  PartTimeEmployee(
      {required this.salaryPerHour,
      required super.name,
      super.age,
      required super.height,
      required super.positionName,
      required super.salary,
      super.ssn,
      required super.weight});
}

// object inside object

//
class Home {
  List<Room> rooms;

  Home({required this.rooms});

  @override
  String toString() {
    String result = '';
    for (var room in rooms) {
      result += room.toString() + "\n";
    }
    return result;
  }

// instance of room // instance of door color instance of window
// instance of room
// instance of room
// instance of room
}

class Room {
  Door door;
  Color wallColor;
  Window window;

  Room({required this.door, required this.wallColor, required this.window});

  @override
  String toString() {
    return "My room contains these data : " +
        door.toString() +
        " " +
        wallColor.toString() +
        " " +
        window.toString();
  }
}

class Door {
  double height;
  double width;
  Color color;

  Door({required this.height, required this.width, required this.color});

  @override
  String toString() {
    return "Door height is $height , door width is $width , door color is $color";
  }
}

class Window {
  double width;
  double height;
  Color color;

  Window({required this.width, required this.height, required this.color});

  @override
  String toString() {
    return "Window height is $height , Window width is $width , Window color is $color";
  }
}
