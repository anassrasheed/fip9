void main() {
  String? data;
  print(data); // null
  // data='';

  try {
    print("anas");
    print(data!.length);
    print('ahmad');
  } catch (exception) {
    print("hanlded exception");
    print(exception.toString());
    // error dialog popup
  } finally {
    print('finally always called');
  }

  String word = 'World';
  String word2 = 'world';
  print(word == word2); // false
  print(word.toLowerCase() == word2.toLowerCase()); // true
  word.equalsIgnoreCase(word2);
  String date = "13/11/2024";
  // DateTime myDate = date.convertToDate();
  DateTime dateTime = DateTime.now();

  // UiHelper obj1 = UiHelper(); // @abc123
  // obj1.name = "anas";
  // print(obj1.name);
  // UiHelper obj2 = UiHelper(); // @abc123
  // obj2.name = "Jehad";
  // UiHelper obj3 = UiHelper(); // @abc123
  // obj3.name = "Farah";

  // UiHelper.name = "anas"; // one value
  // print(UiHelper.name);

  // print(obj1 == obj2); // false
  // UiHelper.name = 'Ahmad'; // equalsIgnoreCase
  // print(UiHelper.name);

  UiHelper obj1 = UiHelper(); // new object // @abc123
  obj1.name = "anas";
  print(obj1.name);
  UiHelper obj2 = UiHelper(); // new object // @abc123
  print(obj2.name);
  obj2.name = "sami";
  print(obj1.name); // sami

  // public views
  // public utils
  NetworkService service = NetworkService();
  service.fetchData();
  DatabaseServer server = DatabaseServer();
  server.saveData();
}

// extension
extension MyExtension on String {
  bool equalsIgnoreCase(String other) {
    return this.toLowerCase() == other.toLowerCase();
  }

// DateTime convertToDate() {
//   return DateFormat('mm/dd/yyyy').parse(this);
// }
}

// design pattern

//singelton
class UiHelper {
  String? name; // shared
  // singelton class

  static final UiHelper _shared = UiHelper._private(); // new object  @abc123

  UiHelper._private(); //private  named constructor

  factory UiHelper() {
    // public constructor
    return _shared;
  }
}

class CommonViews {
  static final CommonViews _batata = CommonViews._private(); // @abc123

  CommonViews._private(); // @abc123

  factory CommonViews() {
    // one object
    return _batata; // @abc123
  }

// TextField getTextField() {
//   return TextField();
// }
}

// mixin

mixin Logger {
  // one object //
  void log(String message) {
    final now = DateTime.now();
    print("${now} $message");
  }
}

class NetworkService with Logger {
  void fetchData() {
    log("Fetching data from network ..."); // abc123
    // getTextField();
  }
}

class DatabaseServer with Logger {
  void saveData() {
    log("Saving data to database"); // abc1234
  }
}
