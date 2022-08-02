import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTab extends StatelessWidget {
  Future setLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
    prefs.setString('UID', '');
    print('[*] 로그인 상태 : ' + prefs.getBool('isLogin').toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필 화면입니다!'),
      ),
      body: Container(
        child: Column(children: [
          Text('프로필 화면'),
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await setLogout();
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: Text('로그아웃')),
        ]),
      ),
    );
  }
}
