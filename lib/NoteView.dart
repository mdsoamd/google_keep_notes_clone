import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_keep_notes_clone/ArchiveView.dart';
import 'package:google_keep_notes_clone/EditNoteView.dart';
import 'package:google_keep_notes_clone/colors.dart';
import 'package:google_keep_notes_clone/home.dart';
import 'package:google_keep_notes_clone/model/MyNoteModel.dart';
import 'package:google_keep_notes_clone/services/db.dart';


class NoteView extends StatefulWidget {
   Note note;
  NoteView({required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.note.pin);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [

          
           //* Pin Button      
          IconButton(
            splashRadius: 17,
            onPressed: ()async {

             await NotesDatabse.instance.pinNote(widget.note);
             Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => HomePage())));
              
            }, 
            icon: Icon(  widget.note.pin ? Icons.push_pin : Icons.push_pin_outlined )),




              //* Archive Button
             IconButton(
            splashRadius: 17,
            onPressed: ()async {
              await NotesDatabse.instance.archNote(widget.note);
             Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => HomePage())));
            }, 
            icon: Icon(widget.note.isArchieve? Icons.archive: Icons.archive_outlined)),




           //* Delete Button
            IconButton(
            splashRadius: 17,
            onPressed: ()async{
              await NotesDatabse.instance.delteNote(widget.note);
               Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => HomePage())));
            }, 
            icon: Icon(Icons.delete_forever_outlined)),



            //* Edit Button
            IconButton(
            splashRadius: 17,
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView(note: widget.note,)));
            }, 
            icon: Icon(Icons.edit_outlined))




        ],
      ),

      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children : [
            Text(widget.note.title , style: TextStyle(color: Colors.white , fontSize: 23 , fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(widget.note.content,style: TextStyle(color: Colors.white),)
          ]
          
        ),
      ),
    );
  }
}