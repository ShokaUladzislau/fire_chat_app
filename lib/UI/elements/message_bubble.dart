import 'package:flutter/material.dart';

class MesasgeBubble extends StatelessWidget {
  final messageSender;
  final messageText;
  final loggedUser;

  MesasgeBubble({this.messageSender, this.messageText, this.loggedUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            loggedUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            messageSender,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Material(
            elevation: 5,
            color: loggedUser ? Colors.amber : Colors.orange,
            borderRadius: loggedUser
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30))
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(messageText, style: const TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
