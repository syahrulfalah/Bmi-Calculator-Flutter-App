import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bmi_app/models/ResponseNews.dart';


String apikey = "added25aeb73427198b23e9be7657f17";

class News{
  Future<ResponseNews> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=$apikey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseNews.fromJsonMap(jsonData);
  }
}