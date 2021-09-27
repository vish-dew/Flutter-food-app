import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/small_button.dart';

class FoodItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  FoodItemCard(this.title, this.description, this.price);
  // var _mediumSpace = SizedBox(
  //   height: 20.0,
  // );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 120.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            offset: Offset(0, 0.5),
            color: Colors.black26,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20.0),
            width: 95.0,
            height: 90.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/breakfast.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$title",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 200.0,
                child: Text("$description"),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 230.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "\u20A8 $price",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    SmallButton(btnText: "Buy"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
