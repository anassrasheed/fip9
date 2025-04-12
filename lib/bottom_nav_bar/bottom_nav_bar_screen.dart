import 'dart:io';

import 'package:fip9/tabs/tabs_screen.dart';
import 'package:fip9/tabs/views/home_tab.dart';
import 'package:fip9/tabs/views/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _index = 0;
  DateTime? lastPressed;
  List<TabModel> _tabs = [
    TabModel(title: 'Home', screen: HomeTab()),
    TabModel(title: 'MyAccount', screen: const TabsScreen()),
    TabModel(title: 'MyAccount', screen: const TabsScreen()),
    TabModel(title: 'Settings', screen: const SettingsTab()),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: _buildNavBar(),
        ));
  }

  _buildNavBar() {
    return PersistentTabView(
      context,
      screens: _tabs.map((e) => e.screen).toList(),
      navBarHeight: 60,
      navBarStyle: NavBarStyle.style4,
      onItemSelected: (nIndex) {
        setState(() {
          _index = nIndex;
        });
      },
      items: [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: 'Home',
            activeColorPrimary: _index == 0 ? Colors.red : Colors.blue),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.person),
            title: 'MyAccount',
            activeColorPrimary: _index == 1 ? Colors.red : Colors.blue),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.person),
            title: 'MyAccount',
            activeColorPrimary: _index == 2 ? Colors.red : Colors.blue),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.settings),
            title: 'Settings',
            activeColorPrimary: _index == 3 ? Colors.red : Colors.blue),
      ],
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      resizeToAvoidBottomInset: true,
      handleAndroidBackButtonPress: true,
      confineToSafeArea: true,
      onWillPop: (c) async {
        final DateTime now = DateTime.now();
        final bool backPressed = lastPressed != null &&
            now.difference(lastPressed!) < const Duration(seconds: 2);
        if (backPressed) {
          exit(0);
          return Future.value(true);
        }
        lastPressed = now;
        // toast press again to exit
        return Future.value(false);
      },
    );
  }
}

class TabModel {
  String title;
  Widget screen;
  Widget? icon;

  TabModel({required this.title, required this.screen, this.icon});
}
