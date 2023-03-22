import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_keep_notes_clone/colors.dart';
import 'package:google_keep_notes_clone/home.dart';
import 'package:google_keep_notes_clone/model/MyNoteModel.dart';
import 'package:google_keep_notes_clone/services/db.dart';
import 'package:uuid/uuid.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({ Key? key }) : super(key: key);

  @override
  _CreateNoteViewState createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {

  TextEditingController Title = TextEditingController();
  TextEditingController Content = TextEditingController();

  
// Create uuid object
var uuid = Uuid();




  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Title.dispose();
    Content.dispose();
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

              await NotesDatabse.instance.InsertEntry(Note(pin: false,isArchieve: false, title: Title.text,uniqueID:uuid.v1(),content: Content.text, createdTime: DateTime.now()));

              Navigator.pushReplacement(context, MaterialPageRoute(builder:((context) => HomePage())));
              
             }, 
             icon: Icon(Icons.save_outlined))
            ],
          ),




          body: Container(
          margin : EdgeInsets.symmetric(horizontal : 15 ,vertical: 10),
          child: Column(
            children: [
              TextField(
                controller: Title,
                cursorColor: white,
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
              Container(
                height: 300,
                child: TextField(
                  controller: Content,
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
              )
              
            ],
          ),),





      
    );


  }
}