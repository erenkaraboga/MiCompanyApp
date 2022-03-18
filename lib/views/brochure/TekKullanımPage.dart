import 'package:aygun/drawer/DrawerWidget.dart';
import 'package:flutter/material.dart';

import '../../viewmodel/CustomAppBar.dart';
class TekKullanim extends StatelessWidget {
  final VoidCallback openDrawer;
  const TekKullanim({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(openDrawer: openDrawer, icon: Icon(Icons.menu,color: Colors.orange))
    );
  }
}
