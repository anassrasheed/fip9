import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SettingsTab'),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (c) => WillPopScope(
                            onWillPop: () async {
                              return Future.value(false);
                            },
                            child: AlertDialog(
                              title: Text('this is the title'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('this is the content'),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                ],
                              ),
                              backgroundColor: Colors.lightBlue,
                              elevation: 4,
                              shadowColor: Colors.blue,
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    },
                                    child: Text('Cancel')),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    },
                                    child: Text('Confirm'))
                              ],
                              // insetPadding: EdgeInsets.zero,
                              // contentPadding: EdgeInsets.zero,
                              // actionsPadding: EdgeInsets.zero,
                              icon: Icon(Icons.warning),
                            ),
                          ));
                },
                child: Text('Show Dialog')),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: false,
                      builder: (c) => Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30))),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Icon(Icons.add),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(c).pop();
                                          },
                                          child: Text('Close'))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                },
                child: Text('Show bottom sheet')),
            ElevatedButton(
              onPressed: () {
                // showToast('this is test content',
                //     duration: Duration(seconds: 5),
                //     backgroundColor: Colors.red,
                //     position: ToastPosition.center,
                //     onDismiss: () {},
                //     animationCurve: Curves.easeInOut,
                //     animationDuration: Duration(seconds: 1));
                showToastWidget(Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red, width: 2)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'this is test content',
                        style: TextStyle(color: Colors.red),
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    ],
                  ),
                ));
              },
              child: Text('Show Toast'),
            ),
          ],
        ),
      ),
    );
  }
}
