import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/food_item_card.dart';
import 'package:food_app/src/Widgets/search_field.dart';
import 'package:food_app/src/Widgets/show_dialog.dart';
import 'package:food_app/src/admin/pages/add_food_item.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoritePage extends StatefulWidget {
  final MainModel model;

  FavoritePage({this.model});
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  GlobalKey<ScaffoldState> _explorePageScaffoldkey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.model.fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _explorePageScaffoldkey,
      backgroundColor: Colors.white,
      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext sctx, Widget child, MainModel model) {
          // model.fetchFoods(); //this will fetch and notifylisterner
          // List<Food> foods = model.foods;

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: RefreshIndicator(
              onRefresh: model.fetchFoods,
              child: ListView.builder(
                itemCount: model.foodLength,
                itemBuilder: (BuildContext lctx, int index) {
                  return GestureDetector(
                    onTap: () async {
                      final bool response = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext) => AddFoodItem(
                            food: model.foods[index],
                          ),
                        ),
                      );
                      if (response) {
                        SnackBar snackBar = SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text(
                            "Food item successfully updated",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        );

                        // ignore: deprecated_member_use
                        _explorePageScaffoldkey.currentState.showSnackBar(
                            snackBar); // ignore: deprecated_member_use
                      }
                    },
                    onDoubleTap: () {
                      // Delete food item
                      // showLoadingIndicator(context, "Deleting food item...");
                      // model
                      //     .deleteFood(model.foods[index].id)
                      //     .then((bool response) {
                      //   Navigator.of(context).pop();
                      // });
                    },
                    child: FoodItemCard(
                      model.foods[index].name,
                      model.foods[index].description,
                      model.foods[index].price.toString(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
