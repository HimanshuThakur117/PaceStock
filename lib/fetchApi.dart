import 'dart:convert';
import 'package:http/http.dart' as http;

String Apikey = "4b0b6c2daae747a1baa877c1bffae818";
Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=' +
      Apikey ),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');
  

  return (result['articles']);
}