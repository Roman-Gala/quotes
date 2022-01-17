// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quotes/classes/quote.dart';
import 'package:quotes/pages/explore.dart';

class SideMenu extends StatelessWidget {
  final String user;
  final List<Quote> quotes;
  SideMenu({required this.user, required this.quotes});

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Explore(quotes: quotes,)),
              );
            },
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
