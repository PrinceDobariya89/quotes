import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes/model/quote.dart';

class ApiHelper{
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String baseUrl = "https://api.api-ninjas.com/v1/quotes/";
  String apiKey = "7OLVbAmm98hzSCdlIv9b7A==87XuUv26YTTplkJE";

  Future<List<Quote>> fetchQuotes() async{
    try {
      final responce = await http.get(Uri.parse(baseUrl),headers: {'x-api-key':'$apiKey'});
      if (responce.statusCode == 200) {
        List data = json.decode(responce.body);
        return data.map((e) => Quote.fromJson(e)).toList();
      } else {
        return [];
      }
    }catch (e){
      print("error $e");
    }

    return [];
  }
}