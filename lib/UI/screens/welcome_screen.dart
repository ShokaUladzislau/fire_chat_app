import 'package:fire_chat_app/UI/elements/rounded_button.dart';
import 'package:fire_chat_app/UI/screens/login_screen.dart';
import 'package:fire_chat_app/UI/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  State<StatefulWidget> createState() {
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Hero(
                        tag: 'logo',
                        child: Container(
                          height: animation.value * 100,
                          width: 100,
                          child: Image.asset('images/logo.png'),
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    AnimatedTextKit(animatedTexts: [
                      TypewriterAnimatedText(
                        'Fire chat',
                        textStyle: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                        speed: Duration(milliseconds: 125),
                      ),
                    ], totalRepeatCount: 1)
                  ],
                ),
              ),
              SizedBox(height: 48),
              RoundedButton(
                color: Colors.amber,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                text: 'Login',
              ),
              RoundedButton(
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                  text: 'Register')
            ],
          )),
    );
  }
}
