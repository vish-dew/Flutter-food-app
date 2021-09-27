import 'package:food_app/src/enums/auth_mode.dart';
import 'package:food_app/src/models/food_model.dart';
import 'package:food_app/src/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class UserModel extends Model {
  List<User> _users = [];
  User _authenticatedUser;

  bool _isLoading = false;

  List<User> get users {
    return List.from(_users);
  }

  User get authenticatedUser {
    return _authenticatedUser;
  }

  bool get isLoading {
    return _isLoading = false;
  }

  Future<bool> addUserinfo(Map<String, dynamic> userinfo) async {
    _isLoading = true;
    notifyListeners();
    try {
      final http.Response response = await http.post(
          "https://foods-app-954a4-default-rtdb.firebaseio.com/Users.json",
          body: json.encode(userinfo));
      ;
      final Map<String, dynamic> responseData = json.decode(response.body);

      //print(responseData["name"]);
      User userWithID = User(
        id: responseData["name"],
        email: userinfo["email"],
        username: userinfo["username"],
      );
      _users.add(userWithID);

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

  Future<Map<String, dynamic>> authenticate(
      String email, String password, String username, AuthMode authMode) async {
    _isLoading = true;
    notifyListeners();

    Map<String, dynamic> authData = {
      "email": email,
      "password": password,
      "returnSecureToken": true,
    };
    Map<String, dynamic> userinfo = {
      "email": email,
      "username": username,
    };

    String message;
    bool hasError = false;

    try {
      http.Response response;
      if (authMode == AuthMode.SignUp) {
        response = await http.post(
          "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA9N6VzXVpu_fMJh4_C7rYlW7cEtW0BcLU",
          body: json.encode(authData),
          headers: {'Content-Type': 'application/json'},
        );

        addUserinfo(userinfo);
      } else if (authMode == AuthMode.SignIn) {
        response = await http.post(
          "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA9N6VzXVpu_fMJh4_C7rYlW7cEtW0BcLU",
          body: json.encode(authData),
          headers: {'Content-Type': 'application/json'},
        );
      }

      // print("Printing the respones body: ${response.body}");
      Map<String, dynamic> responseBody = json.decode(response.body);
      // print("The response body again: $responseBody");

      if (responseBody.containsKey('idToken')) {
        _authenticatedUser = User(
          id: responseBody['localId'],
          email: responseBody['email'],
          token: responseBody['idToken'],
          // userType: 'Customer',
        );
        if (authMode == AuthMode.SignUp) {
          message = "Your account has been successfully created";
        } else {
          message = "You have successfully Signed in";
        }
      } else {
        hasError = true;
        if (responseBody['error']['message'] == 'EMAIL_EXISTS') {
          message = "Email already exists";
        } else if (responseBody['error']['message'] == "EMAIL_NOT_FOUND") {
          // hasError = true;
          message = "Email does not exist";
        } else if (responseBody['error']['message'] == "INVALID_PASSWORD")
          // hasError = true;
          message = "Incorrect password";
      }

      _isLoading = false;
      notifyListeners();
      return {
        'message': message,
        'hasError': hasError,
      };
    } catch (error) {
      _isLoading = false;
      notifyListeners();

      return {
        'message': 'Sign up Failed',
        'hasError': !hasError,
      };

      // print("The error signing up: $error");
    }
  }
}
