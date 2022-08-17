import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../Utils/color.dart';
import 'NewsDetail.dart';

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
    return InkWell(
      onTap: () {
         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewsPreview(context, imageurl,author,title, time, description, url )),
  );
       
      },
     
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Hero(
            tag: time,
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageurl),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 130,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16,left: 16),
                          child: Text(
                            author,
                            style: GoogleFonts.robotoSlab(
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              color: AppColor.subtitleColor,
                            ),
                          ),
                        ),
                    
                        SizedBox(
                          width: 10,
                        ),
                    
                        Padding(
                           padding: const EdgeInsets.only(right: 16,left: 16),
                          child: Text(
                            time,
                            style: GoogleFonts.robotoSlab(
                              fontSize: 12,
                               fontStyle: FontStyle.normal,
                              color: AppColor.subtitleColor,
                            ),
                          ),
                        ),
                    
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
