import 'package:flutter/material.dart';

class Foodcard extends StatelessWidget {
  final String categoryname;
  final String imagepath;
  final int numberOfitems;

  Foodcard({this.categoryname, this.imagepath, this.numberOfitems});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage(imagepath),
              height: 65.0,
              width: 65.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  categoryname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Text(
                  "$numberOfitems Kinds",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
