import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Utils/color.dart';

Widget NewsPreview(context, imageurl, author, title, time, description, url) {
  return  Container(
     height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.transparent,
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(imageurl),
      ),
    ),
    child: Hero(
      tag: time,
      child: Column(
        
        children: [
         
         SizedBox(
          height: 200,
         ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: GoogleFonts.robotoSlab(
                fontSize: 29,
                fontStyle: FontStyle.normal,
                color: AppColor.textColor,
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Text(
                  author,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: AppColor.textColor,
                  ),
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Text(
                  time,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: AppColor.textColor,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: GoogleFonts.robotoSlab(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                color: AppColor.textColor,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
