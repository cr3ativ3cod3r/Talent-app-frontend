import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talent_frontend/Feed.dart';
import 'package:talent_frontend/remoteservices/feedservice.dart';
import 'package:talent_frontend/models/feed.dart';
import 'bookedshows.dart';
import 'profilepage.dart';
import './widgets/bottomnavbar.dart';
import './widgets/topbar.dart';
import 'package:google_fonts/google_fonts.dart';






class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Homemap>? data;
  var isLoaded = false;

  final SearchBar =TextEditingController();
  final List predata = [
    ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxqi0o_4JslZgPuaS0c3098LByO9v1iF5TSA&usqp=CAU','https://m.media-amazon.com/images/M/MV5BNWFlOTRhZTMtMDM3Yi00MGFhLWEyMzctOWU5MDAwM2I2NzEzXkEyXkFqcGdeQXVyNTAyNDQ2NjI@._V1_.jpg'],
    ['https://www.getbengal.com/uploads/story_image/Satyajit-Ray.jpg','https://images.squarespace-cdn.com/content/v1/4f209325d09a4f024c85b060/1427591765532-UOCSDVBX2OUEJ3J742ZC/akira-kurosawa-06.jpg'],
  ];

  @override
  void initState(){
    super.initState();
    getData();
    test();
  }

  test(){
    print('hi');
  }

  getData() async{
     data = await RemoteService().getData();
     if (data != null)
     {
       setState(() {
         var isLoaded = true;
       });
     }
   }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      
      //drawer: ,
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
            left: screenWidth*0.042,
            child:Container (
              height: screenHeight*0.68,
              width: screenWidth*0.93,
              child:ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index){
                return Column(
                children: [
                  feed(imagelink: data![index].content,profilelink: data![index].tag,username: data![index].name,),
                  SizedBox(height: 20,),
        ]);}
            )),
            
            
          ),

          //SizedBox(height: 10,),

          // Positioned(
          //   top: screenHeight*0.20,
          //   left: screenWidth*0.15,
          //   child: Material(
          //     elevation: 10,
          //   child: Container(
          //     height: screenHeight*0.07,
          //     width: screenWidth*0.75,
              
          //     decoration: const BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(40.0)),
          //       color: Color.fromARGB(255, 255, 255, 255),
          //     ),
          //    child: TextField(
          //     controller: SearchBar,
          //     decoration: InputDecoration(
          //       hintText: '     Search to find art',
          //       hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),fontFamily: GoogleFonts.permanentMarker().fontFamily),
          //       border: InputBorder.none,
          //     ),
          //    ), 
          //   ))
          // ),
  
        ],
      ),
      bottomNavigationBar: bottomnavbar(),
    );
  }
}