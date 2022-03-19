import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../viewmodel/CustomAppBar.dart';
import '../viewmodel/HomePageWidgetHelper.dart';
class SignInPage extends StatefulWidget {
  final VoidCallback openDrawer;
  SignInPage({Key? key,required this.openDrawer}) : super(key: key);
  @override
  State<SignInPage> createState() => _SignInPageState();
}
class _SignInPageState extends State<SignInPage> {
  late TextEditingController mailController;
  late TextEditingController passwordController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();


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
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(openDrawer: widget.openDrawer, icon: Icon(Icons.menu,color: Colors.black)),
        body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(color:Color.fromRGBO(243, 243, 243, 100)),
            child: Column(
              children: [
              Container(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Hero(
                tag: 'hero',
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60.0,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/icons/user.png',
                        fit: BoxFit.cover,
                        width: 160.0,
                        height: 160.0,
                      ),
                    )),
            ),
              ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(),
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: mailController,
                          decoration: textFieldDecoration("Mail"),
                          style: simpleTextStyle(),
                          validator: (val) {
                            if (val!.isEmpty||!val.contains("@")) {
                              return "Geçerli Bir Mail Giriniz";
                            }
                            else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(width: 10,height: 10,),
                        TextFormField(
                          controller: passwordController,
                          decoration: textFieldDecoration2("Şifre"),
                          style: simpleTextStyle(),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Geçerli Bir Şifre Giriniz";
                            }
                            else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 8,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: Text("Şifremi Unuttum",style: simpleTextStyle()),
                          alignment: Alignment.bottomRight,
                        ),

                        GestureDetector(
                          onTap: (){
                            signIn();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Text("Giriş",style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54
                            ),
                            ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 20),

                          ),
                        ),
                        SizedBox(height: 15,),
                        GestureDetector(
                          onTap: widget.openDrawer,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(0.2),

                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text("Müşteri Tanıtımı",style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54
                            ),
                            ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 20),

                          ),
                        ),
                        SizedBox(height: 15,),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  child: DefaultTextStyle(
                      style: TextStyle(
                          fontFamily: "riesling",
                          color: Colors.black,
                          fontSize: 35
                      ),
                      child:AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            'Cerrahinin Bulusma Noktası..',
                            speed: const Duration(milliseconds: 200),
                          ),
                        ],
                        totalRepeatCount: 1000,
                        pause: const Duration(milliseconds: 1000),
                      ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Future signIn()  async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mailController.text.trim(),
        password: passwordController.text.trim());

  }
}

