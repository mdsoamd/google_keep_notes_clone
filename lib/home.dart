import 'package:flutter/material.dart';
import 'package:google_keep_notes_clone/CreateNoteView.dart';
import 'package:google_keep_notes_clone/NoteView.dart';
import 'package:google_keep_notes_clone/SearchPage.dart';
import 'package:google_keep_notes_clone/SideMenuBar.dart';
import 'package:google_keep_notes_clone/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_keep_notes_clone/model/MyNoteModel.dart';
import 'package:google_keep_notes_clone/services/db.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  bool isLoading = true;
 
  late List<Note> notesList;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  String note = " THIS IS NOTES THIS IS NOTES THIS IS NOTES THIS IS NOTES THIS IS NOTES THIS IS NOTES THIS IS NOTES THIS IS NOTES THIS IS NOTES THIS IS NOTES THIS IS NOTES THIS IS NOTES THIS IS NOTES";
  String note1 = "]THIS IS NOTES THIS IS NOTES THIS IS NOTES";






@override
  void initState() {
    // TODO: implement initState
    createEntry(Note(pin: false, title:'hello', content: 'somad', createdTime:DateTime.now()));
    getAllNotes();
   
    
    super.initState();
   
  }






Future createEntry(Note note) async{
  await NotesDatabse.instance.InsertEntry(note);
}



Future getAllNotes() async{
  this.notesList =  await NotesDatabse.instance.readAllNotes();

  setState(() {
    isLoading = false;
  });
}




Future getOneNote(int id) async{
  await NotesDatabse.instance.readOneNote(id);
}



Future updateOneNote(Note note) async{
  await NotesDatabse.instance.updateNote(note);

}



Future deleteNote(Note note) async{
  await NotesDatabse.instance.delteNote(note);
}
  
  
  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold( backgroundColor: bgColor,  body: Center(child: CircularProgressIndicator(color: Colors.white,),),) : Scaffold(

       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => CreateNoteView()) );
        },
        backgroundColor: cardColor,
        child: Icon(Icons.add , size: 45,),
      ),
      
      
      
      
      
        backgroundColor: bgColor,
        endDrawerEnableOpenDragGesture: true,
        key: _drawerKey,
        drawer: SideMenu(),
      

     body: SafeArea(
          child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    width: MediaQuery.of(context).size.width,
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

                             const SizedBox(
                                width: 16,
                              ),

                              GestureDetector(
                                onTap: (() {
                                  Navigator.push(context, MaterialPageRoute(builder: ((context) => SearchView())));
                                }),

                                child: Container(
                                  height: 55,
                                  width: 200,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Search Your Notes",
                                          style: TextStyle(
                                              color: white.withOpacity(0.5),
                                              fontSize: 16),
                                        )
                                      ])),
                              )
                             
                            ],
                          ),





                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                TextButton(
                                    style: ButtonStyle(overlayColor:
                                       MaterialStateColor.resolveWith((states) =>white.withOpacity(0.1)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ))),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.grid_view,
                                      color: white,
                                    )),


                              const SizedBox(
                                  width: 9,
                                ),

                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.white,
                                )


                              ],
                            ),
                          ),
                        ])),


                NoteSectionAll(),    //* <-- Call  NoteSectionAll Widget
                NotesListSection()   //* <-- Call  NotesListSection Widget

              ],
            ),
          ),

        )));
  }
















// TODO Create Widget NoteSectionAll
 Widget NoteSectionAll() {
    return Container(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
        ),
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: notesList.length,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 4,
              staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              itemBuilder: (context, index) => 
              InkWell(
                onTap: () 
                {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(note: notesList[index],)));
                },
                child: 
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: white.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notesList[index].title,
                        style: TextStyle(
                            color: white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(notesList[index].content.length > 250
                              ? "${notesList[index].content.substring(0, 250)}..."
                              : notesList[index].content,
                      style: TextStyle(color: white),
                    )
                  ],
                ),
              ),
              
              )
            )),
      ],
    ));
  }














// TODO Create Widget NotesListSection
  Widget NotesListSection() {
    return Container(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "LIST VIEW",
                style: TextStyle(
                    color: white.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: white.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("HEADING",
                        style: TextStyle(
                            color: white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)
                        ),

                   const SizedBox(
                      height: 10,
                    ),

                    Text(
                      index.isEven
                          ? note.length > 250
                              ? "${note.substring(0, 250)}..."
                              : note
                          : note1,
                      style: TextStyle(color: white),
                    )
                  ],
                ),
              ),
            )),
      ],
    ));

  }






















 
  
}


