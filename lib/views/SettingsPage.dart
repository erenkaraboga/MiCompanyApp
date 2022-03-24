import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final user = FirebaseAuth.instance.currentUser!;
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
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            shadowColor: Colors.grey,
            child: InkWell(
              borderRadius: BorderRadius.circular(25.0),
              onTap: (){
              },
              child: ListTile(
                  leading:  CircleAvatar(radius: (30),
                      backgroundColor: Colors.white,
                      child: ClipOval(

                        child: Image.asset('assets/images/aygunlogo.jpg',fit: BoxFit.cover,),
                      )
                  ),
                  subtitle: Text(user.email.toString()),
                  title: Text("Admin")
              ),
            ),
          ),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            shadowColor: Colors.grey,
            child: Column(
              children: [
                InkWell(child: buildListTile(Icon(CupertinoIcons.person),"Profil"),
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: (){
                  },),
                InkWell(child: buildListTile(Icon(CupertinoIcons.lock),"Güvenlik"),
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: (){
                  },),
                InkWell(child: buildListTile(Icon(CupertinoIcons.bell),"Bildirimler"),
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: (){
                  },),
                InkWell(child: buildListTile(Icon(CupertinoIcons.bluetooth),"Bluetooth"),
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: (){
                    AppSettings.openBluetoothSettings();
                  },) ,
                ],
            ),
          ),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            shadowColor: Colors.grey,
            child: Column(
              children: [
                InkWell(child: buildListTile(Icon(Icons.lightbulb_outline),"Deneysel Özellikler"),
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: (){
                  },),
              ],
            ),
          ),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            shadowColor: Colors.grey,
            child: Column(
              children: [
                InkWell(child: buildListTile(Icon(Icons.help_outline_outlined),"Yardım"),
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: (){
                  },),
                InkWell(child: buildListTile(Icon(Icons.star_outline_outlined),"Değerlendir"),
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: (){},
                ),
                InkWell(child: buildListTile(Icon(Icons.power_settings_new_outlined),"Çıkış yap"),
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: (){
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
          ),
        ],
    )
    );
  }

  ListTile buildListTile(Icon icon ,String name) {
    return ListTile(
      trailing: Icon(CupertinoIcons.chevron_forward),
      leading:  Container(
                  height: double.infinity,
                  child: icon,
                 ),
                 title: Text(name),);
  }
}
/*,*/