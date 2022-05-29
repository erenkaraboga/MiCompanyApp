import 'package:aygun/drawer/DrawerWidget.dart';
import 'package:flutter/material.dart';

import '../../viewmodel/CustomAppBar.dart';
class TekKullanim extends StatelessWidget {
  final VoidCallback openDrawer;
  const TekKullanim({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(openDrawer: openDrawer, icon: Icon(Icons.menu,color: Colors.orange)),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/steril/steril.jpg',
                  height: 345,
                  width: 500,
                  fit: BoxFit.fitWidth,

                ),
                Image.asset('assets/images/steril/sterildesc.jpg',
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
