// Main
import 'package:flutter/material.dart';
import 'pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        canvasColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
