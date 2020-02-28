import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/todo_model.dart';

import 'add_task_page.dart';

class HomePage extends StatefulWidget {
  final TaskModel taskModel;

  HomePage({this.taskModel});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var date = DateFormat.yMMMd().format(DateTime.now());
  var time = DateFormat.Hm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    var tasks = Provider.of<TodoModel>(context);
    getText() {
      if (tasks.taskList.length <= 1) {
        return tasks.taskList.length.toString() + ' ' + 'task';
      } else if (tasks.taskList.length >= 1) {
        return tasks.taskList.length.toString() + ' ' + 'tasks';
      }
      return tasks;
    }

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Color(0xff0f0b69),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff7727ff),
            onPressed: () {
              navigation('Add Task');
            },
            child: Icon(
              Icons.add,
              size: 35,
            )),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.menu),
            ),
          ),

          backgroundColor: Color(0xff7727ff),
          elevation: 0,
          // title: Text('To-do ist',style: TextStyle(color: Color(0xff7727ff)),),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                date,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 0,
                    child: Container(
                        height: 100,
                        child: Center(
                          child: Text(
                            'Hello, Jane!',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 0,
                    child: Center(
                      child: Text(
                        getText(),
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff3930d8),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Consumer<TodoModel>(
                    builder: (context, task, child) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => Divider(height: 4.0,),
                        itemCount: task.taskList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Card(
                                elevation: 8,
                                child: ListTile(
                                    leading: Text(
                                      time,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff7727ff)),
                                    ),
                                    onTap: () {
                                      navigation('Edit Note');
                                    },
                                    subtitle: Text(
                                      task.taskList[index].content,
                                      style: TextStyle(
                                          color: Color(0xff7727ff),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    title: Text(
                                      task.taskList[index].title,
                                      style: TextStyle(
                                          color: Color(0xff7727ff),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    trailing: IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.blue),
                                        onPressed: () {})),
                              ));
                        },
                      );
                    },
                  )),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            notchMargin: 8,
            shape: CircularNotchedRectangle(),
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))))));
  }

  navigation(String title) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTaskPage(title)));
  }
}

//Color(0xff0f0b69)
/*
* ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          height: 0.5,
                        ),
                        itemCount: task.taskList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Card(
                                elevation: 8,
                                child: ListTile(
                                    onTap: () {
                                      navigation('Edit Note');
                                    },
                                    subtitle: Text(
                                      task.taskList[index].content,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    title: Text(
                                      task.taskList[index].title,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    trailing: IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.blue),
                                        onPressed: (){
                                       task.deleteTodo(taskModel);
                                        })),
                              ));
                        },
                      );*/
