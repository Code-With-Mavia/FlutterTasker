import 'package:flutter/material.dart';
import 'package:todolist/data/data.dart';
import 'package:todolist/utilities/dialogue_box.dart';
import 'package:todolist/utilities/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePageState();

  }
class _HomePageState extends State<HomePage>
{
  final _myBox=Hive.box('my box');
  ToDoData db=ToDoData();

  @override
  void initState(){
    if(_myBox.get("TODOLIST")==null)
      {
        db.createInitialData();
      }
    else
      {
        db.loadData();
      }

    super.initState();
  }
  @override
  void dispose()
  {
    db.updateTheData();
    super.dispose();
  }

  final _controller=TextEditingController();


  void checkBoxChanged(bool? value ,int index)
  {
setState(() {
  db.ToDoList [index][1]=!db.ToDoList[index][1];
});
db.updateTheData();
  }

  void saveNewTask()
  {
    setState(() {
      db.ToDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateTheData();
  }
  void createNewTask()
  {
    showDialog
      ( context: context,
        builder: (context)
        {
          return DialogueBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: ()=>Navigator.of(context).pop(),
          );
        },
      );
  }
  void deleteTask(int index)
  {
setState(() {
  db.ToDoList.removeAt(index);
}
);db.updateTheData();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Center(
              child:Text("To Do"),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createNewTask,
        child: const Icon(
         Icons.add
      ),
      ),
      body: ListView.builder(
        itemCount: db.ToDoList.length,
        itemBuilder: (context,index)
        {
          return ToDoTile(
              taskName: db.ToDoList[index][0],
              taskCompleted: db.ToDoList[index][1],
              onChanged: (value)=> checkBoxChanged(value,index),
              deleteFunction:(context)=>deleteTask(index),
          );
        },
       ),
    );
  }
}