// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quotes/classes/quote.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class FileManager {
  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<List<Quote>> readFile({required String path}) async {
    String response = await rootBundle.loadString(path);
    List strQuotes = json.decode(response);
    List<Quote> quotes = [];
    for (var i = 0; i < strQuotes.length; i++) {
      Quote quo =
          Quote(text: strQuotes[i]['text'], author: strQuotes[i]['author']);
      quotes.add(quo);
    }

    return quotes;
  }

  Future<File> saveToFile({required List<Quote> quotes}) async {
    final dir = await localPath;
    String jsonQuotes = jsonEncode(quotes);
    var file = File('$dir/assets/quotes.json');
    return file.writeAsString("$jsonQuotes");
  }
}
