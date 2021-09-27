import 'package:flutter/material.dart';
import 'package:food_app/src/models/category_model.dart';
import 'food_card.dart';
import '../data/category_data.dart';

class Foodcategory extends StatelessWidget {
  final List<Category> _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Foodcard(
            categoryname: _categories[index].categoryName,
            imagepath: _categories[index].imagepath,
            numberOfitems: _categories[index].numberOfitems,
          );
        },
      ),
    );
  }
}
