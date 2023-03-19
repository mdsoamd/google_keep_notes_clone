import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_keep_notes_clone/ArchiveView.dart';
import 'package:google_keep_notes_clone/Setting.dart';
import 'package:google_keep_notes_clone/colors.dart';



class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: bgColor),
        child: SafeArea(
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

              Container(

                  margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: Text(
                    "Google Keep",
                     style:const TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )),


              Divider(
                color: white.withOpacity(0.3),
              ),

             sectionOne(),

             const SizedBox(
                height: 10,
              ),

             sectionTwo(),

             const SizedBox(
                height: 10,
              ),

              sectionSetting()
              
        ],)),
      )
    );
  }










// TODO Create Widget sectionOne
Widget sectionOne()
  {
    return Container(
                margin: EdgeInsets.only(right: 10),
                child: TextButton(

                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ))),
                  
                  
                  onPressed: (){}, 
                  child:Container(
                padding: EdgeInsets.all(5),

                    child: Row(
                      children: [
                        Icon(
                          Icons.lightbulb,
                        size: 25,
                        color: white.withOpacity(0.7),
                        ),
                        SizedBox(
                          width: 27,
                          ),
                        Text('Notes',style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontSize: 18
                          ),)
                        
                        ],),
                  )),
              );
  }





// TODO Create Widget sectionTwo
 Widget sectionTwo()
  {
    return Container(
                margin: EdgeInsets.only(right: 10),
                child: TextButton(
                  style: ButtonStyle(
                  
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ))),
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveView()));
                    
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                    children: [
                      Icon(
                        Icons.archive_outlined,
                        size: 25,
                        color: white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 27,
                      ),
                      Text(
                        "Archive",
                        style: TextStyle(
                            color: white.withOpacity(0.7), fontSize: 18),
                      )
                    ],
                  ),
                  )
                ),
              );
  }











// TODO Create Widget sectionSetting
Widget sectionSetting()
  {
    return Container(
                margin: EdgeInsets.only(right: 10),
                child: TextButton(
                  style: ButtonStyle(
                  
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                    children: [
                      Icon(
                       Icons.settings_outlined,
                        size: 25,
                        color: white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 27,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(
                            color: white.withOpacity(0.7), fontSize: 18),
                      )
                    ],
                  ),
                  )
                ),
              );
  }





  






  
}