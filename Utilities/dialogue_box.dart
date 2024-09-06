import 'package:flutter/material.dart';
import 'package:todolist/utilities/my_button.dart';
 class DialogueBox extends StatelessWidget{
   final controller;
   VoidCallback onSave;
   VoidCallback onCancel;
    DialogueBox({
     super.key,
     required this.controller,
     required this.onSave,
     required this.onCancel,
   });
   @override
   Widget build(BuildContext context){
     return AlertDialog(
       backgroundColor: Colors.yellow,
    content: Container(
      height:120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add a new task",
          ),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(text: "Save", onPressed: onSave),
              const SizedBox(width: 8),
              MyButton(text: "Cancel", onPressed: onCancel),
            ],
          )
      ],
      ),
    ),
     );
   }
 }