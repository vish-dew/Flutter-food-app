import 'dart:convert';
// ignore: unused_import
import 'dart:developer';

import 'package:food_app/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  List<Food> get foods {
    return List.from(_foods);
  }

  int get foodLength {
    return _foods.length;
  }

  List<Food> get foodItems => null;

  Future<bool> addFood(Food food) async {
    //_foods.add(food);
    _isLoading = true;
    notifyListeners();
    try {
      final Map<String, dynamic> foodData = {
        "title": food.name,
        "description": food.description,
        "category": food.category,
        "price": food.price,
        "discount": food.discount,
      };

      final http.Response response = await http.post(
          "https://foods-app-954a4-default-rtdb.firebaseio.com/foods.json",
          body: json.encode(foodData));
      final Map<String, dynamic> responseData = json.decode(response.body);

      //print(responseData["name"]);
      Food FoodWithID = Food(
        id: responseData["title"],
        name: food.name,
        description: food.description,
        category: food.category,
        price: food.price,
        discount: food.discount,
      );
      _foods.add(FoodWithID);

      _isLoading = false;
      notifyListeners();
      //fetchFoods();
      return Future.value(true);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
      //print("Connection error: $e");
    }
  }

  Future<bool> fetchFoods() async {
    //log('fetching');
    _isLoading = true;
    notifyListeners();

    try {
      final http.Response response = await http.get(
          "https://foods-app-954a4-default-rtdb.firebaseio.com/foods.json");

      final Map<String, dynamic> fetchedData = json.decode(response.body);
      //log('array');

      print(fetchedData);

      List<Food> FoodItems = [];

      fetchedData.forEach((
        String id,
        dynamic foodData,
      ) {
        //log('object');
        print(foodData);
        Food FoodItem = Food(
          id: id,
          name: foodData["title"],
          description: foodData["description"],
          category: foodData["category"],
          price: double.parse(foodData["price"].toString()), //changed
          discount: double.parse(foodData["discount"].toString()), //changed
        );
        //log('vish');
        FoodItems.add(FoodItem);
      });

      _foods = FoodItems;
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      print("The errror: $error");
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> updateFood(Map<String, dynamic> foodData, String foodId) async {
    _isLoading = true;
    notifyListeners();

    //Get the food by id
    Food theFood = getFoodItemById(foodId);

    //Get the index of the food
    int foodIndex = _foods.indexOf(theFood);
    try {
      await http.put(
          "https://foods-app-954a4-default-rtdb.firebaseio.com/foods/${foodId}.json",
          body: json.encode(foodData));
      Food updatedFoodItem = Food(
        id: foodId,
        name: foodData["title"],
        category: foodData["category"],
        discount: foodData["discount"],
        price: foodData["price"],
        description: foodData["description"],
      );
      _foods[foodIndex] = updatedFoodItem;

      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {}
    _isLoading = false;
    notifyListeners();
    return Future.value(false);
  }

  Future<bool> deleteFood(String foodId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // ignore: unused_local_variable
      final http.Response response = await http.delete(
          "https://foods-app-954a4-default-rtdb.firebaseio.com/foods/${foodId}.json");

      //Delete item from the List of food item
      _foods.removeWhere((Food food) => food.id == foodId);

      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {}
    _isLoading = false;
    notifyListeners();
    return Future.value(false);
  }

  Food getFoodItemById(String foodId) {
    Food food;
    for (int i = 0; i < _foods.length; i++) {
      if (_foods[i].id == foodId) {
        food = _foods[i];
        break;
      }
    }
    return food;
  }
}

class FoodItem {}

//  for (var key in fetchedData.values) {
//         log('obj1');
//         print(key);
//         {}
//         FoodItems.add(Food(id: 'hansa', name: 'hansa'));