import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnText;

  Button(
      {this.btnText,
      String btxText,
      Future<Null> Function() onPressed,
      Text child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
