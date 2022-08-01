import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dataclass.dart';
import 'dart:async';

class DatabaseHelper {
  //DatabaseHelper._();

  static final DatabaseHelper db = DatabaseHelper();

  Database? database;

  Future<Database> get gdatabase async {
    print("geting");
    if (database != null) {
      return database!;
    }
    database = await create();
    return database!;
  }

  Future<Database> create() async {
    return await openDatabase(
        join(await getDatabasesPath(), "data.db"),
        version: 1,
        onCreate: (Database database, int version) async {
          print("creating");
          await database.execute(
              "CREATE TABLE data(id INTAGER PRIMATY KEY ,title TEXT , text TEXT)");
        }
    );
  }
  Future<Data> insert(Data data) async {
    print("inserted");
    final db = database;
    data.id = await db!.insert("data", data.toMap());
    return data;
  }

  Future<List<Data>> getl()async{
    final db =  database;
    final List<Map<String, Object?>> queryResult = await db!.query('data');
    return queryResult.map((e) => Data.fromMap(e)).toList();
  }
  Future<int> delete(int id) async {
    final db =  database;
    return await db!.delete(
      "data",
      where: "id = ?",
      whereArgs: [id],
    );
  }
  Future<int> update(Data data) async {
    final db =  database;
    print("ipdater"+data.title.toString());
    return await db!.update(
      "data",
      data.toMap(),
      where: "id = ?",
      whereArgs: [data.id],
    );
  }
}
