import 'package:flutter/material.dart';
import 'package:to_do_app/Components/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightBlueAccent[100],
      content: SizedBox(
        height: 120,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          //user input
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new Task",
            ),
          ),

          //save and cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //cancel
              MyButton(text: "Cancel", onPressed: onCancel),

              //save
              MyButton(text: "Save", onPressed: onSave),
            ],
          ),
        ]),
      ),
    );
  }
}
