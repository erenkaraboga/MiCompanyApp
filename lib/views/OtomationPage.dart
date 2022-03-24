import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class OtomationPage extends StatefulWidget {
  const OtomationPage({Key? key}) : super(key: key);

  @override
  _OtomationPageState createState() => _OtomationPageState();
}

class _OtomationPageState extends State<OtomationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            child: Image.asset('assets/images/aygunlogo.jpg',fit: BoxFit.fitWidth,
              width: 250,
              height: 250,
            ),
          ),
        ),
      ),
      body: Container(child: Text("Otomation Page"),),
    );
  }
}
