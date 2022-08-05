import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:bookting/providers/user_id.dart';
//로그인 한 사람 데이터 갖고 오기 위한 프로바이더
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookting/model/user.dart';
import 'package:bookting/model/lend_book.dart';

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
        margin: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.dstATop,
                  ),
                  fit: BoxFit.cover,
                  image: const AssetImage('assets/Home_Background.jpg'),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Image.asset(
                'assets/Camera.png',
                width: 150,
                height: 150,
              )),
            ),
            Container(
              height: (MediaQuery.of(context).size.height * 0.7) - 132,
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

  Future<List<LEND_BOOK>> readUser() => FirebaseFirestore.instance
      .collection('lend_book')
      .where('LEND_USER', isEqualTo: uid)
      .get()
      .then((snapshot) =>
          snapshot.docs.map((doc) => LEND_BOOK.fromJson(doc.data())).toList());
  // .snapshots()
  // .map((snapshot) =>
  //     snapshot.docs.map((doc) => LEND_BOOK.fromJson(doc.data())).toList());

  Widget buildUser(LEND_BOOK lend_book) => ListTile(
        title: Text(lend_book.BIBLIO.toString()),
        subtitle: Text(lend_book.WRITER.toString()),
      );

  getList(List<LEND_BOOK> lend_book) {
    int countBook = 0;
    List<Widget> BookList = [];
    double MEDIAWIDTH = MediaQuery.of(context).size.width;

    for (int i = 0; i < lend_book.length; i++) {
      BookList.add(
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.withOpacity(0.1),
          padding:
              EdgeInsets.fromLTRB(MEDIAWIDTH * 0.05, 1, MEDIAWIDTH * 0.05, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 100,
                  height: 130,
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.network(
                    lend_book[i].URL!,
                    width: 100,
                    height: 150,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey,
                        child: const Center(
                            child: Text('이미지\n없음',
                                style: TextStyle(fontSize: 25))),
                      );
                    },
                  )),
              Container(
                width: (MEDIAWIDTH * 0.9) - 100,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                // color: Colors.grey.withOpacity(0.1),
                // width: (MediaQuery.of(context).size.width * 0.9) - 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lend_book[i].TITLE!,
                      style: const TextStyle(
                          fontSize: 25, overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      lend_book[i].WRITER!,
                      style: const TextStyle(fontSize: 18),
                      softWrap: true,
                    ),
                    Text(
                      '대출일자 | ${lend_book[i].START!}',
                      style: const TextStyle(fontSize: 15),
                      softWrap: false,
                    ),
                    Text(
                      '반납일자 | ${lend_book[i].END!}',
                      style: const TextStyle(fontSize: 15),
                      softWrap: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      BookList.add(
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey,
        ),
      );
      countBook += 1;
    }
    List<Widget> wholeColumn = [
      Container(
        color: Colors.black.withOpacity(0.15),
        width: MediaQuery.of(context).size.width,
        height: 40,
        padding: EdgeInsets.only(left: MEDIAWIDTH * 0.05),
        child: Text(
          '대여중인 책($countBook)',
          style: TextStyle(fontSize: 25),
        ),
      ),
      Container(
        child: Column(
          children: BookList,
        ),
      ),
    ];
    return wholeColumn;
  }

  @override
  Widget build(BuildContext context) {
    getUID();
    return Scaffold(
      body: FutureBuilder<List<LEND_BOOK>>(
        future: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: getList(users),
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   getUID();
  //   print(uid);
  //   return Scaffold(
  //     body: StreamBuilder<List<LEND_BOOK>>(
  //       stream: readUser(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           final users = snapshot.data!;
  //           return SingleChildScrollView(
  //             child: Column(
  //               children: getList(users),
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //             ),
  //           );
  //         } else {
  //           return Center(child: CircularProgressIndicator());
  //         }
  //       },
  //     ),
  //   );
  // }
}
