import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Colors.deepPurple[200],
        // appBar: AppBar(
        //   title: Text("My App Bar"),
        //   backgroundColor: Colors.deepPurple,
        //   elevation: 0,
        //   leading: Icon(Icons.menu),
        //   actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
        // ),
        body: Column(children: [
          Container(height: 200, width: 200, color: Colors.deepPurple,),
          Container(height: 200, width: 200, color: Colors.deepPurple[400],),
          Container(height: 200, width: 200, color: Colors.deepPurple[200],),

        ],
        ),
      ),
    );
  }
}