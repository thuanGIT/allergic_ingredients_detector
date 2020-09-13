import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Contest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Comic Sans MS'),
      home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/images/background.jpg"),
                  fit: BoxFit.cover)),
          child: MyHomePage()),
    );
  }
}
