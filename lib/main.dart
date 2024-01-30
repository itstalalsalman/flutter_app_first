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
        body: Center(
          child: GestureDetector(
            onTap: () {
              print("User Tapped");
            },
            child: Container(
              height: 200,
              width: 200,
              color: Colors.deepPurple[300],
              child: Center(child: Text("Tap me!")),
            ),
          ),
        ),
      ),
    );
  }
}