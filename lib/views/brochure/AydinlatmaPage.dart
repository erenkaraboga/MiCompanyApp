import 'package:aygun/viewmodel/CustomAppBar.dart';
import 'package:aygun/drawer/DrawerWidget.dart';
import 'package:aygun/views/brochure/MotorPage.dart';
import 'package:flutter/material.dart';
class AydinlatmaPage extends StatelessWidget {
  final VoidCallback openDrawer;
  const AydinlatmaPage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(openDrawer: openDrawer, icon: Icon(Icons.menu,color: Colors.blue,)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/aydinlatma/aydinlatmaLight.jpg',
              height: 400,
              width: 450,
              fit: BoxFit.fitHeight,

            ),
            Image.asset('assets/images/aydinlatma/aydinlatma.jpg',
              height: 250,
              width: 600,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
  }
}

