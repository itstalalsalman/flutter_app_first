
import 'package:flutter/material.dart';
import 'pages/todo_page.dart';
void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void userTapped(){
    print("asdasasd");
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoPage(),
  
    );
  }
}