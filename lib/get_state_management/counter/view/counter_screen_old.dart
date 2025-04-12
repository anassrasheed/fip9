import 'package:flutter/material.dart';

class CounterScreenOld extends StatefulWidget {
  const CounterScreenOld({super.key});

  @override
  State<CounterScreenOld> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreenOld> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print('hello' + counter.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter example'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(counter.toString()),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Text('increase')),
        ],
      )),
    );
  }
}
