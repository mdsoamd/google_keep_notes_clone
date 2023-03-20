import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_keep_notes_clone/EditNoteView.dart';
import 'package:google_keep_notes_clone/colors.dart';
import 'package:google_keep_notes_clone/model/MyNoteModel.dart';
import 'package:google_keep_notes_clone/services/db.dart';


class NoteView extends StatefulWidget {
   Note note;
  NoteView({required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  String note =
      "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          IconButton(
            splashRadius: 17,
            onPressed: () {}, 
            icon: Icon(Icons.push_pin_outlined)),
             IconButton(
            splashRadius: 17,
            onPressed: () {}, 
            icon: Icon(Icons.archive_outlined)),
            IconButton(
            splashRadius: 17,
            onPressed: ()async{
              await NotesDatabse.instance.delteNote(widget.note);
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.delete_forever_outlined)),
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