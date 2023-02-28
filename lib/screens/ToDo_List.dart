import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24,left: 10,right: 10),
      child: Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Text('Do Excersice'),
            // Checkbox(value: value, onChanged: onChanged)
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(12)
        ),
      ),
    );
  }
}
