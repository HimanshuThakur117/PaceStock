import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class NewBox extends StatelessWidget {
  final String imageurl,author,title, time, description, url;
  const NewBox(
      {Key? key,
      required this.imageurl,
      required this.author,
     
      required this.title,
      required this.time,
      required this.description,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {},
       
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imageurl),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    title,
                    style: GoogleFonts.robotoSlab(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      
                      color: AppColor.textColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.(16.0),
                      child: Text(
                        author,
                        style: GoogleFonts.robotoSlab(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColor.subtitleColor,
                        ),
                      ),
                    ),
        
                    SizedBox(
                      width: 10,
                    ),
        
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        time,
                        style: GoogleFonts.robotoSlab(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textColor,
                        ),
                      ),
                    ),
        
                  ],
                )
              ],
            ),
          ),
        ),
      
    );
  }
}
