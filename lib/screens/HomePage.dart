import 'package:flutter/material.dart';

import 'ToDo_List.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final String textName;
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.pink[200],
      appBar: AppBar(
        title: Center(child: Text('To Do')),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ToDoTile(),
          ToDoTile(),
          ToDoTile(),
        ],
      ),
    );
  }
}
