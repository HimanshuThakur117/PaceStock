import 'dart:convert';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:pace_stock/Api%20function/model.dart';
import 'package:pace_stock/main.dart';

String Apikey = "4b0b6c2daae747a1baa877c1bffae818";
final _mybox = Hive.box('mybox');
List Emptycache = [];

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=' +
            Apikey),
  );

  Map result = jsonDecode(response.body);
  print("Api data has fetch");

  await putData(result['articles']);
  print('data put in db');

 
  var mymap = _mybox.toMap().values.toList();
  if (mymap.isEmpty) {
    Emptycache.add('empty');
  } else {
    Emptycache = mymap;
  }
  
  print(result['articles']);
   
  return (mymap);
}

Future putData(data) async {
  await _mybox.clear();
  for (var d in data) {
    _mybox.add(d);
  }
}
