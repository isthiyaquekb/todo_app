import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/task_model.dart';

class DatabaseHelper {
  static Database? _database;
  static const int _version = 1;
  static const String tableTask = "task_table";

  //TASK COLUMNS
  static const _columnTaskId = "id";
  static const _columnTitle = "title";
  static const _columnStatus = "status";
  static const _columnTaskType = "taskType";
  static const _columnTaskDate = "taskDate";
  static const _columnTaskFromTime = "taskFromTime";
  static const _columnTaskToTime = "taskToTime";
  static const _columnTaskReminder = "reminder";

  static Future<void> initDB() async {
    if (_database != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}tododb.db';
      _database =
          await openDatabase(path, version: _version, onCreate: onCreate);
    } catch (ex) {
      log(ex.toString());
    }
  }

  static void onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $tableTask("
      "$_columnTaskId INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$_columnTitle STRING,"
      "$_columnStatus INTEGER,"
      "$_columnTaskType STRING,"
      "$_columnTaskDate STRING,"
      "$_columnTaskFromTime STRING,"
      "$_columnTaskToTime STRING,"
      "$_columnTaskReminder INTEGER"
      ")",
    );
    log("CREATING A DB");
  }

  //INSERT INTO DB
  static Future<int> insertTask(TaskItem tasks) async {
    return await _database?.insert(tableTask, tasks.toMap()) ?? 1;
  }

  //READ FROM DB
  static Future<List<Map<String, dynamic>>?> readTaskQuery() async {
    return await _database?.query(tableTask);
  }

  //DELETE FROM DB
  static deleteTask(TaskItem tasks)async{
    return await _database?.delete(tableTask,where: '$_columnTaskId=?',whereArgs: [tasks.id]);
  }
  //UPDATE DB
 /* static updateTask(String id, String status) async {
    int count = await _database!.rawUpdate('''
    UPDATE $_tableTransactionList
    SET ${DBHelper._columnTransactionStatus} =?
    WHERE ${DBHelper._columnTransactionId} = ?
    ''', [status, id]);
    log("UPDATE RECEIVE STOCK COUNT:$count");
  }*/
}
