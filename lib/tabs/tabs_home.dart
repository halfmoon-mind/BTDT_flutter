import 'package:bookting/providers/user_id.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:bookting/providers/user_id.dart';
//로그인 한 사람 데이터 갖고 오기 위한 프로바이더
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

//나중에 로그아웃 기능에 해당 import 추가
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';
String? uid = '';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        color: Colors.blue,
        margin: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Text(''),
            ),
            Container(
              height: (MediaQuery.of(context).size.height * 0.5) - 200,
              child: getLendBooks(),
            ),
          ],
        ),
      ),
    );
  }
}

class getLendBooks extends StatefulWidget {
  @override
  _getLendBooks createState() => _getLendBooks();
}

class _getLendBooks extends State<getLendBooks> {
  Future getUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('UID');
  }

  Stream<List<User>> readUser() => FirebaseFirestore.instance
      .collection('user')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Widget buildUser(User user) => ListTile(
        title: Text(user.name.toString()),
        subtitle: Text(user.phone.toString()),
      );

  getList(List<User> users) {
    Text textData = Text('');
    for (int i = 0; i < users.length; i++) {
      if (users[i].uid == uid) {
        textData = Text(users[i].name.toString());
      }
    }
    print(uid);
    return textData;
  }

  @override
  Widget build(BuildContext context) {
    getUID();
    return Scaffold(
      body: StreamBuilder<List<User>>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return getList(users);
            // return ListView(
            //   children: users.map(buildUser).toList(),
            // );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
