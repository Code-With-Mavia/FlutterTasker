import 'package:flutter/material.dart';
import'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends  StatefulWidget{
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
   ToDoTile({
     required this.taskName,
     super.key,
     required this.taskCompleted,
     required this.onChanged,
     required this.deleteFunction,
   });

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
    Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.only(left: 25,right: 25, top: 25,),
        child: Slidable(
        endActionPane:ActionPane(
          motion: StretchMotion(),
          children:[
            SlidableAction(
                onPressed:(context)=>widget.deleteFunction!(context),
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child:Container(
        padding: const EdgeInsets.all(24),
       decoration: BoxDecoration(
          color: Colors.yellow,
        borderRadius: BorderRadius.circular(13),
      ),
        child: Row(
        children:[
          Checkbox(
              value: widget.taskCompleted,
              onChanged: widget.onChanged,
              activeColor: Colors.black87,
          ),

           Text(
               widget.taskName,
             style: TextStyle(
                 decoration: widget.taskCompleted?
                 TextDecoration.lineThrough :TextDecoration.none,
             ),
           ),
       ],
        ),
    ),
        ),
    );
  }
}
