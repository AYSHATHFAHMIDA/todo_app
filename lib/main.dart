import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/screens/HomePage.dart';

void main()async{
  await Hive.initFlutter();
  var box=await Hive.openBox('mybox');
  runApp(const MyToDoApp());
}
class MyToDoApp extends StatelessWidget {
  const MyToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}

