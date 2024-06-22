import 'package:flutter/cupertino.dart';
import 'package:me_youtube_aplication/screen/sqllite/data/model/mind_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase extends ChangeNotifier {
  Database? db;
  String tablename = 'minds';

  Future<Database> getDb() async {
    if (db == null) {
      db = await CreateDatabase();
      return db!;
    }
    return db!;
  }

  CreateDatabase() async {
    String databasePath = await getDatabasesPath();
    String dbPath = '${databasePath}minds.db';
    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  Future<void> deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE $tablename ("
        "author TEXT,"
        "mind TEXT"
        ")");
  }

  var mindControl = TextEditingController();
  var autherController = TextEditingController();

  Future addMind(MindModel mind) async {
    Database db = await getDb();
    var id = await db.insert(
      tablename,
      {
        'author': "${mind.auther}",
        'mind': "${mind.mind}",
      },
    );
  }

  Future<List> getMinds() async {
    Database db = await getDb();
    var result = await db.query(tablename, columns: ['author', 'mind']);
    return result.toList();
  }

  Future updateMind(MindModel mindModel,String mind) async{
    Database db = await getDb();
    print(mindModel.toJson());
    var id = await db.update(tablename, {
      'author': "${mindModel.auther}",
      'mind': "${mindModel.mind}",
    }, where: "mind = ?", whereArgs: [mind]);
    print("Yangilandi");
  }

  Future deleteMind(String mind) async{
    Database db = await getDb();
    return await db.delete(tablename, where: 'mind=?',whereArgs: [mind]);
  }

}
