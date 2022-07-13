import 'package:bookting/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookting/screens/screen_index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/index': (context) => IndexScreen(),
      },
      initialRoute: '/index',
    );
  }
}
