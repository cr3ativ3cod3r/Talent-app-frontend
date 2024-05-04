import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talent_frontend/Feed.dart';
import 'package:talent_frontend/remoteservices/feedservice.dart';
import 'package:talent_frontend/models/feed.dart';
import '../bookedshows.dart';
import '../profilepage.dart';
import 'package:google_fonts/google_fonts.dart';

class topbar extends StatelessWidget{


  @override

  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
    Positioned(
            top: 0,
            left: 0,
          child: Container(
            width: screenWidth,
            height: screenHeight*0.17,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              // borderRadius: new BorderRadius.vertical(
              //   bottom: new Radius.elliptical(
              //   MediaQuery.of(context).size.width, 35.0)),
            )
          ),
          ),

          

          // Positioned(
          //   top: screenHeight*0.07,
          //   right: screenWidth*0.02,
          //   child: IconButton(onPressed: () => {}, icon: Icon(Icons.person,color: Color.fromARGB(255, 255, 255, 255),size: 30,))
          // ),

          Positioned(
            top: screenHeight*0.073,
            right: screenWidth*0.077,
            child: IconButton(onPressed: () => {}, icon: Icon(Icons.search,color: Color.fromARGB(255, 255, 255, 255),size: 30,))
          ),

          Positioned(
            top: screenHeight*0.07,
            left: screenWidth*0.1,
            child: Text("Artsy Text",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 40,
                  fontFamily: GoogleFonts.caveat().fontFamily,
              ),)
          ),
      ]);
  }
}