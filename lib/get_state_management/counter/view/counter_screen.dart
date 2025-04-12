import 'package:fip9/get_state_management/counter/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  CounterController controller = Get.put(CounterController()); // init

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter example'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('counter 1   '),
              Obx(() {
                print('counter 1 called');
                return Text(controller.counter.toString());
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('counter 2   '),
              Obx(() {
                print('counter 2 called');

                return Text(controller.counter2.toString());
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('result   '),
              Obx(() {
                print('sum called');

                return Text(controller.sum.toString());
              }),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                controller.increaseCounter();
              },
              child: const Text('increase counter1')),
          ElevatedButton(
              onPressed: () {
                controller.increaseCounter2();
              },
              child: const Text('increase counter2'))
        ],
      )),
    );
  }
}
