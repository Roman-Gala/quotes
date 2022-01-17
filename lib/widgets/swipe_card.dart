// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quotes/constants/urls.dart';
import 'package:quotes/classes/api_manager.dart';
import 'package:quotes/classes/quote.dart';

class SwipeCard extends StatefulWidget {
  final VoidCallback refresh;
  final Quote quote;
  const SwipeCard({Key? key, required this.quote, required this.refresh})
      : super(key: key);

  @override
  _SwipeCardState createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  @override
  Widget build(BuildContext context) => SizedBox.expand(
        child: buildFrontCard(),
      );

  Widget buildFrontCard() => GestureDetector(
        child: buildCard(),
        /* onPanStart: (details) {
          final provider = Provider.of<CardProvider>(context,)
        }, */
        onHorizontalDragEnd: (details) {
          setState(() {
            widget.refresh();
          });
        },
      );

  Widget buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                widget.quote.text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.grey[200]),
              ),
            ),
            Text(
              widget.quote.author,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
