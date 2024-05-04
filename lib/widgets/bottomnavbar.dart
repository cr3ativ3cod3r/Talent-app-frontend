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

class bottomnavbar extends StatelessWidget{


  @override

  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return CurvedNavigationBar(
        height: 50,
        color: Color.fromARGB(218, 0, 0, 0),
        animationCurve:Curves.fastOutSlowIn,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        animationDuration: Duration(milliseconds: 250),
        items: [
        Icon(Icons.home,color: Color.fromARGB(255, 255, 255, 255)),
        Icon(Icons.add,color: Color.fromARGB(255, 255, 255, 255)),
        IconButton(icon:Icon(Icons.bookmark_outline_rounded,
                  color: Color.fromARGB(255, 255, 255, 255),
                  ),onPressed: () { 
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => bkshow()));
                  },),
        IconButton(icon:Icon(Icons.person_3,
                  color: Color.fromARGB(255, 255, 255, 255),
                  ),onPressed: () { 
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profile()));
                  },),

        
      ],);
}
}