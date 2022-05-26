import 'dart:ffi';
import 'package:aygun/views/OtomationPage.dart';
import 'package:aygun/views/ProfilePage.dart';
import 'package:aygun/views/navigations/ScorenNaviPage.dart';
import 'package:aygun/views/SettingsPage.dart';
import 'package:aygun/views/devices/scorenPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:aygun/viewmodel/CustomAppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.openDrawer}) : super(key: key);
  final VoidCallback openDrawer;

  @override
  State<HomePage> createState() => _HomePageState();
}
Future main()async {
  runApp(const MyApp());

}
class _HomePageState extends State<HomePage> {
  final screens= [
    ProfilePage(),
    OtomationPage(),
    SettingsPage()
  ];
  int index = 1;
  @override
  Widget build(BuildContext context) {
   final items=<Widget>[
     Icon(CupertinoIcons.antenna_radiowaves_left_right,color: Colors.grey.shade800,),
     Icon(Icons.workspaces_outline),
     Icon(Icons.settings ,color: Colors.grey.shade800,),
   ];
    return Scaffold(
    bottomNavigationBar:buildCurvedNavigationBar(items),
    body: screens[index],
    );
  }

  CurvedNavigationBar buildCurvedNavigationBar(List<Widget> items) {
    return CurvedNavigationBar(items: items,
    color: Colors.grey.shade300,
      height: 60,
      index: index,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeOutCubic,
      onTap:(index)=>setState(() {
        this.index=index;
      }),
  );
  }
}
