import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookting/model/lib_book.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key, required this.queryData}) : super(key: key);
  final String queryData;
  @override
  _SearchResult createState() => _SearchResult();
}

result() {}

getList(List<LIB_BOOK> lib_book) {
  return Container();
}

class _SearchResult extends State<SearchResult> {
  Future<List<LIB_BOOK>> queryString(String queryData) => FirebaseFirestore
      .instance
      .collection('lib_book')
      .where('TITLE'.contains(queryData))
      .get()
      .then((snapshot) =>
          snapshot.docs.map((doc) => LIB_BOOK.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LIB_BOOK>>(
        future: queryString(widget.queryData),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final books = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: getList(books),
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            );
          } else {
            return const Center(
              child: Text('데이터가 존재하지 않습니다!'),
            );
          }
        });
    // SingleChildScrollView(child: Expanded(child: result()));
  }
}
