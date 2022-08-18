import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:pace_stock/Utils/color.dart';
import 'package:http/http.dart' as http;
import 'package:pace_stock/widgets/customBox.dart';
import 'package:pace_stock/Utils/utils.dart';
import 'package:path_provider/path_provider.dart';


import 'Api function/fetchApi.dart';

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

  
// void WDinHive( ) {
//   _mybox.put('article', "data has been pushed");
//   print(_mybox.get('article'));
//    //_mybox.get('article');
//  }

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
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                  future: fetchnews(),
                  builder: ((context, snapshot) {
                    
                    if (snapshot.hasData) {
                       
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            return  NewBox(
                              url: snapshot.data![index]['url'],
                              imageurl:
                                  snapshot.data![index]['urlToImage'] != null
                                      ? snapshot.data![index]['urlToImage']
                                      : Constants.imageurl,
                              title: snapshot.data![index]['title'],
                              author: snapshot.data![index]['author'] != null
                                  ? snapshot.data![index]['author']
                                  : Constants.newsAuthor,
                              time: snapshot.data![index]['publishedAt'],
                              description: snapshot.data![index]
                                      ['description']
                                  .toString(),
                            );
                          }));
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColor.headingColor,
                    ));
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
