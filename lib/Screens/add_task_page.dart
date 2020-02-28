import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/todo_model.dart';
import 'package:todo/Screens/home_page.dart';

class AddTaskPage extends StatefulWidget {
  final String title;

  AddTaskPage(this.title);

  @override
  _AddTaskPageState createState() => _AddTaskPageState(this.title);
}

class _AddTaskPageState extends State<AddTaskPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String title = '';

  _AddTaskPageState(this.title);


  TaskModel taskModel = TaskModel();

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  String date;

  @override
  Widget build(BuildContext context) {
    TodoModel todoModel = Provider.of<TodoModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff7727ff),
          child: IconButton(
              icon: Icon(
                Icons.mic,
                size: 30,
                color: Colors.white,
              ),
              onPressed: null),
          onPressed: () {}),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.done),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                if (formKey.currentState.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage(taskModel: taskModel)));
                  todoModel.addTask(controller1.text, controller2.text);
                }
              }),
        ],
        backgroundColor: Color(0xff7727ff),
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        height: 500,
        decoration: BoxDecoration(
            color: Color(0xff3930d8),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50))),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 15,),
            Form(
              key: formKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'field cannot be empty';
                            }
                            return null;
                          },
                          autofocus: true,
                          controller: controller1,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter New Task',
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                            border: InputBorder.none,
                            fillColor: Colors.grey.withOpacity(0.5),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'fields cannot be empty';
                              }
                              return null;
                            },
                            // maxLines: 3,
                            autofocus: true,
                            controller: controller2,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter Description',
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              border: InputBorder.none,
                              fillColor: Colors.grey.withOpacity(0.5),
                            ),
                          ))),
                ],
              ),
            ),
            ],
        ),
      ),
    );
  }


}
