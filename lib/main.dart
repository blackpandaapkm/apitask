import 'package:apitask/ToDoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'style.dart';


void main(){
  runApp(MyApp());
}

class MyApp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: "TodoApp",
       theme: ThemeData(primarySwatch: Colors.green),
       home: ToDoPage(),
     );
  }





}