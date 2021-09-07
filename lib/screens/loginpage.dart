import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(hintText: "Enter Phone"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _auth
                        .signInWithPhoneNumber(phoneController.text)
                        .then((value) => {print(value)})
                        .catchError((err) => {print(err)});
                    // .verifyPhoneNumber(
                    //     phoneNumber: phoneController.text,
                    //     verificationCompleted:
                    //         (PhoneAuthCredential phoneAuthCredential) async {
                    //       print(phoneAuthCredential);
                    //     },
                    //     verificationFailed:
                    //         (FirebaseAuthException verificationFailed) async {
                    //       print(
                    //           "failed sent: " + verificationFailed.toString());
                    //     },
                    //     codeSent:
                    //         (String verificationId, int? resendingToken) async {
                    //       print("code sent: " + verificationId);
                    //     },
                    //     codeAutoRetrievalTimeout:
                    //         (String verificationId) async {});
                  },
                  child: Text("Verify Phone"),
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 150, vertical: 20)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
