import 'package:flutter/material.dart';

class ButtonG extends StatelessWidget {
  final String btxText;

  ButtonG({this.btxText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: 45.0,
      decoration: BoxDecoration(
          color: Colors.red.shade800,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              offset: Offset(0, 4.0),
              color: Colors.black38,
            )
          ],
          image: DecorationImage(image: AssetImage("assets/google.jpg"))),
      // child: Center(
      //   child: Text(
      //     "$btxText",
      //     style: TextStyle(
      //         color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
      //   ),
      // ),
    );
  }
}
// Container(
//                     height: 100.0,
//                     width: 100.0,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(60.0),
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 3.0,
//                             offset: Offset(0, 4.0),
//                             color: Colors.black38,
//                           )
//                         ],
//                         image: DecorationImage(
//                           image: AssetImage("assets/Prof.jpg"),
//                           fit: BoxFit.cover,
//                         )),
//                   ),