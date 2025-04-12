import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController _usernameController =
      TextEditingController(text: 'Anas');

  TextEditingController _passwordController =
      TextEditingController(text: 'Anas123');

  FocusNode _usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  String _usernameError = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   title: Text("Splash Screen"),
        //   centerTitle: true,
        //   elevation: 0,
        //   shadowColor: Colors.black,
        //   leading: Row(
        //     children: [
        //       Icon(Icons.add),
        //       Icon(Icons.add),
        //       Icon(Icons.add),
        //     ],
        //   ),
        //   leadingWidth: 100,
        //   actions: [
        //     Icon(Icons.browse_gallery),
        //     Icon(Icons.alarm),
        //     Icon(Icons.alarm),
        //   ],
        //   toolbarHeight: 65,
        //   titleTextStyle: TextStyle(fontSize: 30, color: Colors.red),
        //   shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        //       side: BorderSide(width: 5, color: Colors.red)),
        //   bottom: PreferredSize(
        //     preferredSize: Size.fromHeight(50),
        //     child: Container(
        //       margin: EdgeInsets.only(bottom: 10),
        //       child: Text('Welcome Omar,'),
        //     ),
        //   ),
        //   bottomOpacity: 1,
        // ),
        // backgroundColor: Colors.red,
        // floatingActionButton: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // FloatingActionButton(
        //     //   onPressed: () {},
        //     //   backgroundColor: Colors.yellow,
        //     //   shape: RoundedRectangleBorder(
        //     //       borderRadius: BorderRadius.circular(4),
        //     //       side: BorderSide(color: Colors.black, width: 1)),
        //     //   child: Text('click mee!!'),
        //     //   elevation: 20,
        //     //   enableFeedback: false,
        //     //   tooltip: 'Click me to increase counter',
        //     //   heroTag: '1',
        //     // ),
        //     // FloatingActionButton(
        //     //   onPressed: () {},
        //     //   backgroundColor: Colors.yellow,
        //     //   shape: RoundedRectangleBorder(
        //     //       borderRadius: BorderRadius.circular(4),
        //     //       side: BorderSide(color: Colors.black, width: 1)),
        //     //   child: Text('click mee!!'),
        //     //   elevation: 20,
        //     //   enableFeedback: false,
        //     //   tooltip: 'Click me to increase counter',
        //     //   heroTag: '2',
        //     // ),
        //   ],
        // ),
        // body: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     // Icon(
        //     //   Icons.ac_unit,
        //     //   size: 55,
        //     //   color: Colors.blue,
        //     // ),
        //     // Row(
        //     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     //   children: [
        //     //     Icon(
        //     //       Icons.ac_unit,
        //     //       size: 55,
        //     //       color: Colors.blue,
        //     //     ),
        //     //     Icon(
        //     //       Icons.person,
        //     //       size: 55,
        //     //       color: Colors.red,
        //     //     ),
        //     //   ],
        //     // ),
        //     // Row(
        //     //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     //   children: [
        //     //     Icon(
        //     //       Icons.ac_unit,
        //     //       size: 55,
        //     //       color: Colors.blue,
        //     //     ),
        //     //     Icon(
        //     //       Icons.person,
        //     //       size: 55,
        //     //       color: Colors.red,
        //     //     ),
        //     //   ],
        //     // ),
        //     // Row(
        //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     //   children: [
        //     //     Icon(
        //     //       Icons.ac_unit,
        //     //       size: 55,
        //     //       color: Colors.blue,
        //     //     ),
        //     //     Icon(
        //     //       Icons.person,
        //     //       size: 55,
        //     //       color: Colors.red,
        //     //     ),
        //     //     Icon(
        //     //       Icons.person,
        //     //       size: 55,
        //     //       color: Colors.red,
        //     //     ),
        //     //   ],
        //     // ),
        //     // SizedBox(
        //     //   width: MediaQuery.of(context).size.width * 0.7,
        //     //   height: 50,
        //     //   child: ElevatedButton(
        //     //       onPressed: () {
        //     //         print('anas is here 2');
        //     //       },
        //     //       onLongPress: () {
        //     //         print('on long pressed called');
        //     //       },
        //     //       style: ElevatedButton.styleFrom(
        //     //         backgroundColor: Colors.black,
        //     //         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        //     //         elevation: 50,
        //     //         shadowColor: Colors.red,
        //     //         side: BorderSide(color: Colors.yellow, width: 2),
        //     //         shape: RoundedRectangleBorder(
        //     //             borderRadius: BorderRadius.circular(8)),
        //     //         enableFeedback: true,
        //     //         tapTargetSize: MaterialTapTargetSize.padded,
        //     //       ),
        //     //       child: Text('clickmee!!',
        //     //           style: TextStyle(color: Colors.white))),
        //     // ),
        //     // TextButton(
        //     //   onPressed: () {},
        //     //   child: Text('clickmee!!', style: TextStyle(color: Colors.white)),
        //     //   style: TextButton.styleFrom(
        //     //     backgroundColor: Colors.black,
        //     //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        //     //     elevation: 50,
        //     //     shadowColor: Colors.red,
        //     //     side: BorderSide(color: Colors.yellow, width: 2),
        //     //     shape: RoundedRectangleBorder(
        //     //         borderRadius: BorderRadius.circular(8)),
        //     //     enableFeedback: true,
        //     //     tapTargetSize: MaterialTapTargetSize.padded,
        //     //   ),
        //     // ),
        //     // IconButton(
        //     //   onPressed: () {},
        //     //   icon: Text(
        //     //     'asdfasdsd',
        //     //   ),
        //     //   style: IconButton.styleFrom(),
        //     // ),
        //     // GestureDetector(
        //     //   onTap: () {
        //     //     print('anas');
        //     //   },
        //     //   onDoubleTap: () {
        //     //     print('on double tap');
        //     //   },
        //     //   child: Row(
        //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     //     children: [
        //     //       Icon(
        //     //         Icons.add,
        //     //         size: 80,
        //     //       ),
        //     //       Icon(
        //     //         Icons.add,
        //     //         size: 80,
        //     //       )
        //     //     ],
        //     //   ),
        //     // ),
        //     // Image.asset(
        //     //   'assets/apple.jpg',
        //     //   width: MediaQuery.of(context).size.width,
        //     //   height: 700,
        //     //   fit: BoxFit.fill,
        //     // ),
        //     // Image.network(
        //     //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtBIu4B610cl-Kge5joFR-JCAm1m-YP-rPyA&s',
        //     //   width: MediaQuery.of(context).size.width,
        //     //   height: 700,
        //     //   fit: BoxFit.fill,
        //     // ),
        //
        //     // base64
        //   ],
        // ),
        body: _inputExample(),
      ),
    );
  }

  Column _task2() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
            Icon(
              Icons.cloud_outlined,
              size: 80,
            )
          ],
        ),
        Icon(
          Icons.cloud_outlined,
          size: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
            Icon(
              Icons.cloud_outlined,
              size: 80,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.cloud_outlined,
                  size: 80,
                ),
                Icon(
                  Icons.cloud_outlined,
                  size: 80,
                ),
              ],
            ),
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.cloud_outlined,
                    size: 80,
                  ),
                  Spacer(),
                  Icon(
                    Icons.cloud_outlined,
                    size: 80,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.cloud_outlined,
                    size: 80,
                  ),
                  Icon(
                    Icons.cloud_outlined,
                    size: 80,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Column _task1() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        Row(
          children: [
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        Row(
          children: [
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        Icon(
          Icons.cloud_outlined,
          size: 80,
        ),
        Row(
          children: [
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        Row(
          children: [
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        Row(
          children: [
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
            Icon(
              Icons.cloud_outlined,
              size: 80,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ],
    );
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: Container(
        // color: Color.fromRGBO(
        //     201, 119, 148, 1), // Color s .red   shade 0.1   shale 900
        // color: Colors.white,
        child: const Center(
          child: Column(
            children: [
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
            ],
          ),
          // child: Column(
          //   children: [
          //     Expanded(
          //       flex: 2, // 2/6
          //       child: Container(
          //         height: 50,
          //         color: Colors.red,
          //         width: MediaQuery.of(context).size.width,
          //       ),
          //     ),
          //     Expanded(
          //       flex: 2, // 1/6
          //       child: Container(
          //         height: 50,
          //         color: Colors.yellow,
          //         width: MediaQuery.of(context).size.width,
          //         child: SingleChildScrollView(
          //           child: Row(
          //             children: [
          //               Container(
          //                 height: 30,
          //                 width: 50,
          //                 color: Colors.black,
          //               ),
          //               Container(
          //                 height: 30,
          //                 width: 50,
          //                 color: Colors.red,
          //               ),
          //               Container(
          //                 height: 30,
          //                 width: 50,
          //                 color: Colors.blue,
          //               ),
          //               // Spacer(),
          //               Container(
          //                 width: 50,
          //                 // height: 200,
          //                 color: Colors.brown,
          //                 child: Column(
          //                   children: [
          //                     Text(
          //                       'asdasd',
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                     Text(
          //                       'asdasd',
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                     Text(
          //                       'asdasd',
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                     Text('asdasd'),
          //                   ],
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       flex: 1, // 1/6
          //       child: Container(
          //         height: 50,
          //         color: Colors.green,
          //         width: MediaQuery.of(context).size.width,
          //       ),
          //     ),
          //     Expanded(
          //       flex: 1, // 1/6
          //       child: Container(
          //         height: 50,
          //         color: Colors.blue,
          //         width: MediaQuery.of(context).size.width,
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }

  Container _buildColumnAndRow() {
    return Container(
      color: Colors.red,
      // width: MediaQuery.of(context).size.width,
      child: const Column(
        // main Vertical
        // cross Horizontal
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // start
        crossAxisAlignment: CrossAxisAlignment.center, // center
        children: [
          Text(
            "anas",
            style: TextStyle(fontSize: 55),
          ),
          Icon(Icons.add),
          Text('Sami'),
          SizedBox(
            height: 50,
            child: Icon(Icons.add),
          ),
          Icon(
            Icons.ac_unit,
            size: 50,
            color: Colors.white,
          ),

          // Row(
          //   // main horizantal
          //   // cross Vertical
          //   // mainAxisSize: MainAxisSize.min,
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     // svg  pub
          //     Icon(Icons.access_alarms),
          //     Icon(Icons.ac_unit),
          //     Icon(Icons.add),
          //   ],
          // )
        ],
      ),
    );
  }

  Center _buildContainer(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width * 0.5,
          // full width
          child: Column(
            children: [
              const FlutterLogo(
                size: 30,
                duration: Duration(seconds: 3),
                curve: Curves.easeIn,
                textColor: Colors.red,
                style: FlutterLogoStyle.horizontal,
              ),
              const Icon(
                Icons.remove,
                color: Colors.black,
                size: 50,
                shadows: [
                  Shadow(color: Colors.red, offset: Offset(1, 1)),
                  Shadow(color: Colors.blue, offset: Offset(0, 1)),
                  Shadow(color: Colors.green, offset: Offset(1, 0)),
                  Shadow(color: Colors.green, offset: Offset(10, 10)),
                ],
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "StepByStep",
                    maxLines: 2,
                    // softWrap: true, textScaler: TextScaler.linear(1.4),
                    textAlign: TextAlign.justify,
                    // detect language english left arabic right   "lsjdاتسنتيانتسيا"
                    overflow: TextOverflow.visible,
                    textDirection: TextDirection.ltr,
                    // StepByStep
                    // left to right   right to left
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        backgroundColor: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        decorationThickness: 3,
                        letterSpacing: 0,
                        wordSpacing: 0,
                        height: 1.5,
                        overflow: TextOverflow.visible,
                        decorationStyle: TextDecorationStyle.dashed,
                        fontStyle: FontStyle.italic),
                  ),
                  //
                ),
              ),
            ],
          ),
          padding: const EdgeInsets.only(top: 50, right: 10),
          margin: const EdgeInsets.only(bottom: 50, right: 55),
          decoration: BoxDecoration(
              color: Colors.yellow,
              // dynamic programming  backend api
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(12)),
              // borderRadius: BorderRadius.vertical(
              //     top: Radius.circular(12), bottom: Radius.circular(50)),
              border: Border.all(color: Colors.black, width: 5),
              gradient: LinearGradient(
                  colors: [
                    Colors.yellow,
                    Colors.orange,
                    Colors.red,
                    Colors.black.withOpacity(0.4),
                    Colors.blue
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.repeated),
              shape: BoxShape.rectangle),
          // alignment: Alignment.topRight,
        ),
      ],
    ));
  }

  Widget _stackExample() {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print('Big apple is clicked');
          },
          child: Image.asset(
            'assets/apple.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
        ),
        // Positioned(
        //   top: MediaQuery.of(context).size.height * 0.1,
        //   right: MediaQuery.of(context).size.width * 0.3,
        //   child: InkWell(
        //     onTap: () {
        //       print('ad unit is clicked');
        //     },
        //     child: Icon(
        //       Icons.ac_unit,
        //       size: 100,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        // IgnorePointer(
        //   child: ElevatedButton(
        //     child: Text('hello'),
        //     onPressed: () {
        //       print('added is clicked');
        //     },
        //   ),
        // ),
        // Center(
        //   child: InkWell(
        //     onTap: () {
        //       print('apple is clicked');
        //     },
        //     child: Image.asset(
        //       'assets/apple.jpg',
        //       width: 110,
        //       height: 110,
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        // ),
        Center(
          child: SizedBox(
            width: 200,
            height: 100,
            child: ElevatedButton(
              child: const Text('hello1'),
              onPressed: () {
                print('helloo1');
              },
            ),
          ),
        ),
        Center(
          child: IgnorePointer(
            child: SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton(
                child: const Text('helloo2'),
                onPressed: () {
                  print('helloo2');
                },
              ),
            ),
          ),
        ),
        Center(
          child: IgnorePointer(
            child: SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton(
                child: const Text('helloo3'),
                onPressed: () {
                  print('helloo3');
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _wrapExample() {
    return SingleChildScrollView(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10,
        runSpacing: 20,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: const Text('Swim'),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: const Text('Swim'),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: const Text('Swim'),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: const Text('Swim'),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: const Text('Swim'),
          ),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          const Chip(label: Text('Travel')),
          Image.asset(
            'assets/apple.jpg',
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height / 5,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/apple.jpg',
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height / 5,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/apple.jpg',
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height / 5,
            fit: BoxFit.fill,
          ),
          Transform.rotate(
            angle: 10,
            child: Image.asset(
              'assets/apple.jpg',
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 5,
              fit: BoxFit.fill,
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: Image.asset(
              'assets/apple.jpg',
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 5,
              fit: BoxFit.fill,
            ),
          ),
          Transform.translate(
            offset: const Offset(-200, -243),
            child: Image.asset(
              'assets/apple.jpg',
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 5,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listExample() {
    // Column
    // Raw
    // listView.builder()  // dynamic
    // Column
    return ListView(
      children: [
        Image.asset(
          'assets/apple.jpg',
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 5,
          fit: BoxFit.fill,
        ),
        Image.asset(
          'assets/img1.jpeg',
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 5,
          fit: BoxFit.fill,
        ),
        Image.asset(
          'assets/img1.jpeg',
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 5,
          fit: BoxFit.fill,
        ),
        Image.asset(
          'assets/apple.jpg',
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 5,
          fit: BoxFit.fill,
        ),
        Image.asset(
          'assets/apple.jpg',
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 5,
          fit: BoxFit.fill,
        ),
        Image.asset(
          'assets/apple.jpg',
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 5,
          fit: BoxFit.fill,
        ),
      ],
      reverse: false,
      shrinkWrap: true,
      padding: const EdgeInsets.all(40),
      physics: const BouncingScrollPhysics(),
    );
  }

  Widget _inputExample() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue, width: 2)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.green, width: 2)),
                // label: Icon(Icons.person),
                labelText: 'Username',
                labelStyle: const TextStyle(fontSize: 20, color: Colors.red),
                hintText: 'Ex. Anas22',
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                hintMaxLines: 3,
                icon: const Icon(Icons.person),
                prefixIcon: const Icon(Icons.store),
                suffixIcon: const Icon(Icons.panorama_fish_eye),
                isDense: true,
                fillColor: Colors.yellow,
                filled: false,
                contentPadding: const EdgeInsets.symmetric(vertical: 30)),
            maxLines: 2,
            onTap: () {
              print('this field is called');
            },
            onChanged: (value) {
              print(value);
            },
            onSubmitted: (value) {
              print('onSubmitted');
              print(value);
              passwordFocusNode.requestFocus();
            },
            onTapOutside: (value) {
              print(value);
              print('outside tapped');
            },
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
            controller: _usernameController,
            focusNode: _usernameFocusNode,
          ),
        ),
        TextField(
          controller: _passwordController,
          focusNode: passwordFocusNode,
          onSubmitted: (c) {
            // passwordFocusNode.unfocus();
            // _usernameFocusNode.requestFocus();
            FocusManager.instance.primaryFocus!.unfocus();
          },
        ),
        ElevatedButton(
            onPressed: () {
              _usernameController.text = "anas";
              setState(() {});
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (c) => LoginScreen()));
              Get.toNamed('/login');
              // Navigator.of(context).pushNamed('/login');
            },
            child: const Text('login')),
        if (_usernameController.text.isNotEmpty) Text(_usernameController.text)
      ],
    );
  }
}
