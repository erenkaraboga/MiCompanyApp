
import 'package:aygun/model/DrawerModel.dart';
import 'package:aygun/views/navigations/HomeNaviPage.dart';
import 'package:aygun/views/brochure/AydinlatmaPage.dart';
import 'package:aygun/views/brochure/KonteynerPage.dart';
import 'package:aygun/views/brochure/MotorPage.dart';
import 'package:aygun/views/brochure/TekKullan%C4%B1mPage.dart';
import 'package:aygun/views/loginPage/SignInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'drawer/DrawerWidget.dart';

Future<void> main()async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}
final navigatorKey=GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     navigatorKey: navigatorKey,
      home:  Aygun(),
    debugShowCheckedModeBanner: false,
    );
  }
}
class Aygun extends StatefulWidget {
  const Aygun({Key? key}) : super(key: key);
  @override
  _AygunState createState() => _AygunState();
}
class _AygunState extends State<Aygun> {
  late  double xOffset;
  late  double yOffset;
  late  double scaleFactor;
  DrawerItem item = DrawerItems.home;
  @override
  void initState() {
   closeDrawer();
    super.initState();
  }
  void openDrawer()=>setState(() {
     xOffset=275;
     yOffset=150;
     scaleFactor=0.6;
  });
  void closeDrawer()=>setState(() {
    xOffset=0;
    yOffset=0;
    scaleFactor=1;
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return HomePage(openDrawer: openDrawer);
          }
          else{
           return Stack(
              children: [
                buildDrawer(),
                buildPage()
              ],
            );
          }
        },
      )
    );
  }
Widget buildPage(){
    return GestureDetector(
      onTap: closeDrawer,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        transform:Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor) ,
        child: getDrawerPage()
      ),
    );
}
Widget buildDrawer()=>DrawerWidget(onSelectedItem:(item){
  setState(()=>this.item=item);
  closeDrawer();
},);
Widget getDrawerPage(){
 if(item==DrawerItems.motor){
   return MotorPage(openDrawer: openDrawer);
 }
 else if(item==DrawerItems.aydinlatma){
   return AydinlatmaPage(openDrawer: openDrawer,);
 }
 else if(item==DrawerItems.konteyner){
   return KonteynerPage(openDrawer: openDrawer);
 }
 else if(item==DrawerItems.tek){
   return TekKullanim(openDrawer: openDrawer);
 }
 else {
  return Sample1(openDrawer: openDrawer);
 }
}
}

