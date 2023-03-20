
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDatabse {
  static final NotesDatabse instance = NotesDatabse._init();
  static Database? _database;
  NotesDatabse._init();

  Future<Database?> get database async{
    if(_database != null) return _database;
    _database = await _initializeDB('Notes.db');
    return _database;
  }


    Future<Database> _initializeDB(String filepath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath , filepath);

    return await openDatabase(path , version:  1, onCreate: _createDB );
  }



  
  Future _createDB(Database db, int version) async{
    await db.execute('''
    CREATE TABLE Notes(
      id INTEGER PRIMARY  KEY AUTOINCREMENT,
      pin BOOLEAN NOT NULL,
      title TEXT NOT NULL,
      content TEXT NOT NULL,
      createdTime TEXT NOT NULL
  
    )
    ''');
  }





  

  //TODO Data Add & Inser Function
  Future<bool?> InsertEntry()async{
    final db = await instance.database;
    await db!.insert("Notes", {"pin":0,"title":"THIS IS MY TITLE","content":"THIS IS MY NOTES CONTENT","createdTime":"01 Fer 2023"});
    return true;
  }








//TODO Data Read Function
  Future<String> readAllNotes()async{
    final db = await instance.database;
    final orderBy = 'createdTime ASC';
    final query_result = await db!.query("Notes",orderBy: orderBy);
    print(query_result);
    return "SUCCESFULL";
  }








//TODO Data ReadOne Function
  Future<String?> readOneNote(int id)async{
   final db = await instance.database;
   final map = await db!.query("Notes",
   columns:['title'] ,
   where: "id = ?",
   whereArgs: [id]

   );
   print(map);

  }





//TODO Note Data Updata function
Future<int> updateNote(int id) async{
  final db = await instance.database;
  return await db!.update("Notes",{"title":"THIS IS TITLE DATA UPDATE"},where:"id = ?",whereArgs: [id]);
}






  
}