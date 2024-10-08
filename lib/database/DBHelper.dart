import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_sqfiter/model/Student.dart';

class DBHelper {

  static final DBHelper instance = DBHelper.myOwnInstance();
  static Database? database;
  DBHelper.myOwnInstance();

  // Get the database Instance
  Future<Database?> get databaseData async {
    if (database != null) return database!;
    database = await initialStudentDB();
    return database;
  }


  // Initialize Student Database
  Future<Database> initialStudentDB() async {
    String path = join(await getDatabasesPath(),'StudentDB.db');
    return await openDatabase(path, version: 1,onCreate: onCreate);
  }

  // Create a Student Table
  onCreate(Database db , int version) async {
    await db.execute(
        ''' CREATE TABLE Student(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          studName Text NOT NULL,
          studEmail Text NOT NULL,
          studAddress Text NOT NULL,
          studPhoneNumber Text NOT NULL,
    )
      '''
    );
  }

  // Insert Student Data into Student Table
Future<int?> insertStudentRecord(Student student) async {
    Database? db = await instance.databaseData;
    return await db?.insert('Student', student.toMap());
}

}