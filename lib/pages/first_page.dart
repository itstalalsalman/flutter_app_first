import 'package:flutte_app/pages/second_page.dart';
import 'package:flutter/material.dart';


class FirstPage extends StatelessWidget{
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("1st Page")),
      body: Center(child: ElevatedButton(
        child: Text("Go to Second Page"),
        onPressed: () {
          Navigator.pushNamed(context, '/secondpage');
        },
      )),
    );
  }

}