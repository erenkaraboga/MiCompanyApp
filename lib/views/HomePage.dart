import 'dart:ffi';

import 'package:aygun/viewmodel/CustomAppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../main.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(icon:Icon(Icons.account_box),color: Colors.grey, onPressed: () {
         FirebaseAuth.instance.signOut();
       },
       ),
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            padding: EdgeInsetsDirectional.only(end: 30),
            child: Image.asset('assets/images/aygunlogo.jpg',fit: BoxFit.fitWidth,
              width: 250,
              height: 250,
            ),
          ),
        ),
      ),
    );
  }
}
