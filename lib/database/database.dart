import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
class ToDodataBase{
  List toDoList=[];
  final _mybox=Hive.box('mybox');
  void createInitialData(){
    toDoList=[
      ["make tutorial",false],
      ["do excercise",false],
    ];
  }

  void loadData(){
    toDoList=_mybox.get(("TODOLIST"));
}

void updateData(){
    _mybox.put('TODOLIST', toDoList);
}
}