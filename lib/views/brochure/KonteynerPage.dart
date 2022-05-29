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
      appBar:CustomAppBar(openDrawer: openDrawer, icon: Icon(Icons.menu,color: Colors.cyanAccent)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/konteyner/konteyner.jpg',
              height: 250,
              width: 500,
              fit: BoxFit.fitWidth,

            ),
            Image.asset('assets/images/konteyner/konteynerdesc.jpg',
              height: 450,
              width: 400,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
    )
    );
  }
}
