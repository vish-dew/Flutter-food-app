import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/button.dart';
import 'package:food_app/src/Widgets/order_card.dart';
import 'package:food_app/src/pages/order_page.dart';

class FoodCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "App Notifications",
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
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              }),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

// _buildTotalcontainer() {}




