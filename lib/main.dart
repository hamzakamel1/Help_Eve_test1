import 'package:flutter/material.dart';
import 'package:help_eve/view/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest APi',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
