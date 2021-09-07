import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
      {Key? key,
      required this.controller,
      required this.onClickFunction,
      required this.buttonText,
      this.hintText: ""})
      : super(key: key);

  final TextEditingController controller;
  final Function onClickFunction;
  final String hintText;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: controller,
                  // controller: phoneController,
                  decoration: InputDecoration(hintText: this.hintText),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => this.onClickFunction(),
                  // onPressed: () async {
                  //   // await _auth
                  //   //     .signInWithPhoneNumber(phoneController.text)
                  //   //     .then((value) => {print(value)})
                  //   //     .catchError((err) => {print(err)});
                  // },
                  child: Text(buttonText),
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