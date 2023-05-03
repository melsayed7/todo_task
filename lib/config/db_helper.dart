import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_task/feature/home/data/task_model.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return null;
  }

  initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory}demo.db';
    var db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

// create table in database
  _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE myTodo(id INTEGER PRIMARY KEY AUTOINCREMENT, taskName TEXT, '
        'description TEXT, category TEXT, date INTEGER, time TEXT, notification TEXT, color INTEGER)');
  }

  //insert data
  Future<TaskModel> insert(TaskModel model) async {
    var dbClient = await db;
    await dbClient?.insert('myTodo', model.toJson());
    return model;
  }

  //get data
  Future<List<TaskModel>> getDataList() async {
    await db;
    final List<Map<String, dynamic>> queryResult =
        await _db!.rawQuery('SELECT * FROM myTodo');
    return queryResult.map((e) => TaskModel.fromJson(e)).toList();
  }

  //delete data
  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('myTodo', where: 'id=?', whereArgs: [id]);
  }

  //update data
  Future<int> update(TaskModel model) async {
    var dbClient = await db;
    return await dbClient!.update('myTodo', model.toJson(),
        where: 'id = ?', whereArgs: [model.id]);
  }
}
