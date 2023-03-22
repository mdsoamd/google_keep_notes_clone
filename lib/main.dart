import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_keep_notes_clone/firebase_options.dart';
import 'package:google_keep_notes_clone/home.dart';
import 'package:google_keep_notes_clone/login.dart';
import 'package:google_keep_notes_clone/services/login_info.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}








class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  bool isLogIn = false;

  getLoggedInState() async{
    
    await LocalDataSaver.getLogData().then((value){
 
      setState(() {
          isLogIn = value.toString() == "null";
      });
    });
  }

  @override
  void initState() {
    
    super.initState();
        getLoggedInState();

  }
  
  @override
  Widget build(BuildContext context) {
     FirebaseAuth _auth  = FirebaseAuth.instance;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _auth.currentUser != null ? HomePage():Login(),
      
      // home: isLogIn ? Login(): HomePage(),
    );
  }
}

