import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/sqflite_db/database_model.dart';
import 'package:sqflite/sqflite.dart';
String tableName = 'tdb';
class DatabaseService {
  Future<Database> connectDb() async {
    var database = await openDatabase(join(await getDatabasesPath(), 'database.db'), version: 1, onCreate: (db, version) {
      db.execute(
        //paila db.query garna parcha first time install garda and again uninstall garne and agaiin install garne..sidhai execute garda chai table not found vancha
        'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, age INTEGER, sex INTEGER, chest INTEGER, bloodPressure INTEGER, cholestrol INTEGER, sugar INTEGER, heartRate INTEGER, dateTime String)',
      );
    }, onConfigure: onConfigure);
    // if (database != null) {
    //   Logger().d("Database connected successfully ");
    //   // print('Database connected successfully ');
    //   return database;
    // } else {
    //   Logger().d("Unable to connect to database ");
    //
    //   // print('Unable to connect to database ');
    //   return database;
    // }
    return database;

  }

  onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

  create(DatabaseModel databaseModel) async {
    final db = await DatabaseService().connectDb();
    Logger().d('aasdfghjkl');
    await db.insert(
      tableName,
      databaseModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<DatabaseModel>> readResult() async {
    final db = await DatabaseService().connectDb();
    var dbRead = await db.query(tableName);
    return List.generate(
      dbRead.length,
      (index) => DatabaseModel(
        age: dbRead[index]['age'] as int,
        sex: dbRead[index]['sex'] as int,
        chest: dbRead[index]['chest'] as int,
        cholestrol: dbRead[index]['cholestrol'] as int,
        bloodPressure: dbRead[index]['bloodPressure'] as int,
        heartRate: dbRead[index]['heartRate'] as int,
        sugar: dbRead[index]['sugar'] as int,
        dateTime: dbRead[index]['dateTime'] as String,
      ),
    );
  }

//   delete(int id) async {
//     final db = await DatabaseService().connectDb();
//     await db.delete(
//       'tableResult',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
}
