import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';

class RegisterScreen2 extends StatefulWidget {
  const RegisterScreen2({super.key});

  @override
  State<RegisterScreen2> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen2> {
  List<String> _currenies = ['JOD', 'USD', 'EGY', 'EUR', 'JPY', 'AED', 'INR'];
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        elevation: 4,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            childAspectRatio: 1.6),
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              showAdaptiveActionSheet(
                context: context,
                title: const Text('Select Currency'),
                androidBorderRadius: 30,
                actions: <BottomSheetAction>[
                  ..._currenies
                      .map((e) =>
                          BottomSheetAction(title: Text(e), onPressed: (_) {}))
                      .toList(),
                  // BottomSheetAction(
                  //     title: const Text('Item 1'),
                  //     onPressed: (context) {
                  //       Navigator.of(context).pop();
                  //     }),
                  // BottomSheetAction(
                  //     title: const Text('Item 2'),
                  //     onPressed: (context) {
                  //       Navigator.of(context).pop();
                  //     }),
                  // BottomSheetAction(
                  //     title: const Text('Item 3'),
                  //     onPressed: (context) {
                  //       Navigator.of(context).pop();
                  //     }),
                ],
                cancelAction: CancelAction(
                    title: const Text(
                        'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
              );
            },
            child: Text(
              _currenies[index],
              style: TextStyle(fontSize: 55),
            ),
          );
        },
        itemCount: _currenies.length,
      ),
    );
  }

  SingleChildScrollView _listView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                // 0 1 2 3
                return Text(
                  _currenies[index],
                  style: TextStyle(fontSize: 55),
                );
              },
              itemCount: _currenies.length, // 4
              shrinkWrap: true,
            ),
          ),
          TextField(
            controller: _controller,
          ),
          ElevatedButton(
              onPressed: () {
                _currenies.add(_controller.text);
                setState(() {});
              },
              child: Text('Increment')),
        ],
      ),
    );
  }

  Column _buildColumn() {
    return Column(
      children: [
        ..._currenies
            .map((String element) => Text(
                  element.toLowerCase(),
                  style: TextStyle(fontSize: 50),
                ))
            .toList(),
        // ElevatedButton(0
        // ElevatedButton(
        //     onPressed: () {
        //       // Navigator.of(context).pushAndRemoveUntil(
        //       //     MaterialPageRoute(builder: (_) => LoginScreen()),
        //       //     (c) => false);
        //
        //       Navigator.of(context)
        //           .pushNamedAndRemoveUntil('/login', (c) => false);
        //     },
        //     child: Text('pushAndRemoveUntil')),
      ],
    );
  }
}
// Column(2 parts)
// ListView.builder currenies
// GridView.builder  cross axis count 3   places(List) images NetworkImage
