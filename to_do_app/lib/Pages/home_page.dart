import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/Components/Dialog_Box.dart';
import 'package:to_do_app/Components/todo_tile.dart';
import 'package:to_do_app/Data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //hive box ref
  final myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    //first time opening
    if( myBox.get("TODOLIST") == null ){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final myController = TextEditingController();

  void checkBoxChanged(bool value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBAse();
  }

  //save task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([myController.text, false]);
      myController.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBAse();
  }

  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: myController,
            onSave: saveNewTask,
            onCancel: ()=> Navigator.of(context).pop(),
          );
        }
    );
  }

  // delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBAse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(textAlign: TextAlign.center,'TO DO'),
        backgroundColor: const Color(0xFF3498db),
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
//body
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value!, index),
              deleteFunction: (context) => deleteTask(index),
          );
        },
      )
    );
  }
}
