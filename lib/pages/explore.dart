// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quotes/constants/urls.dart';
import 'package:quotes/classes/api_manager.dart';
import 'package:quotes/classes/quote.dart';
import 'package:quotes/widgets/swipe_card.dart';
import 'dart:math';

class Explore extends StatefulWidget {
  final List<Quote> quotes;
  const Explore({Key? key, required this.quotes}) : super(key: key);

  Quote randomQuote({required List<Quote> quotes}) {
    final _random = Random();
    return quotes[_random.nextInt(quotes.length)];
  }

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  void refresh() {
    setState(() {});
    print("REFRESH");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Quotes"),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: SwipeCard(
          quote: widget.randomQuote(quotes: widget.quotes),
          refresh: refresh,
        ),
      )),
    );
  }
}
