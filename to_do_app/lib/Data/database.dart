import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ToDoDataBase{

  List toDoList = [];

  //ref our box
  final myBox = Hive.box('myBox');

  void createInitialData() {
    toDoList = [];
  }

  void loadData(){
    toDoList = myBox.get("TODOLIST");
  }

  void updateDataBAse(){
    myBox.put("TODOLIST", toDoList);
  }
}