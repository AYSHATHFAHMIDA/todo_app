import 'package:flutter/material.dart';
import 'package:todo_app/screens/myButton.dart';

class DialogBox extends StatelessWidget {
  final textController;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({
     super.key,
     required this.textController,
     required this.onCancel,
     required this.onSave,
   });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'Save', onPressed: onSave),
                const SizedBox(width: 4,),
                MyButton(text: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
