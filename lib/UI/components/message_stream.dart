import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat_app/UI/elements/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _fireStore.collection('messages').orderBy("time").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          final messages = snapshot.data!.docs.reversed;
          List<Widget> messageWidgets = [];

          for (var message in messages) {
            final messageText = message.data()['text'];
            final messageSender = message.data()['sender'];
            final messageWidget = MesasgeBubble(
                messageSender: messageSender,
                messageText: messageText,
                loggedUser: messageSender == _auth.currentUser!.email);
            messageWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              children: messageWidgets,
              reverse: true,
            ),
          );
        });
  }
}
