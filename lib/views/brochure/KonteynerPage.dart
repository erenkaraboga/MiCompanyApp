import 'package:aygun/viewmodel/CustomAppBar.dart';
import 'package:aygun/drawer/DrawerWidget.dart';
import 'package:flutter/material.dart';

import '../../viewmodel/HomePageWidgetHelper.dart';
class KonteynerPage extends StatelessWidget {
  final VoidCallback openDrawer;
  const KonteynerPage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(openDrawer: openDrawer, icon: Icon(Icons.menu,color: Colors.cyanAccent))
    );
  }
}
