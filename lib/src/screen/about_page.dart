import 'package:flutter/material.dart';

import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/screen/main_screen.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "About us",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => MainScreen(
                          model: MainModel(),
                        )));
              }),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  "About us",
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
            Container(
              height: 200,
              width: 200,
              color: Colors.white,
              child: Center(
                child: Image.asset(
                  "assets/Unifoodie.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  "We are the Admins of UniFoodie Canteen Mobile Application ",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Project. this project is our first mobile application.",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "D.G Vishmitha Devinda Weerasinghe (Admin)",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "HND Batch-08",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "CINEC Campus - Malabe",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // SizedBox(
            //   height: 140.0,
            // ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
