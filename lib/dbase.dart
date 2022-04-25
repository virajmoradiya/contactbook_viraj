import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Dabase {

 Future<Database> Getdatabase()
  async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'contactbookviraj.db');

    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'create table contacts (id integer primary key autoincrement, name Text, number text)');
        });

    return database;
  }
  Future<void> insertdata(String nname, String nnumber, Database database01) async {

   String insertqry = "insert into contacts (name,number) values('$nname','$nnumber')";

   int cnt = await database01.rawInsert(insertqry);

   print(cnt);
  }

}