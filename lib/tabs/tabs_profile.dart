import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bookting/model/user.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../component/data.dart';
String? UID;

class ProfileTab extends StatelessWidget {
  Future setLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', false);
    prefs.setString('UID', '');
    print('[*] 로그인 상태 : ' + prefs.getBool('isLogin').toString());
  }

  Future getUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UID = prefs.getString('UID');
  }

  Future<List<USER>> getUserData(UID) => FirebaseFirestore.instance
      .collection('user')
      .where('uid', isEqualTo: UID)
      .get()
      .then((snapshot) =>
          snapshot.docs.map((doc) => USER.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    getUID();

    List<Widget> printUserData(List<USER> user) {
      List<Widget> userData = [];
      userData.add(Row(
        children: [
          const SizedBox(
              width: 100,
              child: Text(
                '이름',
                style: TextStyle(fontSize: 20),
              )),
          Text(
            user[0].name!,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ));
      userData.add(Row(
        children: [
          const SizedBox(
              width: 100,
              child: Text(
                '학번',
                style: TextStyle(fontSize: 20),
              )),
          Text(
            user[0].id!,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ));
      userData.add(Row(
        children: [
          const SizedBox(
              width: 100,
              child: Text(
                '전화번호',
                style: TextStyle(fontSize: 20),
              )),
          Text(
            user[0].phone!,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ));
      userData.add(Row(
        children: [
          const SizedBox(
              width: 100,
              child: Text(
                '이메일',
                style: TextStyle(fontSize: 20),
              )),
          Text(
            user[0].email!,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ));

      userData.add(TextButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          await setLogout();
          Navigator.of(context).pushReplacementNamed('/login');
        },
        child: const Text('로그아웃'),
      ));
      return userData;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Row(children: const [
          Icon(
            Icons.person,
            size: 30,
          ),
          Text(' 프로필 정보'),
        ]),
      ),
      body: FutureBuilder<List<USER>>(
        future: getUserData(UID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
            return Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: printUserData(user),
                ));
          } else {
            return TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await setLogout();
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: const Text('로그아웃'),
            );
          }
        },
      ),
    );
  }
}
