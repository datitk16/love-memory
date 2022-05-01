import 'package:flutter/material.dart';
import 'package:love_memory/screens/login/login.dart';
import 'package:love_memory/screens/photo/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love memory',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
