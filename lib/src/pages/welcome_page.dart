import 'package:flutter/material.dart';
import 'package:food_app/src/pages/sigin_page.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/screen/main_screen.dart';

class WelcomePage extends StatelessWidget {
  final MainModel mainModel = MainModel();
  final MainModel model;

  WelcomePage(
      {this.model, Map<String, Widget Function(BuildContext context)> routes});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: 200,
              color: Colors.white,
              child: Center(
                child: Image.asset(
                  "assets/Unifoodie.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "Welcome to UniFoodie!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                Text(
                  "Order food from our University Canteen App ",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "and make reservation in real-time",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 140.0,
            ),
            Container(
              height: 50,
              width: 330,
              child: RaisedButton(
                color: Colors.white,
                // greenAccent.shade700
                shape: RoundedRectangleBorder(
                  side:
                      BorderSide(color: Colors.greenAccent.shade700, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => MainScreen(
                      model: mainModel,
                    ),
                  ));
                },
                child: Text(
                  "Get started",
                  style: TextStyle(
                      fontSize: 18, color: Colors.greenAccent.shade700),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 38.0,
            ),
            // Column(
            //   children: [
            //     Text(
            //       "By signig up i accept the terms of use and the data privary policy",
            //       style: TextStyle(fontSize: 10),
            //     ),
            //     SizedBox(
            //       height: 5,
            //     ),
            //     Text(
            //       "© 2021 · VisH Software Solutions · All Rights Reserved.",
            //       style: TextStyle(fontSize: 10),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
