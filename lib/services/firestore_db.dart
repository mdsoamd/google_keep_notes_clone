import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_keep_notes_clone/model/MyNoteModel.dart';
import 'package:google_keep_notes_clone/services/db.dart';

class FireDB{
  //CREATE,READ,UPDATE,DELETE
final FirebaseAuth _auth  = FirebaseAuth.instance;

createNewNoteFirestore(Note note) async{
final User? current_user =  _auth.currentUser;
  await FirebaseFirestore.instance.collection("notes").doc(current_user!.uid).collection("usernotes").doc(note.uniqueID).set(
  {
    "Title" : note.title,
    "content" : note.content,
    "date" : DateTime.now(),
    "uniqueID" : note.uniqueID

  }).then((_){
    print("DATA ADDED SUCCESSFULLY");
  });


}







getAllStoredNotes() async{
  List<Note> data = [];
final User? current_user =  _auth.currentUser;
    await FirebaseFirestore.instance.collection("notes").doc(current_user!.uid).collection("usernotes").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      Map note = result.data();
      NotesDatabse.instance.InsertEntry(Note(title:note["Title"] ,uniqueID: note['uniqueID'], content : note["content"] , createdTime: note["date"] , pin: false, isArchieve: false));  //Add Notes In Database
    });
  });
   
}






updateNoteFirestore(Note note ) async{
final User? current_user =  _auth.currentUser;
   await FirebaseFirestore.instance
        .collection("notes")
        .doc(current_user!.uid).collection("usernotes").doc(note.uniqueID)
        .update({"title": note.title.toString() , "content" : note.content}).then((_) {
      print("DATA ADDED SUCCESFULLY");
    });
}



deleteNoteFirestore(Note note) async{
  final User? current_user =  _auth.currentUser;
    await FirebaseFirestore.instance.collection("notes").doc(current_user!.uid.toString()).collection("usernotes").doc(note.uniqueID).delete().then((_) {
    print("DATA DELETED SUCCESS FULLY");
  });
}










}