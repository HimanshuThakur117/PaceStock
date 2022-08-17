import 'dart:convert';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:pace_stock/Api%20function/model.dart';

String Apikey = "4b0b6c2daae747a1baa877c1bffae818";
Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=' +
      Apikey ),
  );
   
  Map result = jsonDecode(response.body);
   
  print("Api data has been fetch");
  

  return (result['articles']);
}