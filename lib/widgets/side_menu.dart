// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final String user;
  SideMenu({required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[200],
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.redAccent,
            child: SizedBox(
                height: 56,
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "User",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.redAccent,
            ),
            label: Text(
              "Search Quotes",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.double_arrow_rounded,
              color: Colors.redAccent,
            ),
            label: Text(
              "Explore Quotes",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.star_rounded,
              color: Colors.redAccent,
            ),
            label: Text(
              "Saved Quotes",
              style: TextStyle(color: Colors.redAccent),
            ),
          )
        ],
      ),
    );
  }
}
