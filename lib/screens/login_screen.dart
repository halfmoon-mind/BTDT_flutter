import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../component/background_blur.dart';

String email = '';
String password = '';
String uid = '';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: statusBarHeight),
          decoration: background(),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                Image.asset('assets/Login_Title.jpg'),
                EmailInput(),
                Padding(padding: EdgeInsets.all(8.0)),
                PasswordInput(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                LoginButton(),
                Padding(
                  padding: EdgeInsets.all(4.0),
                ),
                RegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextField(
          onChanged: (value) {
            email = value;
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: '  ID(이메일)',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextField(
          onChanged: (value) {
            password = value;
          },
          obscureText: true,
          decoration: InputDecoration(
            labelText: '  password',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  Future setLogin(UID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
    await prefs.setString('UID', UID);
    print('[*] 로그인 상태 : ' + prefs.getBool('isLogin').toString());
    uid = UID;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      // height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        onPressed: () async {
          try {
            await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: email, password: password);
            final User user = FirebaseAuth.instance.currentUser!;
            await setLogin(user.uid).then((value) {
              Navigator.of(context).pushReplacementNamed('/index');
            });
            // Navigator.of(context).pushReplacementNamed('/index');
          } on FirebaseAuthException catch (e) {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("로그인 실패!"),
                content: Text('${e.message}'),
              ),
            );
          }
        },
        child: Text('LOGIN'),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/register');
      },
      child: Text(
        '회원가입',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
