import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class feed extends StatelessWidget {

  
  feed({required this.imagelink, required this.profilelink, required this.username});
  final String imagelink;
  final String profilelink;
  final String username;
  
  @override

  
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth*0.9,
      decoration: BoxDecoration(
                      color: Color.fromRGBO(212, 189, 129, 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      // boxShadow: [BoxShadow(
                      //   color: Colors.grey,
                      //   blurRadius: 1.0,
                      // ),],
                    ),
              child: Stack(
                children: [
                  Container(
                    height: 400,
                    width: 350,
                    
                  ),

                  Positioned(
                    top: screenHeight*0.01,
                    left: screenWidth*0.01,
                    child: Container(
                      child:Material(
                        shape: CircleBorder(),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: (){},
                          child: Ink.image(
                            image: NetworkImage(profilelink),
                            fit: BoxFit.cover, //Add this line for center crop or use 2nd way
                            height: 60 ,
                            width: 60,
                          ),
                        ),
                      )
                    ),
                  ),

                  Positioned(
                    top: screenHeight*0.025,
                    left: screenWidth*0.22,
                    child: Text(username,style: TextStyle(fontSize: screenHeight*0.03,fontFamily: GoogleFonts.playfairDisplay().fontFamily,fontWeight: FontWeight.w500),),
                  ),
//                     child: Container(
//                       height: 40,
//                       width: 40,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(1,1,1,1),
//                         shape: BoxShape.circle,
//                         // borderRadius: BorderRadius.circular(50.0),
//                       ),
//                       //child: Image.network(profilelink),
//                       child:FittedBox(
//   child: Image.network(profilelink),
//   fit: BoxFit.fill,
// )
//                     ),
                  // ),
                  Positioned(
                    top: 20,
                    left: 0,
                    child: Container(
                      width: 350,
                      height: 350,
                      child: Image.network(imagelink),
                      
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    child: Container(
                      height: 20,
                      width: 400,
                      child: Row(
                        
                        children: [
                          SizedBox(width: 52),
                          Icon(Icons.comment,size: 23,),
                          SizedBox(width: 68),
                          Icon(Icons.favorite,size: 23,),
                          SizedBox(width: 68),
                          Icon(Icons.share,size: 23,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
    
  }
