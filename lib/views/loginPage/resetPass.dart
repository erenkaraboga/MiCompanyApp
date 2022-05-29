
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ResetPasswordPage extends StatefulWidget {
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}
class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late TextEditingController emailController;
  void initState() {
    // TODO: implement initState
    emailController= new TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 100, left: 40, right: 40),
          color: Colors.white,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 50,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Column(
                      children:  <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        Image.asset('assets/images/unlock.png',width: 100,height: 100,),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Şifreyi Sıfırla",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Sıfırlama bağlantısı için mailinizi giriniz.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.3, 1],
                              colors: [
                               Colors.grey,
                               Colors.black45
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: SizedBox.expand(
                            child: FlatButton(
                              child: const Text(
                                "Gönder",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: resetPass
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future resetPass() async {
    showDialog(context: this.context,barrierDismissible: false, builder:(context)=>Center(child: CircularProgressIndicator(
      color: Colors.grey,
    ),));
     try{
       await FirebaseAuth.instance.sendPasswordResetEmail(email:emailController.text.trim());
       await  ScaffoldMessenger.of(this.context).showSnackBar(
         SnackBar(
           content: Text("Mail doğrulama bağlantısı gönderildi"),
         ),
       );
       Navigator.of(this.context).popUntil((route) => route.isFirst);
     }on FirebaseAuthException catch (e) {
       print(e);
       Navigator.of(this.context).pop();
     }
  }
}