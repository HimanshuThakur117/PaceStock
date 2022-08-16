

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pace_stock/color.dart';
import 'package:http/http.dart' as http;
import 'package:pace_stock/containerWidget.dart';

import 'fetchApi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
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
            color: AppColor.headingColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future:  fetchnews(),
                  builder: ((context, snapshot) {

                    if(snapshot.hasData) {

                       return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          return NewBox(

                          );
                        })
                        );    

                    } else if(snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    return Center(
                          child: CircularProgressIndicator(
                        color: AppColor.headingColor,
                      ));
                })
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
