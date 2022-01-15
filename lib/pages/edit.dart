// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quotes/classes/quote.dart';
import 'package:quotes/constants/urls.dart';
import 'package:quotes/classes/api_manager.dart';

class EditQuote extends StatefulWidget {
  const EditQuote({Key? key, required this.quote}) : super(key: key);
  final Quote quote;

  @override
  _EditQuoteState createState() => _EditQuoteState();
}

class _EditQuoteState extends State<EditQuote> {
  var quoteController = TextEditingController();
  var authorController = TextEditingController();

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
            TextFormField(
              maxLength: 100,
              controller: quoteController = TextEditingController(text: widget.quote.text),
              decoration:
                  InputDecoration(hintText: 'Quote', labelText: 'Enter Quote'),
            ),
            TextFormField(
              maxLength: 30,
              controller: authorController = TextEditingController(text: widget.quote.author),
              decoration: InputDecoration(
                  hintText: 'Author', labelText: 'Enter Author'),
            ),
            TextButton.icon(
                onPressed: () async {
                  await ApiManager.editQuote(
                      baseUrl: baseUrl,
                      id: widget.quote.id,
                      author: authorController.text,
                      text: quoteController.text);

                  Navigator.pop(context);
                },
                icon: Icon(Icons.create),
                label: Text('Save'))
          ],
        ),
      ),
    );
  }
}
