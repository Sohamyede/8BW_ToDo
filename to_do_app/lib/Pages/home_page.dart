import 'package:flutter/material.dart';
import 'package:to_do_app/Components/Dialog_Box.dart';
import 'package:to_do_app/Components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //text controller
  final myController = TextEditingController();

  List toDoList = [];

  void checkBoxChanged(bool value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save task
  void saveNewTask(){
    setState(() {
      toDoList.add([myController.text, false]);
      myController.clear();
    });
    Navigator.of(context).pop();
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
      toDoList.removeAt(index);
    });
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

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value!, index),
              deleteFunction: (context) => deleteTask(index),
          );
        },
      )
    );
  }
}
