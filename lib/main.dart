import 'package:bookting/providers/user_id.dart';
import 'package:bookting/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookting/screens/index_screen.dart';
import 'package:bookting/screens/login_screen.dart';
import 'package:bookting/screens/register_screen.dart';
import 'package:bookting/screens/search_screen.dart';
import 'package:bookting/screens/detail_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'providers/user_id.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserId>(create: (_) => UserId()),
  ], child: MyApp()));
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
