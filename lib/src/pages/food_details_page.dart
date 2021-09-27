import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/button.dart';
import 'package:food_app/src/models/food_model.dart';
import 'package:food_app/src/pages/explore_page.dart';

// ignore: must_be_immutable
class FoodDetailsPage extends StatelessWidget {
  final Food food;

  FoodDetailsPage({this.food});

  var _mediumSpace = SizedBox(
    height: 20.0,
  );
  var _smallSpace = SizedBox(
    height: 20.0,
  );
  var _largeSpace = SizedBox(
    height: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            //Recently Added from here
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => FavoritePage()),
              );
            },
          ),
          elevation: 0.0,
          title: Text(
            "Food details",
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/breakfast.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              _mediumSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    food.name,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  Text(
                    "\u20A8 ${food.price}",
                    style: TextStyle(
                        fontSize: 18.0, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              _mediumSpace,
              Text(
                "Description:",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
              _smallSpace,
              Text(
                "${food.description}",
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.remove_circle), onPressed: null),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "1",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  IconButton(icon: Icon(Icons.add_circle), onPressed: null),
                ],
              ),
              _largeSpace,
              Button(
                btnText: "Add to cart",
              ),
            ],
          ),
        ),
      ),
    );
  }
}








































/*import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/button.dart';
import 'package:food_app/src/models/food_model.dart';

// ignore: must_be_immutable
class FoodDetailsPage extends StatelessWidget {
  final Food food;

  FoodDetailsPage({
    this.food,
  });

  var _mediumSpace = SizedBox(
    height: 20.0,
  );

  var _smallSpace = SizedBox(
    height: 10.0,
  );

  var _largeSpace = SizedBox(
    height: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Food Details",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/breakfast.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              _mediumSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    food.name,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  Text(
                    "\u{20b5} ${food.price}",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              _mediumSpace,
              Text(
                "Description:",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              _smallSpace,
              Text(
                "${food.description}",
                textAlign: TextAlign.justify,
              ),
              _mediumSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.add_circle), onPressed: null),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "1",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  IconButton(icon: Icon(Icons.remove_circle), onPressed: null),
                ],
              ),
              _largeSpace,
              Button(
                btnText: "Add to cart",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/ 