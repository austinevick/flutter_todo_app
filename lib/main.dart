import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Screens/home_page.dart';

import 'Models/todo_model.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (context) => TodoModel(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
