import 'package:fire_chat_app/UI/elements/rounded_button.dart';
import 'package:fire_chat_app/UI/screens/chat_screen.dart';
import 'package:fire_chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreen();
  }
}

class _RegisterScreen extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool progress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: Colors.amber,
        ),
        inAsyncCall: progress,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email.'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password.'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  color: Colors.orange,
                  onPressed: () async {
                    setState(() {
                      progress = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser.user != null) {
                        resetPageData();
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.amber,
                          duration: Duration(days: 365),
                          content: Text(
                            e.code,
                            style: TextStyle(color: Colors.black),
                          ),
                          action: SnackBarAction(
                            label: 'OK',
                            backgroundColor: Colors.orange,
                            textColor: Colors.black,
                            onPressed: () {
                              resetPageData();
                            },
                          ),
                        ),
                      );
                    }
                  },
                  text: 'Register'),
            ],
          ),
        ),
      ),
    );
  }

  void resetPageData() {
    setState(() {
      progress = false;
      email = '';
      password = '';
    });
  }
}
