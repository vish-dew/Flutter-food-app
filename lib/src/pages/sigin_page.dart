import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/button.dart';
import 'package:food_app/src/Widgets/buttonF.dart';
import 'package:food_app/src/Widgets/buttonG.dart';
import 'package:food_app/src/Widgets/forgotten_password.dart';
import 'package:food_app/src/Widgets/show_dialog.dart';
import 'package:food_app/src/enums/auth_mode.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sign_button/sign_button.dart';
import 'package:sign_button/sign_button.dart';
import '../pages/signup_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _togglevisibility = true;

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  String _password;
  String _email;

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
        _email = email.trim();
      },
      validator: (String email) {
        String errorMessage;
        if (!email.contains("@")) {
          errorMessage = "Invalid email";
        }
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
      onSaved: (String passowrd) {
        _password = passowrd;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.blue.shade50,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          _buildEmailTextField(),
                          SizedBox(height: 10.0),
                          _buildpasswordTextField(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        //From Signup Page 91 - 104
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ForgotPassword()));
                        },
                        child: Text(
                          "Forgotten password?",
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
                  _buildSignInButton(),
                  Divider(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Color(0xFFD3D3D3),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUpPage()));
                        },
                        child: Text(
                          "Sign up",
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
                      SignInButton.mini(
                        buttonType: ButtonType.google,
                        onPressed: () {},
                      ),
                      SignInButton.mini(
                        buttonType: ButtonType.facebook,
                        onPressed: () {},
                      ),
                      SignInButton.mini(
                        buttonType: ButtonType.twitter,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildSignInButton() {
    return ScopedModelDescendant(
        builder: (BuildContext sctx, Widget child, MainModel model) {
      return GestureDetector(
        onTap: () {
          showLoadingIndicator(context, "Signing in...");
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
              "Sign In",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    });
  }

  void onSubmit(Function authenticate) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      authenticate(
        _email,
        _password,
        AuthMode.SignIn,
      ).then((final respones) {
        if (!respones['hasError']) {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed("/Mainscreen");
        } else {
          Navigator.of(context).pop();

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
