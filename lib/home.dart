import 'package:flutter/material.dart';
import 'package:google_keep_notes_clone/SideMenuBar.dart';
import 'package:google_keep_notes_clone/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
        endDrawerEnableOpenDragGesture: true,
        key: _drawerKey,
        drawer: SideMenu(),
      
      body: SafeArea(
        child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: MediaQuery.of(context).size.height,
              height: 55,
              decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3)
                  ]),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {

                             _drawerKey.currentState!.openDrawer();
                            
                          },
                          icon: Icon(
                            Icons.menu,
                            color: white,
                          )),
                      const SizedBox(width: 16),
                      Container(
                        height: 55,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Search Your Notes",
                              style: TextStyle(
                                  color: white.withOpacity(0.5), fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),


                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        TextButton(

                             //* Button Tab Effect 
                            style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith((states) => white.withOpacity(0.1)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ))),

                            onPressed: () {},

                            child: Icon(
                              Icons.grid_view,
                              color: white,
                            )),

                        const SizedBox(width: 9),

                        CircleAvatar(
                          radius: 16,
                          backgroundColor: white,
                        )


                      ],
                    ),
                  ),
                ],
              ),
            ),

       

          Container(
         margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            child: Column(
              children: [
                Text(
                "ALL",
                style: TextStyle(
                    color: white.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          )


            
          ],
        ),
      )),
    );
  }
}


