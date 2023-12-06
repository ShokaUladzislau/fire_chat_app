import 'package:fire_chat_app/UI/screens/chat_screen.dart';
import 'package:fire_chat_app/UI/screens/login_screen.dart';
import 'package:fire_chat_app/UI/screens/welcome_screen.dart';
import 'package:fire_chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'UI/screens/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FireChat());
}

class FireChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
