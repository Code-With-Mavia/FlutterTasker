import 'package:hive_flutter/hive_flutter.dart';

class ToDoData{

List ToDoList=[];

  final _mybox=Hive.box('my box');

  void createInitialData(){
    ToDoList=[
    ];
  }

  void loadData()
  {
   ToDoList = _mybox.get("TODOLIST");
  }

  void updateTheData()
  {
_mybox.put("TODOLIST",ToDoList);
  }
}