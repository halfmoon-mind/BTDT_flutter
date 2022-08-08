import 'package:bookting/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookting/model/lib_book.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key, required this.queryData, required this.valid})
      : super(key: key);
  final String queryData;
  final valid;
  @override
  _SearchResult createState() => _SearchResult();
}

class _SearchResult extends State<SearchResult> {
  Future<List<LIB_BOOK>> queryString(String queryData) => FirebaseFirestore
      .instance
      .collection('lib_book')
      .where('TITLE', isGreaterThanOrEqualTo: queryData)
      .where('TITLE', isLessThanOrEqualTo: '$queryData\uf8ff')
      .get()
      .then((snapshot) =>
          snapshot.docs.map((doc) => LIB_BOOK.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    getList(List<LIB_BOOK> lib_book) {
      List<Widget> BookList = [];
      double MEDIAWIDTH = MediaQuery.of(context).size.width;
      for (int i = 0; i < lib_book.length || i == 100; i++) {
        BookList.add(InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => DetailScreen(lib_book[i]))));
          },
          child: Container(
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
                      lib_book[i].URL!,
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
                        lib_book[i].TITLE!,
                        style: const TextStyle(
                            fontSize: 25, overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        lib_book[i].WRITER!,
                        style: const TextStyle(fontSize: 18),
                        softWrap: false,
                      ),
                      Text(
                        'PUBLISHER | ${lib_book[i].PUBLISHER!}',
                        style: const TextStyle(fontSize: 15),
                        softWrap: false,
                      ),
                      Text(
                        '위치 | ${lib_book[i].LOC!}',
                        style: const TextStyle(fontSize: 15),
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
        BookList.add(
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
        );
      }
      return BookList;
    }

    if (widget.valid == false) {
      return const Center(
          child: Text(
        '검색어를 입력해주세요!',
        style: TextStyle(fontSize: 20),
      ));
    } else {
      return SizedBox(
        child: FutureBuilder<List<LIB_BOOK>>(
            future: queryString(widget.queryData),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final books = snapshot.data!;
                return Column(
                  children: getList(books),
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                );
              } else {
                return const Center(
                  child: Text('데이터가 존재하지 않습니다!'),
                );
              }
            }),
      );
    }
  }
}
