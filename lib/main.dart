import 'package:bookting/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookting/screens/index_screen.dart';
import 'package:bookting/screens/login_screen.dart';
import 'package:bookting/screens/register_screen.dart';
import 'package:bookting/tabs/tabs_map.dart';
import 'package:bookting/component/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/maps': (context) => MapTap(),
        '/camera': (context) => UseCamera(),
      },
      initialRoute: '/',
    );
  }
}
