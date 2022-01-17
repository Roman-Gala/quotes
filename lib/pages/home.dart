// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:quotes/classes/quote.dart';
import 'package:quotes/pages/create.dart';
import 'package:quotes/widgets/quote_card.dart';
import 'dart:convert';
import 'package:quotes/classes/api_manager.dart';
import 'package:quotes/constants/urls.dart';
import 'package:quotes/widgets/side_menu.dart';

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [];

  _getQuotes() {
    ApiManager.getQuotes(baseUrl: baseUrl).then((response) {
      setState(() {
        quotes = [];
        List strQuotes = json.decode(response.body);
        for (var i = 0; i < strQuotes.length; i++) {
          Quote quo = Quote(
              text: strQuotes[i]['text'],
              author: strQuotes[i]['author'],
              id: strQuotes[i]['id']);
          quotes.add(quo);
        }
        refresh();
        print('GetQuotes');
      });
    });
  }

  _delQuote(String id) {
    ApiManager.delQuote(baseUrl: baseUrl, id: id);
    quotes.removeWhere((item) => item.id == id);
    refresh();
  }

  refresh() {
    setState(() {
      print('Refreshed');
    });
  }

  addQuote({required Quote quote}) {
    quotes.add(quote);
    refresh();
  }

  @override
  void initState() {
    super.initState();
    _getQuotes();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Saved Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
              onPressed: () {
                _getQuotes();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      drawer: SideMenu(user: "User", quotes: quotes,),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
        child: ListView(
          children: quotes
              .map((quote) => QuoteCard(
                  getQuotes: _getQuotes,
                  quote: quote,
                  delete: () {
                    setState(() {
                      _delQuote(quote.id);
                      quotes.remove(quote);
                    });
                  }))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateQuote(addQuote: addQuote)),
          );
        },
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.add,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
