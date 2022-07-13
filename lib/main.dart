import 'package:bookting/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookting/screens/index_screen.dart';
import 'package:bookting/screens/login_screen.dart';
import 'package:bookting/screens/register_screen.dart';
import 'package:bookting/screens/search_screen.dart';
import 'package:bookting/screens/detail_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/index': (context) => IndexScreen(),
        '/register': (context) => RegisterScreen(),
        '/search': (context) => SearchScreen(),
        '/detail': (context) => DetailScreen(),
      },
      initialRoute: '/',
    );
  }
}
