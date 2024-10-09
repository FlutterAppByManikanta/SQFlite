import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_sqfiter/database/DBHelper.dart';
import 'package:student_sqfiter/model/Student.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController studNameController = TextEditingController();
  TextEditingController studPasswordController = TextEditingController();
  TextEditingController studEmailController = TextEditingController();
  TextEditingController studAddressController = TextEditingController();
  TextEditingController studPhoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: TextField(
                controller: studNameController,
                decoration: InputDecoration(labelText: "Enter Student Name"),
              ),
            ),

            const SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: TextField(
                controller: studPasswordController,
                decoration: InputDecoration(labelText: "Enter Student Password"),
              ),
            ),

            const SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: TextField(
                controller: studEmailController,
                decoration: InputDecoration(labelText: "Enter Student Email"),
              ),
            ),

            const SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: TextField(
                controller: studAddressController,
                decoration: InputDecoration(labelText: "Enter Student Address"),
              ),
            ),

            const SizedBox(height: 10,),



            Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: TextField(
                controller: studPhoneNumberController,
                decoration: InputDecoration(labelText: "Enter Student Phone Number"),
              ),
            ),

            const SizedBox(height: 15,),

            ElevatedButton(onPressed: () {

              var id = DBHelper.instance.insertStudentRecord(
                  Student(
                      studentName: studNameController.text,
                      studentPassword: studPasswordController.text,
                      studentEmail: studEmailController.text,
                      studentAddress: studAddressController.text,
                      studentPhoneNumber: studPhoneNumberController.text)
              );

              if (id != -1) {
                print("Record Inserted SuccessFully $id");
              }

            }, child: Text("REGISTER",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))

          ],
        )
    );
  }
}
