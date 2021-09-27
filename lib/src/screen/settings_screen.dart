import 'package:flutter/material.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/screen/main_screen.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Contact us",
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
        body: Row(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
