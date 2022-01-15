// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future getQuotes({required String baseUrl}) {
    var url = baseUrl + "/quotes/";
    return http.get(Uri.parse(url));
  }

  static Future delQuote({required String baseUrl, required String id}) {
    var url = baseUrl + '/quotes/$id/';
    return http.delete(Uri.parse(url));
  }

  static Future createQuote(
      {required String baseUrl,
      required String author,
      required String text}) async {
    var url = baseUrl + '/quotes/';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'author': author,
        'text': text,
      }),
    );
    if (response.statusCode == 201) {
      print('Created!');
    } else {
      print('Failed!');
    }
    return response;
  }

  static Future editQuote(
      {required String baseUrl,
      required String id,
      required String author,
      required String text}) async {
    var url = baseUrl + '/quotes/$id';
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'author': author,
        'text': text,
        'id': id,
      }),
    );
    if (response.statusCode == 200) {
      print('Saved!');
    } else {
      print('Failed to save!');
    }
    return response;
  }
}
