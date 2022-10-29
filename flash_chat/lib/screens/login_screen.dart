import 'dart:math';

import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/roundedButtons.dart';
import 'package:flutter/material.dart';
import 'package:logo_n_spinner/logo_n_spinner.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showspinner = true;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    int degrees = 360;
    final angle = degrees * pi / 180;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Transform.rotate(
                  angle: angle,
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration: KTextFeildDecoration.copyWith(
                      hintText: 'Enter Your email',
                      hintStyle: TextStyle(color: Colors.grey))),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: KTextFeildDecoration.copyWith(
                  hintText: 'Enter Your password',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              RoundedButton(
                  title: 'Login',
                  colour: Colors.lightBlueAccent,
                  onPressed: () async {
                    setState(() {
                      LogoandSpinner(
                        imageAssets: 'images/logo.png',
                        reverse: true,
                        arcColor: Colors.blue,
                        spinSpeed: Duration(milliseconds: 500),
                      );
                    });

                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showspinner = false;
                      });
                    } catch (e) {
                      print(e);
                      CoolAlert.show(
                        backgroundColor: Colors.white,
                        context: context,
                        type: CoolAlertType.error,
                        text: "Invalid Credentials",
                      );
                      setState(() {
                        showspinner = false;
                      });
                      print('Invalid credentials');
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
