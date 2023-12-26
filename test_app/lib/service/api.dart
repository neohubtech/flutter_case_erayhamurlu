import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<Map<String, dynamic>> request({required String url}) async {
    http.Response response;
    Map<String, dynamic> result;
    var urlT = Uri.parse(url);

    response = await http.get(urlT, headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      debugPrint("API Response URL $url DATA ${response.body}");
      result = json.decode(response.body);
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
