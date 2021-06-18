import 'package:calendar_task/app/dataBase/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection{

  static Database _db;

  static Future<Database> getDataBase() async{
    if(_db == null){
      var path = join(await getDatabasesPath(), 'db_task');
      //deleteDatabase(path);
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute(createTable);
        },
      );
    }
    return _db;
  }
}