import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/food.category.dart';
import 'Widgets/home_top_info.dart';
// ignore: unused_import
import 'Widgets/search_field.dart';
// ignore: unused_import
import 'Widgets/bought_foods.dart';

//data
import 'data/food_data.dart';
import 'models/food_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: unused_field
  List<Food> _Foods = foods;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          Foodcategory(),
          SizedBox(
            height: 20.0,
          ),
          //SearchField(),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Frequently Bought Foods",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text("view all",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent)),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: foods.map(_buildFoodItems).toList(),
          ),
        ],
      ),
    );
  }

  _buildFoodItems(Food foods) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      // child: BoughtFoods(
      //   id: foods.id,
      //   name: foods.name,
      //   imagepath: foods.imagePath,
      //   category: foods.category,
      //   discount: foods.discount,
      //   price: foods.price,
      //   ratings: foods.ratings,
      // ),
    );
  }
}
