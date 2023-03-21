import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/screens/dialogBox.dart';

import 'ToDo_List.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox=Hive.box('mybox');
  ToDodataBase db=ToDodataBase();
  @override
  void initState(){
    if(_mybox.get("TODOLIST")==null){
  db.createInitialData();
  }else{
  db.loadData();
  }
  super.initState();
}
  final _controller=TextEditingController();

  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateData();
  }

  void savedNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        textController: _controller,
        onSave: savedNewTask,
        onCancel: ()=>Navigator.of(context).pop(),
      );
    });
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.pink[200],
      appBar: AppBar(
        title: const Center(child: Text('To Do')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(
              taskName: db.toDoList[index][0],
              onChanged: (value)=>checkBoxChanged(value,index),
              taskCompleted: db.toDoList[index][1],
            deleteFunction: (context)=>deleteTask(index),
          );
        },
      ),
    );
  }
}
