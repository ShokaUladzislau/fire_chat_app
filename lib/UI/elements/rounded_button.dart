import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final MaterialColor color;
  final Function onPressed;
  final String text;

  RoundedButton(
      {required this.color, required this.onPressed, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30),
        elevation: 8.0,
        child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          minWidth: 200,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
