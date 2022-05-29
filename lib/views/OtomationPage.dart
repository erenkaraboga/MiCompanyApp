import 'package:aygun/views/navigations/ScorenNaviPage.dart';
import 'package:aygun/views/devices/scorenPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'devices/lightPage.dart';
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
      body: Column(
        children: [
          buildListTileScoren(Colors.green,Colors.green,'assets/icons/drill.png',"SCOREN"),
          buildListTileLight(Colors.green,Colors.green,'assets/icons/lamb.png',"I-Light"),
          buildListTileShave(Colors.red,Colors.red,'assets/icons/driller.png',"ShaveArt"),
        ],
      ),
    );
  }
  Padding buildListTileScoren(Color glowColor,Color iconColor,String iconPath,String text) {
    return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 20,
            child: ListTile(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ScorenNaviPage()));
              },
                trailing: AvatarGlow(
                  glowColor: glowColor,
                  endRadius: 20.0,
                  duration: Duration(milliseconds: 1000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 300),
                  child: Icon(CupertinoIcons.antenna_radiowaves_left_right,color: iconColor,size: 30),
                ),
                contentPadding: EdgeInsets.fromLTRB(10,20,20,20,),
                leading: Image.asset(iconPath),
                title:Text(text,style: TextStyle(color: Colors.black54,fontSize: 20,fontFamily:"motor" ),
            ),
          ),
        ),
    );

  }
  Padding buildListTileLight(Color glowColor,Color iconColor,String iconPath,String text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 20,
        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LightPage()));
          },
          trailing: AvatarGlow(
            glowColor: glowColor,
            endRadius: 20.0,
            duration: Duration(milliseconds: 1000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 300),
            child: Icon(CupertinoIcons.antenna_radiowaves_left_right,color: iconColor,size: 30),
          ),
          contentPadding: EdgeInsets.fromLTRB(10,20,20,20,),
          leading: Image.asset(iconPath),
          title:Text(text,style: TextStyle(color: Colors.black54,fontSize: 20,fontFamily:"motor" ),
          ),
        ),
      ),
    );

  }
  Padding buildListTileShave(Color glowColor,Color iconColor,String iconPath,String text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 20,
        child: ListTile(
          onTap: (){
              ScaffoldMessenger.of(this.context).showSnackBar(
              SnackBar(
                content: Text("Cihaz yayınlama yapmıyor."),
              ),
            );
          },
          trailing: AvatarGlow(
            glowColor: glowColor,
            endRadius: 20.0,
            duration: Duration(milliseconds: 1000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 300),
            child: Icon(CupertinoIcons.antenna_radiowaves_left_right,color: iconColor,size: 30),
          ),
          contentPadding: EdgeInsets.fromLTRB(10,20,20,20,),
          leading: Image.asset(iconPath),
          title:Text(text,style: TextStyle(color: Colors.black54,fontSize: 20,fontFamily:"motor" ),
          ),
        ),
      ),
    );

  }
}
