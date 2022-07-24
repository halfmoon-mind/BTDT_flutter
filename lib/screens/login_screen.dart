import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookting/providers/user_id.dart';

String email = '';
String password = '';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인 화면'),
      ),
      body: Column(
        children: [
          EmailInput(),
          PasswordInput(),
          LoginButton(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(thickness: 1),
          ),
          RegisterButton(),
        ],
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        onChanged: (value) {
          email = value;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: '이메일',
          helperText: '',
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: '비밀번호',
          helperText: '',
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  Future setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
    print('[*] 로그인 상태 : ' + prefs.getBool('isLogin').toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () async {
          try {
            await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: email, password: password);
            await setLogin();
            context.read<UserId>().changeUser(email);
            Navigator.of(context).pushReplacementNamed('/index');
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
        child: Text('로그인'),
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
        '이메일로 회원가입',
        style: TextStyle(color: theme.primaryColor),
      ),
    );
  }
}
