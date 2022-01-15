// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quotes/constants/urls.dart';
import 'package:quotes/classes/api_manager.dart';
import 'package:quotes/classes/quote.dart';

class CreateQuote extends StatefulWidget {
  dynamic addQuote;
  CreateQuote({required this.addQuote});

  @override
  _CreateQuoteState createState() => _CreateQuoteState();
}

class _CreateQuoteState extends State<CreateQuote> {
  final quoteController = TextEditingController();
  final authorController = TextEditingController();

  @override
  void dispose() {
    quoteController.dispose();
    authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Quote'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              maxLength: 100,
              controller: quoteController,
              decoration:
                  InputDecoration(hintText: 'Quote', labelText: 'Enter Quote'),
            ),
            TextField(
              maxLength: 30,
              controller: authorController,
              decoration: InputDecoration(
                  hintText: 'Author', labelText: 'Enter Author'),
            ),
            TextButton.icon(
                onPressed: () async {
                  Quote newQuote = Quote(
                      text: quoteController.text,
                      author: authorController.text);

                  widget.addQuote(quote: newQuote);

                  await ApiManager.createQuote(
                      baseUrl: baseUrl,
                      author: authorController.text,
                      text: quoteController.text);

                  Navigator.pop(context);
                },
                icon: Icon(Icons.create),
                label: Text('Create Quote'))
          ],
        ),
      ),
    );
  }
}
