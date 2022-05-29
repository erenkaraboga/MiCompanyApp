
import 'package:aygun/views/OtomationPage.dart';
import 'package:aygun/views/SettingsPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
    OtomationPage(),
    SettingsPage()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
   final items=<Widget>[
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
