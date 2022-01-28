import 'dart:convert';

import 'package:NewsApp/models/news_response.dart';
import 'package:NewsApp/widgets/toast.dart';
import 'package:flutter/cupertino.dart';


import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://newsapi.org/v2/everything?q=tesla&from=2021-12-28&sortBy=publishedAt&apiKey=16e492a631af46f2bb94f361314960d0";
  var client = http.Client();
  Duration timeoutDuration = const Duration(seconds: 20);

  static const Map<String, String> jsonHeader = {
    'Accept': 'application/json',
  };

  Future<List<Articles>> handleDashBoard() async {
    List<Articles> articles = [];
    var response = await client
        .get(
          Uri.parse(baseUrl),
          headers: jsonHeader,
        )
        .timeout(timeoutDuration, onTimeout: () => http.Response("", 408))
        .catchError((onError) => http.Response("$onError", 404));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      if (jsonBody["status"] == "ok") {
        if (jsonBody['articles'] != null) {
          articles = <Articles>[];
          jsonBody['articles'].forEach((v) {
            articles.add(Articles.fromJson(v));
          });
        }
      } else {
        showToast('${jsonBody["message"]}');
        debugPrint('Error -> ${jsonBody["message"]}');
      }
    } else {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      showToast('${jsonBody["message"]}');
      debugPrint (' Error -> ${response.body}');
    }
    return articles;
  }
}
