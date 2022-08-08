import 'package:flutter/material.dart';
import 'package:bookting/component/search_book.dart';

String queryData = '';

class SearchTab extends StatefulWidget {
  @override
  _SearchTab createState() => _SearchTab();
}

class _SearchTab extends State<SearchTab> {
  late bool SearchValid;
  @override
  void initState() {
    super.initState();
    SearchValid = false;
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
          SizedBox(
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
                  setState(() {
                    if (queryData.trim() == '') {
                      SearchValid = false;
                    } else {
                      SearchValid = true;
                    }
                  });
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

  @override
  Widget build(BuildContext context) {
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBox(context),
              SizedBox(
                child: SearchResult(queryData: queryData, valid: SearchValid),
                // height: MediaQuery.of(context).size.height * 0.65,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
