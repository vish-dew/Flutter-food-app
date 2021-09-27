import 'package:flutter/material.dart';

class ButtonF extends StatelessWidget {
  final String btzText;

  ButtonF({this.btzText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: 45.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              offset: Offset(0, 4.0),
              color: Colors.black38,
            )
          ],
          image: DecorationImage(image: AssetImage("assets/facebook.jpg"))),
      // child: Center(
      //   child: Text(
      //     "$btzText",
      //     style: TextStyle(
      //         color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
      //   ),
      // ),
    );
  }
}
