import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//나중에 로그아웃 기능에 해당 import 추가
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.yellow)),
                      onPressed: () {},
                      child: Text(
                        '중고가\n알아보기',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                    TextButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool('isLogin', false);
                          print('[*] 로그인 상태 : ' +
                              prefs.getBool('isLogin').toString());
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child: Text('로그아웃')),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'QR 코드',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
