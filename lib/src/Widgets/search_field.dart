import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  get onChanged => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.symmetric(
        horizontal: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.black54.withOpacity(0.35),
        ),
      ),
      child: ListTile(
        onTap: () {},
        leading: Icon(Icons.search),
        title: TextField(
          onTap: () {},
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: "Search here",
            hintStyle: TextStyle(color: Colors.black26),
            border: InputBorder.none,
          ),
        ),
        trailing: Icon(Icons.filter_list),
      ),
      // child: TextField(
      //   onChanged: onChanged,
      //   decoration: InputDecoration(
      //     border: InputBorder.none,
      //     icon: Icon(Icons.filter_list),
      //     hintText: "Search Here",
      //     hintStyle: TextStyle(color: Colors.black12),
      //   ),
      // ),

      // child: Material(
      //   elevation: 5.0,
      //   borderRadius: BorderRadius.circular(30.0),
      //   child: TextField(
      //     decoration: InputDecoration(
      //         contentPadding:
      //             EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
      //         hintText: "Search my food",
      //         suffixIcon: Material(
      //           elevation: 5.0,
      //           borderRadius: BorderRadius.circular(30.0),
      //           child: Icon(Icons.search),
      //         ),
      //         border: InputBorder.none),
      //   ),
      // ),
    );
  }
}
