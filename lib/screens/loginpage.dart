import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/widgets/loginForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MobileVerificationState { PHONE_STATE, OTP_STATE }

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  late ConfirmationResult confirmationResult;
  late UserCredential userCredential;

  MobileVerificationState currentState = MobileVerificationState.PHONE_STATE;

  Future phoneFunc() async {
    print("Clicking " + "+91" + phoneController.text);
    try {
      // "+91" +
      confirmationResult =
          await _auth.signInWithPhoneNumber("+91" + phoneController.text);
      setState(() {
        currentState = MobileVerificationState.OTP_STATE;
      });
      // .then((_credential) => {print(_credential)})
      // .catchError((err) => {print(err)});
    } catch (e) {
      print(e);
    }
  }

  Future otpFunc() async {
    print("Clicking OTP" + otpController.text);
    try {
      userCredential = await confirmationResult.confirm(otpController.text);
      print("OTP Verified baba" + userCredential.toString());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: currentState == MobileVerificationState.PHONE_STATE
            ? LoginForm(
                controller: phoneController,
                onClickFunction: phoneFunc,
                hintText: "Enter Phone Number",
                buttonText: "Send OTP",
              )
            : LoginForm(
                controller: otpController,
                onClickFunction: otpFunc,
                hintText: "Enter OTP Number",
                buttonText: "Verify OTP",
              ));
  }
}
