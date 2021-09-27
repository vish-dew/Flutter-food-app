import 'package:flutter/material.dart';
import 'package:food_app/src/Provider/payment_details.dart';
import 'package:food_app/src/Provider/payments.dart';
import 'package:food_app/src/Provider/success.dart';
import 'package:food_app/src/pages/checkout_page.dart';
import 'package:food_app/src/pages/food_details_page.dart';
import 'package:food_app/src/pages/profile_page.dart';
import 'package:food_app/src/pages/sigin_page.dart';
import 'package:food_app/src/pages/welcome_page.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/screen/QR/qr_code.dart';
import 'package:food_app/src/screen/contact_screen.dart';
import 'package:food_app/src/screen/profile_screen.dart';
import 'package:food_app/src/screen/settings_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screen/main_screen.dart';

class App extends StatelessWidget {
  final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "UniFoodie App",
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: MainScreen(model: mainModel),

        // home: QrScan(),
        // routes: {
        //   "/": (BuildContext context) => SignInPage(),
        //   "/Mainscreen": (BuildContext context) => WelcomePage(),
        // },
      ),
    );
  }
}
