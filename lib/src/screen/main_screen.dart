import 'package:flutter/material.dart';
import 'package:food_app/src/Widgets/navbar.dart';
import 'package:food_app/src/admin/pages/add_food_item.dart';
import 'package:food_app/src/pages/home_page.dart';
import 'package:food_app/src/scoped-model/main_model.dart';

//Pages
import '../pages/order_page.dart';
import '../pages/explore_page.dart';
// ignore: unused_import
import '../pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  final MainModel model;

  MainScreen({this.model});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;

  //pages
  Homepage homepage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  // ProfilePage profilePage;

  List<Widget> pages;
  Widget currentpage;

  @override
  void initState() {
    //call the fetch methods on food
    //widget.foodModel.fetchFoods();
    //widget.model.fetchFoods();

    homepage = Homepage();
    orderPage = OrderPage();
    favoritePage = FavoritePage(model: widget.model);
    // profilePage = ProfilePage();

    pages = [
      homepage,
      favoritePage,
      orderPage,
    ];
    // profilePage

    currentpage = homepage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            currentTabIndex == 0
                ? 'UniFoodie'
                : currentTabIndex == 1
                    ? 'All Food Items'
                    : currentTabIndex == 2
                        ? 'Orders'
                        : 'Profile',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: _buildnotificationicon(),
                onPressed: () {}), //Notification Icon
            // IconButton(icon: _buildshoppingCart(), onPressed: () {}) //Cart Icon
          ],
        ),
        drawer: NavBar(),
        // child: Column(
        //   children: <Widget>[
        //     ListTile(
        //       onTap: () {
        //         Navigator.of(context).pop(false);
        //       },
        //       leading: Icon(Icons.arrow_back),
        //     )
        //   ],
        // ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
              currentpage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   title: Text("Account"),
            // ),
          ],
        ),
        body: currentpage,
      ),
    );
  }

  //Cart Icon
  // Widget _buildshoppingCart() {
  //   return Stack(
  //     children: <Widget>[
  //       GestureDetector(
  //         onTap: () {
  //           Navigator.of(context).push(
  //             MaterialPageRoute(builder: (BuildContext context) => OrderPage()),
  //           );
  //         },
  //         child: Icon(
  //           Icons.shopping_cart,
  //           size: 27.0,
  //           color: Theme.of(context).primaryColor,
  //         ),
  //       ),
  //       Positioned(
  //         top: 0.0,
  //         right: 0.0,
  //         child: GestureDetector(
  //           onTap: () {
  //             Navigator.of(context).push(
  //               MaterialPageRoute(
  //                   builder: (BuildContext context) => AddFoodItem()),
  //             );
  //           },
  //           child: Container(
  //             height: 15.0,
  //             width: 15.0,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(7.5), color: Colors.red),
  //             child: Center(
  //               child: Text(
  //                 "1",
  //                 style: TextStyle(fontSize: 13.0, color: Colors.white),
  //               ),
  //             ),
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }
  // GestureDetector(
  // onTap: () {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //         builder: (BuildContext context) =>
  //             AddFoodItem()),
  //   );
  // },
  //                       child: CustomListTile(
  //                         icon: Icons.payment,
  //                         text: "Payment",
  //                       ),
  //                     ),

  //Notification icon
  Widget _buildnotificationicon() {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => AddFoodItem()),
            );
          },
          child: Icon(
            Icons.notifications_none_outlined,
            size: 27.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => AddFoodItem()),
              );
            },
            child: Container(
              height: 15.0,
              width: 15.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.5), color: Colors.red),
              child: Center(
                child: Text(
                  "5",
                  style: TextStyle(fontSize: 13.0, color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
