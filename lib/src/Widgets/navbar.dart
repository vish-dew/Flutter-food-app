import 'package:flutter/material.dart';
import 'package:food_app/src/Provider/payments.dart';
import 'package:food_app/src/Widgets/forgotten_password.dart';
import 'package:food_app/src/pages/sigin_page.dart';
import 'package:food_app/src/screen/about_page.dart';
import 'package:food_app/src/screen/contact_screen.dart';
import 'package:food_app/src/screen/profile_screen.dart';
import 'package:food_app/src/screen/settings_screen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            leading: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            tileColor: Colors.blue,
          ),
          UserAccountsDrawerHeader(
            accountName: Text('Vishmitha Devinda'),
            accountEmail: Text('vishmitha@gmail.com'),
            // currentAccountPicture: CircleAvatar(
            //   backgroundImage: ExactAssetImage('assets/Prof.jpeg'),
            //   child: ClipOval(
            //     child: Image.network(
            //       'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
            //       fit: BoxFit.cover,
            //       width: 90,
            //       height: 90,
            //     ),
            //   ),
            // ),
            decoration: BoxDecoration(
              color: Colors.blue,
              // image: DecorationImage(
              //     fit: BoxFit.fitHeight,
              //     image: ExactAssetImage('assets/4k.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => ProfileScreen()));
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.visibility_rounded),
          //   title: Text('Change password'),
          //   onTap: () {
          //     Navigator.of(context).pushReplacement(MaterialPageRoute(
          //         builder: (BuildContext context) => ForgotPassword()));
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.payment_outlined),
            title: Text('Payment'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => Payments()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => SettingScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.support_agent_rounded),
            title: Text('Contact us'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => ContactUsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About us'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => AboutUsPage()));
            },
          ),
          ListTile(
            title: Text('Sign out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => SignInPage()));
            },
          ),
        ],
      ),
    );
  }
}
