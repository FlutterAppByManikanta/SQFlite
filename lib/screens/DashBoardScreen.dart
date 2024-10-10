import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../database/DBHelper.dart';
import '../model/Student.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  List<Student?> studentsList = [];
  final DBHelper dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    fetchStudentsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(itemCount : studentsList.length,itemBuilder: (context,index) {
        return Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [

                  Expanded(
                    flex: 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                          Text("${studentsList[index]?.studentName}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                          Text("${studentsList[index]?.studentPhoneNumber}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),

                          Text("${studentsList[index]?.studentAddress}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),

                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                      child: GestureDetector(
                          onTap: () async {
                            var studId = studentsList[index]?.id;
                              await dbHelper.deleteStudentData(studId!);
                             fetchStudentsData();
                          },

                          child: Icon(Icons.delete,size: 30,)))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<void> fetchStudentsData() async {
    List<Student?> studentsListData = await dbHelper.getStudentsDataList();
    setState(() {
      studentsList = studentsListData;
      print(studentsList.length);
    });
  }
}
