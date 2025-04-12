import 'package:get/get.dart';

class CounterController extends GetxController {
  final RxInt _counter = 0.obs; // observable
  final RxInt _counter2 = 0.obs; // observable

  void increaseCounter() {
    _counter.value++; // called evey obx that affect for this change
  }

  void increaseCounter2() {
    _counter2.value++;
  }

  int get counter => _counter.value;

  int get counter2 => _counter2.value;

  int get sum => _counter.value + _counter2.value;
}

class CounterController2 extends GetxController {
  int _counter = 0;

  void increaseCounter() {
    _counter++;
    update(); // to call every get builder that uses this controller
  }

  int get counter => _counter;
}
