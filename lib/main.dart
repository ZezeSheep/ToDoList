import 'package:To_Do_List/screens/toDoScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp()); //roda a funcao runApp

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      home: ToDoScreen(),
    );
  }
}
