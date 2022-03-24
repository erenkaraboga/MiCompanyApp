import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Sample1 extends StatefulWidget {
  static const String id = 'mentor sample 1';
  final VoidCallback openDrawer;
  const Sample1({Key? key, required this.openDrawer}) : super(key: key);

  @override
  _Sample1State createState() => _Sample1State();
}
late TextEditingController mailController;
late TextEditingController passwordController;
final scaffoldKey = GlobalKey<ScaffoldState>();
final formKey = GlobalKey<FormState>();
class _Sample1State extends State<Sample1> {
  void initState() {
    // TODO: implement initState
    mailController=new  TextEditingController();
    passwordController= new TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            padding: EdgeInsetsDirectional.only(end:0 ),
            child: Image.asset('assets/images/aygunlogo.jpg',fit: BoxFit.fitWidth,
              width: 250,
              height: 250,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.grey.shade700,
                  Colors.grey.shade300,
                  Colors.grey.shade200,
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            // #login, #welcome
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("AyHome",style: TextStyle(color: Colors.white,fontSize: 35,fontFamily:"beatiful" ),),
                  SizedBox(height: 10,),
                  Text("Giris",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily:"beatiful"),),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(height: 60,),
                        // #email, #password
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const[
                              BoxShadow(
                                  color: Color.fromRGBO(171, 171, 171, .7),blurRadius: 20,offset: Offset(0,10)),
                            ],
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200)
                                    ),
                                  ),
                                  child:  TextFormField(
                                    controller: mailController,
                                     validator: (val) {
                                      if (val!.isEmpty||!val.contains("@")) {
                                        return "Geçerli Bir Mail Giriniz";
                                      }
                                      else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(Icons.mail,color: Colors.grey,),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                  ),
                                  child:  TextFormField(
                                    controller: passwordController,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Geçerli Bir Şifre Giriniz";
                                      }
                                      else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        hintText: "Şifre",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(Icons.password_sharp,color: Colors.grey)
                                        ,
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // #login
                        InkWell(
                          onTap: (){
                            if(formKey.currentState!.validate()){
                              signIn();
                            }
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey
                            ),
                            child: const Center(
                              child: Text("Giriş",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // #login SNS
                        const Text("Şifremi Unuttum",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  widget.openDrawer();
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blueGrey.shade400
                                  ),
                                  child: const Center(
                                    child: Text("Broşür",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future signIn()  async{
    showDialog(context: context,barrierDismissible: false, builder: (context)=>Center(child: CircularProgressIndicator(),));
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: mailController.text.trim(),
          password: passwordController.text.trim());
    }on FirebaseAuthException catch (e){
      print(e.message);
    }
    navigatorKey.currentState!.popUntil((route) =>route.isFirst);

  }
}