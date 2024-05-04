import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './widgets/bottomnavbar.dart';
import './widgets/topbar.dart';
import 'package:talent_frontend/remoteservices/profilefeed.dart';
import 'package:talent_frontend/models/feed.dart';
import '../User/userdata.dart';

class profile extends StatefulWidget {
  const profile({Key? key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  List<Homemap>? profilefeed;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    getprofilefeed();
    test();
  }

  test(){
    print('hi');
  }

  getprofilefeed() async{
     profilefeed = await RemoteService().getprofilefeed(username);
     if (profilefeed != null)
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
      body:Stack(
        children: [

          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              height: screenHeight*0.17,
              width: screenWidth,
            child: topbar(),)
          ),

          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child:Container(
          //     height: screenHeight*0.25,
          //     width: screenWidth,
          //     decoration: BoxDecoration(
          //       color: Color.fromARGB(255, 1, 1, 1)
          //     ),
          // )
          // ),
          // Positioned(
          //   top: screenHeight*0.24,
          //   left: 0,
          //   child: Container(
          //     height: screenHeight*0.3,
          //     width: screenWidth,
          //     decoration: BoxDecoration(
          //       color: Color.fromARGB(132, 243, 15, 15)
          //     ),
          //     child:Row(
                
          //     )
          //   )
          // ),
          
          Positioned(
            top: screenHeight*0.176,
            left: screenWidth*0.01,
            child: Container(
              height: screenHeight*0.28,
              width: screenWidth*0.98,
              decoration: BoxDecoration(
                color: Color.fromARGB(172, 100, 96, 96),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ),
          ),

          Positioned(
            top: screenHeight*0.48,
            left: 0,
            child: Container(
              height: screenHeight*0.6,
              width: screenWidth,
              child: GridView.builder(
                
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  // crossAxisCount: 2,
                  crossAxisSpacing: screenWidth*0.001,
                  mainAxisSpacing: screenWidth*0.001, maxCrossAxisExtent: screenWidth*0.4,
                ),
                itemCount: profilefeed!.length, 
                itemBuilder: (context, index){
                  return Container(
                    width: screenWidth*0.3,
                    height: screenHeight*0.4,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 228, 159, 10),
                      image: DecorationImage(image: NetworkImage(profilefeed![index].content),
                      fit: BoxFit.cover)
                    ),
                    //child: Image.network(profilefeed![index].content),
                    
                  );
                }
                ),
            ),
          ),
          Positioned(
            top: screenHeight*0.46,
            left: 0,
            child: Container(
              height: screenHeight*0.06,
              width: screenWidth,
              decoration: BoxDecoration(color: Color.fromARGB(255, 1, 1, 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () => {}, icon: Icon(Icons.perm_media_outlined,color: Color.fromARGB(255, 255, 255, 255),)),
                  IconButton(onPressed: () => {}, icon: Icon(Icons.mode_edit_sharp,color: Color.fromARGB(255, 255, 255, 255),)),
                  IconButton(onPressed: () => {}, icon: Icon(Icons.file_copy_sharp,color: Color.fromARGB(255, 255, 255, 255),)),
                ],
              ),
            ),
          ),
        ]
      ),
      bottomNavigationBar: bottomnavbar(),
    );
  }
}