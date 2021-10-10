import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/buttonF.dart';
import 'package:food_app/src/Widgets/buttonG.dart';
import 'package:food_app/src/Widgets/show_dialog.dart';
import 'package:food_app/src/enums/auth_mode.dart';
import 'package:food_app/src/pages/sigin_page.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _togglevisibility = true;
  // bool _toggleConfirmvisibility = true;

  String _email;
  // ignore: unused_field
  String _username;
  String _password;
  //String _confirmpassword;

  GlobalKey<FormState> _formkey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(
          color: Color(0xFFD3D3D3),
          fontSize: 16.0,
        ),
      ),
      onSaved: (String email) {
        _email = email;
      },
      // validator: (String email) {
      //   String errorMessage;
      //   if (!email.contains("@")) {
      //     errorMessage = "Your email is incorrect";
      //   }
      //   if (email.isEmpty) {
      //     errorMessage = "Your email field is required";
      //   }
      //   return errorMessage;
      // },
    );
  }

  Widget _buildUsernameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Username",
        hintStyle: TextStyle(
          color: Color(0xFFD3D3D3),
          fontSize: 16.0,
        ),
      ),
      onSaved: (String username) {
        _username = username.trim();
      },
      validator: (String username) {
        String errorMessage;
        if (username.isEmpty) {
          errorMessage = "Username field is required";
        }
        //if (username.length > 8) {
        //errorMessage = "Your username is too short";
        //}
        return errorMessage;
      },
    );
  }

  Widget _buildpasswordTextField() {
    return TextFormField(
        decoration: InputDecoration(
          hintText: "password",
          hintStyle: TextStyle(
            color: Color(0xFFD3D3D3),
            fontSize: 16.0,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _togglevisibility = !_togglevisibility;
              });
            },
            icon: _togglevisibility
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility_off),
          ),
        ),
        obscureText: _togglevisibility,
        onSaved: (String password) {
          _password = password;
        },
        validator: (String password) {
          String errorMessage;

          if (password.isEmpty) {
            errorMessage = "Your password is required";
          }

          return errorMessage;
        });
  }

  // Widget _buildConfirmpasswordTextField() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       hintText: "Confirm password",
  //       hintStyle: TextStyle(
  //         color: Color(0xFFD3D3D3),
  //         fontSize: 18.0,
  //       ),
  //       suffixIcon: IconButton(
  //         onPressed: () {
  //           setState(() {
  //             _toggleConfirmvisibility = !_toggleConfirmvisibility;
  //           });
  //         },
  //         icon: _togglevisibility
  //             ? Icon(Icons.visibility_off)
  //             : Icon(Icons.visibility_off),
  //       ),
  //     ),
  //     obscureText: _togglevisibility,
  //     onSaved: (String value) {},
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.blue.shade50,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          _buildUsernameTextField(),
                          SizedBox(height: 10.0),
                          _buildEmailTextField(),
                          SizedBox(height: 10.0),
                          _buildpasswordTextField(),
                          //SizedBox(height: 10.0),
                          // _buildConfirmpasswordTextField(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildSignUpButton(),
                  Divider(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Color(0xFFD3D3D3),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignInPage()));
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Divider(
                        height: 20.0,
                      ),
                      Center(
                        child: SignInButton.mini(
                          buttonType: ButtonType.google,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Center(
                        child: SignInButton.mini(
                          buttonType: ButtonType.facebook,
                          onPressed: () {},
                        ),
                      ),
                      Center(
                        child: SignInButton.mini(
                          buttonType: ButtonType.twitter,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildSignUpButton() {
    return ScopedModelDescendant(
      builder: (BuildContext sctx, Widget child, MainModel model) {
        return GestureDetector(
          onTap: () {
            showLoadingIndicator(context, "Signing up...");
            onSubmit(model.authenticate);
          },
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }

  void onSubmit(Function authenticate) {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      //Added this from user_scoped_model
      Map<String, dynamic> userinfo = {
        "email": _email,
        "username": _username,
      };
      //

      authenticate(_email, _password, AuthMode.SignUp, userinfo: userinfo)
          .then((final respones) {
        if (!respones['hasError']) {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed("/Mainscreen");
        } else {
          Navigator.of(context).pop();
          // ignore: deprecated_member_use
          _scaffoldKey.currentState.showSnackBar(SnackBar(
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
              content: Text(respones['message'])));
        }
        ;
      });
    }
  }
}
