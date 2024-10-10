import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_sqfiter/model/Student.dart';

class DBHelper {

  static final DBHelper instance = DBHelper.myOwnInstance();
  static Database? database;

  factory DBHelper() => instance;

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
          studPassword Text NOT NULL,
          studEmail Text NOT NULL,
          studAddress Text NOT NULL,
          studPhoneNumber Text NOT NULL
    )
      '''
    );
  }

  // Insert Student Data into Student Table
Future<int?> insertStudentRecord(Student student) async {
    Database? db = await instance.databaseData;
    return await db?.insert('Student', student.toMap());
}

// Fetch StudName
  Future<Map<String,dynamic>?> getStudName(String studentName) async {
    Database? db = await instance.databaseData;
     var result = await db?.query('Student',where: "studName = ?",whereArgs: [studentName] , limit: 1);
     if (result != null) {
       if (result.isNotEmpty) {
         return result.first;
       }
     }
    return null;
  }

      // Validate Login Data
      Future<bool> validateLoginCrediantails(String studentName , String studentPassword) async {
        Map<String,dynamic>? stud = await instance.getStudName(studentName);
        if (stud != null) {
          if(stud['studPassword'] == studentPassword) {
            return true; // valid user
          } else {
            return false; // Invalid Password
          }
        }
        return false; // User Not Found
    }

    // Fetch All Student Records
    Future<List<Student>> getStudentsDataList() async {
      Database? db = await instance.databaseData;
      var studentsList = await db!.query('Student');
      return List.generate(studentsList.length, (i) {
        return Student.fromMap(studentsList[i]);
      });
    }

    // Update Student Record
    Future<int?> updateStudentData(Student student) async {
      Database? db = await instance.databaseData;
      return await db?.update('Student', student.toMap(),where: 'id = ?',whereArgs: [student.id]);
    }

    // Delete the Student Record
  Future<int?> deleteStudentData(int studentID) async {
    Database? db = await instance.databaseData;
    return await db?.delete('Student',where: 'id = ?',whereArgs: [studentID]);
  }

}