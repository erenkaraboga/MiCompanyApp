import 'package:aygun/drawer/DrawerWidget.dart';
import 'package:flutter/material.dart';

import '../../viewmodel/CustomAppBar.dart';
class MotorPage extends StatelessWidget {
  final VoidCallback openDrawer;
  const MotorPage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(openDrawer: openDrawer, icon: Icon(Icons.menu,color: Colors.green)),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset('assets/images/karinca/karinca.jpg',
            height: 320,
            width: 450,
            fit: BoxFit.fitHeight,
          ),
          Image.asset('assets/images/karinca/karincaDetay.jpg',
            height: 350,
            width: 400,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    ),
    );
  }
}


