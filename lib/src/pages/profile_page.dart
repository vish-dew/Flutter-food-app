import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/custom_list_tile.dart';
import 'package:food_app/src/admin/pages/add_food_item.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool TurnOnNotification = false;
  bool TurnOnLocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(0, 4.0),
                            color: Colors.black38,
                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/Prof.jpg"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "D.G Vishmitha Devinda",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "074-1255849",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ])
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Account",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                elevation: 1.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AddFoodItem()),
                          );
                        },
                        child: CustomListTile(
                          icon: Icons.account_circle,
                          text: "Edit profile",
                        ),
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.blue,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AddFoodItem()),
                          );
                        },
                        child: CustomListTile(
                          icon: Icons.visibility_rounded,
                          text: "Change password",
                        ),
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.blue,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AddFoodItem()),
                          );
                        },
                        child: CustomListTile(
                          icon: Icons.payment,
                          text: "Payment",
                        ),
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.blue,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AddFoodItem()),
                          );
                        },
                        child: CustomListTile(
                          icon: Icons.settings,
                          text: "Settings",
                        ),
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Notifications",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomListTile(
                            icon: Icons.notifications,
                            text: "App notifications",
                          ),
                          Switch(
                            value: TurnOnNotification,
                            onChanged: (bool value) {
                              //print("the value: $value");
                              setState(() {
                                TurnOnNotification = value;
                              });
                            },
                          )
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.blue,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomListTile(
                            icon: Icons.email,
                            text: "Email notifications",
                          ),
                          Switch(
                            value: TurnOnLocation,
                            onChanged: (bool value) {
                              //print("the value: $value");
                              setState(() {
                                TurnOnLocation = value;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Support",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AddFoodItem()),
                              );
                            },
                            child: CustomListTile(
                              icon: Icons.language,
                              text: "Language",
                            ),
                          ),
                          Divider(
                            height: 10.0,
                            color: Colors.blue,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AddFoodItem()),
                              );
                            },
                            child: CustomListTile(
                              icon: Icons.support_agent_rounded,
                              text: "Contact us",
                            ),
                          ),
                          Divider(
                            height: 10.0,
                            color: Colors.blue,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AddFoodItem()),
                              );
                            },
                            child: CustomListTile(
                              icon: Icons.info_outline,
                              text: "About us",
                            ),
                          ),
                          Divider(
                            height: 10.0,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
