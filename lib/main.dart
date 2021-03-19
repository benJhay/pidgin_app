import 'package:flutter/material.dart';
import 'package:pidjin_app/addScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pidgin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddScreenPage(),
    );
  }
}
