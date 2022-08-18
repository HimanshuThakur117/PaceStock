import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pace_stock/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pace stock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
       fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: HomeScreen(), );
  }
}
