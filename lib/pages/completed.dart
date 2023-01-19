import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hive/hive.dart';

import '../data/database.dart';
import '../util/dialog_boc.dart';
import '../util/todo_tile.dart';

class completed extends StatefulWidget {
  const completed({Key? key}) : super(key: key);

  @override
  State<completed> createState() => _completedState();
}

class _completedState extends State<completed> {



  final _mybox = Hive.box('mybox');

  ToDoDataBase db = ToDoDataBase();


  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

// text controller
  final _controller = TextEditingController();

// checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      var gogo = db.todoList.indexOf([1]);
      if(gogo == true)

      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
      db.updateDataBase();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Completed Task', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.blue.shade100,
        elevation: 5,
      ),


      body: Container(
        color: Colors.blue.shade50,
        child: ListView.builder(
          itemCount: db.todoList.length,


          itemBuilder: (context, index) {
            return Visibility(
              visible: db.todoList[index][1] == true,
              child: TodoTile(
                taskName: db.todoList[index][0],
                taskCompleted: db.todoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              ),
            );
          },
        ),
      ),
    );



  }
}





