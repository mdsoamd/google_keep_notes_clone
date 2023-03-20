import 'package:flutter/material.dart';
import 'package:google_keep_notes_clone/NoteView.dart';
import 'package:google_keep_notes_clone/colors.dart';
import 'package:google_keep_notes_clone/model/MyNoteModel.dart';
import 'package:google_keep_notes_clone/services/db.dart';

class EditNoteView extends StatefulWidget {

 Note note;
 EditNoteView({ Key? key,required this.note }) : super(key: key);

  @override
  _EditNoteViewState createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {

  late String NewTitle;
  late String NewNoteDet;


  @override
  void initState() {
    // TODO: implement initState

    NewTitle = widget.note.title.toString();
    NewNoteDet = widget.note.content.toString();
    
    super.initState();
  }
  
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
             onPressed: () async {

               Note newNote = Note(content: NewNoteDet , title: NewTitle , createdTime:  widget.note.createdTime, pin: false , id: widget.note.id);
               await NotesDatabse.instance.updateNote(newNote);
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NoteView(note: newNote,)));
              
             }, 
             icon: Icon(Icons.save_outlined))
           ],
          ),

          body: Container(
          margin : EdgeInsets.symmetric(horizontal : 15 ,vertical: 10),
          child: Column(
            children: [
              Form(
                child: TextFormField(
                  initialValue: NewTitle,
                  cursorColor: white,
                  onChanged: (value) {
                    NewTitle = value;
                  },
                  style: TextStyle(fontSize: 25, color: Colors.white , fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.withOpacity(0.8))),
                ),
              ),


              Expanded(
                child: Container(
                  height: 300,
                  // decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
                  child: Form(
                    child: TextFormField(
                      onChanged: (value) {
                        NewNoteDet = value;
                      },
                      initialValue: NewNoteDet,
                      cursorColor: white,
                      keyboardType:  TextInputType.multiline,
                      minLines: 50,
                      maxLines: null,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Note",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.withOpacity(0.8))),
                    ),
                  ),
                ),
              )



              
            ],
          ),
        ),
      
    );
  }
}