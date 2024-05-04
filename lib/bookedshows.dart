import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './widgets/bottomnavbar.dart';
import './widgets/topbar.dart';

class bkshow extends StatefulWidget {
  const bkshow({Key? key});

  @override
  State<bkshow> createState() => _bkshowState();
}

class _bkshowState extends State<bkshow> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
    
      body: Stack(
        children: [
          
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              height: screenHeight*0.25,
              width: screenWidth,
            child: topbar(),)
          ),

          Positioned(
            top: screenHeight*0.25,
            left: screenWidth*0.1,
            child:Container (
              height: screenHeight*0.68,
              width: screenWidth*0.8,
              child:ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index){
                return Column(
                children: [
                  Material(
                    elevation:3,
                    borderRadius: BorderRadius.circular(20),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: Icon(Icons.slideshow_rounded),
                    title: Text("Showname"),
                    subtitle: Text("Subtitle"),
                    tileColor: Color.fromARGB(1,1,1,1),
                    onTap: () {
                      
                    },
                    selectedTileColor: Color.fromARGB(1,1,1,1),
                  )),
                  SizedBox(height: screenHeight*0.01),
                ]
                );
                }
              )
            )
          )
        ],
      ),
      bottomNavigationBar: bottomnavbar(),
    );

  }
}
