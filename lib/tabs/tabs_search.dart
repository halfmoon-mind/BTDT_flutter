import 'package:flutter/material.dart';
import 'package:bookting/component/search_book.dart';

String queryData = '';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: DefaultTextStyle(
          style: const TextStyle(color: Colors.black, fontSize: 28),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.search,
                color: Colors.black54,
                size: 45,
              ),
              Text('Search'),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SearchBox(context),
          Text(queryData),
          // SearchResult(queryData: queryData),

          // FutureBuilder<List<LIB_BOOK>>(
          //     future: queryString(queryData),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return SingleChildScrollView(
          //             // child: Expanded(child: SearchBook(snapshot)),
          //             );
          //       } else {
          //         return const Text('데이터가 없어요...!');
          //       }
          //     }),
        ],
      ),
    );
  }
}

SearchBox(context) {
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: Row(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width - 20) * 0.85,
          height: 50,
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 10.0,
                  offset: const Offset(0, 10),
                )
              ]),
          child: TextField(
            onChanged: (value) {
              queryData = value;
            },
            decoration: const InputDecoration(
              labelText: '검색어를 입력하세요...',
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width - 20) * 0.15,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                primary: Colors.transparent,
                elevation: 0.0,
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              child: Icon(
                Icons.search_rounded,
                size: 50,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
