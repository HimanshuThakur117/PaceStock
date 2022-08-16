import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pace_stock/color.dart';
class  HomeScreen extends StatefulWidget {
  const  HomeScreen({super.key});

  @override
  State< HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State< HomeScreen> {

  String Apikey = '4b0b6c2daae747a1baa877c1bffae818';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
     appBar: AppBar(
      centerTitle: true,
       backgroundColor: AppColor.headerColor,
       title: Text("HEADLINES", style: GoogleFonts.robotoSlab(
        fontSize: 29,
        fontWeight: FontWeight.bold,
        color: AppColor.textColor,
       ),),
       
     ),

     body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              
            ),
          ),
        ],
      ),
     ),

    );
  }
}