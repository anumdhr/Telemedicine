import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:seventh_sem_project/module/auth/screen/local_database/models.dart';
import 'package:sqflite/sqflite.dart';

class LoginDatabaseServices {
  String newTableName = 'loginDbaseTable';

  Future<Database> connectDb() async {
    var database = await openDatabase(join(await getDatabasesPath(), 'mediDB.db'), version: 1, onCreate: (db, version) {
      db.execute('''
create table tableMedi( 
  id integer primary key autoincrement, firstName text not null, lastName text not null, email text not null, role text not null, phone text not null,)'''
          // 'CREATE TABLE tableMedi(id INTEGER PRIMARY KEY AUTOINCREMENT, firstName TEXT, lastName TEXT , email TEXT, role TEXT, phone TEXT )',
          // 'CREATE TABLE noteTable(id INTEGER PRIMARY KEY, title TEXT, description TEXT'
          );
    }, onConfigure: onConfigure);

    return database;
    // return database;
  }

  onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

  create(LoginDatabaseModel databaseModel) async {
    final db = await connectDb();
    await db.insert(
      'tableMedi',
      databaseModel.toJson(),
    );
  }

// Future<List<LoginDatabaseModel>> readResult() async {
//   final db = await LoginDatabaseServices().connectDb();
//   var dbRead = await db.query(newTableName);
//   return List.generate(
//     dbRead.length,
//         (index) => LoginDatabaseModel(
//           firstName:  dbRead[index]['firstName'] as String,
//           lastName:  dbRead[index]['lastName'] as String,
//           email:  dbRead[index]['email'] as String,
//           phone:  dbRead[index]['phone'] as String,
//     ),
//   );
// }

//   delete(int id) async {
//     final db = await DatabaseService().connectDb();
//     await db.delete(
//       'tableResult',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
}
