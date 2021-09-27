import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/button.dart';
import 'package:food_app/src/Widgets/notification.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/screen/main_screen.dart';

class Success extends StatefulWidget {
  Success({Key key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Payment Confirmation',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/done2.gif'),
              height: 250,
            ),
            Text(
              'Congradulations and welcome to',
              style: TextStyle(fontSize: 15),
            ),
            Text(' Unifoodie!', style: TextStyle(fontSize: 15)),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your payment was successful!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MainScreen(
                      model: MainModel(),
                    ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(60.0),
                ),
                child: Center(
                  child: Text(
                    "Back to home",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
