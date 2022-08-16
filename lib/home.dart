

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pace_stock/color.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List Images = [];

  @override
  void initState() {
    super.initState();
    fetchApi();
  }

  String Apikey = '4b0b6c2daae747a1baa877c1bffae818';

  fetchApi() async {
    await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in"),
        headers: {
          'Authorization': '4b0b6c2daae747a1baa877c1bffae818'
        }).then((value) {
      print(value.body);
     
      // setState(() {
      //   Images= result['urlToImage'];
      // });
      //  print(Images);
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.headerColor,
        title: Text(
          "HEADLINES",
          style: GoogleFonts.robotoSlab(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: AppColor.textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    "HEADLINES",
                    style: GoogleFonts.robotoSlab(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
