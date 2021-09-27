import 'package:flutter/material.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/screen/main_screen.dart';

class ContactUsPage extends StatelessWidget {
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
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Column(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                      "Contact us",
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
                      "Any question or Remarks? just Call or Email us.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
            Center(
              child: Card(
                color: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                child: Container(
                  height: 350,
                  padding: EdgeInsets.all(40),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Contact Information",
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                            child: Text(
                          '-------------------------------------------------',
                          style: TextStyle(color: Colors.white),
                        )),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.call, color: Colors.white),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                "0741 255 849",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.email, color: Colors.white),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                "vishmithadevinda102@gmail.com",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                "Colombo",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
