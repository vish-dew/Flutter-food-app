import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/bought_foods.dart';
import 'package:food_app/src/Widgets/food.category.dart';
import 'package:food_app/src/Widgets/search_field.dart';
import 'package:food_app/src/pages/food_details_page.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../Widgets/home_top_info.dart';
//widget
import '../Widgets/bought_foods.dart';
//Model
import '../models/food_model.dart';

class Homepage extends StatefulWidget {
  //final FoodModel foodModel;

  // Homepage(this.foodModel);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //List<Food> _foods = foods;

  @override
  void initState() {
    //widget.foodModel.fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          Foodcategory(),
          SizedBox(
            height: 20.0,
          ),
          SearchField(),
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
                child: Text("View all",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    )),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return Column(
                children: model.foods.map(_buildFoodItems).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItems(Food food) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => FoodDetailsPage(
            food: food,
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        // child: BoughtFoods(
        //   //COMMENTED THIS
        //   id: food.id,
        //   name: food.name,
        //   imagepath: "assets/breakfast.jpg",
        //   category: food.category,
        //   discount: food.discount,
        //   price: food.price,
        //   ratings: food.ratings,
        // ),
      ),
    );
  }
}
