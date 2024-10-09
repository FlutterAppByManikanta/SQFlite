import 'package:flutter/material.dart';

import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController studNameController = TextEditingController();
  TextEditingController studPasswordController = TextEditingController();


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
              decoration: InputDecoration(labelText: "Enter StudentName"),
            ),
          ),

          const SizedBox(height: 10,),

          Container(
            margin: EdgeInsets.only(left: 25,right: 25),
            child: TextField(
              controller: studPasswordController,
              decoration: InputDecoration(labelText: "Enter StudentPassword"),
            ),
          ),

          const SizedBox(height: 15,),
          
          ElevatedButton(onPressed: (){}, child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),

          const SizedBox(height: 15,),

          ElevatedButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));


          }, child: Text("REGISTER",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))





        ],
      )
    );
  }
}
