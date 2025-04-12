import 'package:flutter/material.dart';

import 'views/contact_us_tab.dart';
import 'views/home_tab.dart';
import 'views/settings_tab.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Tabs Screen'),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(
              child: Text(
                'Home',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Tab(
              child: Text(
                'Contact Us',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Tab(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Tab(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Tab(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Tab(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
          controller: controller,
          enableFeedback: true,
          isScrollable: true,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.yellow, Colors.orangeAccent])),
          indicatorPadding: EdgeInsets.all(10),
          indicatorWeight: 7,
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          HomeTab(
            tabController: controller,
          ),
          ContactUsTab(),
          SettingsTab(),
          SettingsTab(),
          SettingsTab(),
          SettingsTab(),
        ],
      ),
    );
  }
}
