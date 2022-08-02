import 'package:flutter/material.dart';
import '../component/search_book.dart';

String queryData = '';

class SearchTab extends StatefulWidget {
  @override
  _SearchTab createState() => _SearchTab();
}

class _SearchTab extends State<SearchTab> {
  final BOOKLIST = [
    {
      'title': '이해:인지의 패러다임',
      'writer': '월터 킨취',
      'isbn': '9788930084833',
      'url':
          'https://oasis.ssu.ac.kr/pyxis-api/attachments/biblio/65ec9dfe-11f0-2be9-e054-002128e7f09a'
    },
    {
      'title': '이해:인지의 패러다임',
      'writer': '월터 킨취',
      'isbn': '9788930084833',
      'url':
          'https://oasis.ssu.ac.kr/pyxis-api/attachments/biblio/65ec9dfe-11f0-2be9-e054-002128e7f09a'
    },
    {
      'title': '이해:인지의 패러다임',
      'writer': '월터 킨취',
      'isbn': '9788930084833',
      'url':
          'https://oasis.ssu.ac.kr/pyxis-api/attachments/biblio/65ec9dfe-11f0-2be9-e054-002128e7f09a'
    },
    {
      'title': '이해:인지의 패러다임',
      'writer': '월터 킨취',
      'isbn': '9788930084833',
      'url':
          'https://oasis.ssu.ac.kr/pyxis-api/attachments/biblio/65ec9dfe-11f0-2be9-e054-002128e7f09a'
    },
    {
      'title': '이해:인지의 패러다임',
      'writer': '월터 킨취',
      'isbn': '9788930084833',
      'url':
          'https://oasis.ssu.ac.kr/pyxis-api/attachments/biblio/65ec9dfe-11f0-2be9-e054-002128e7f09a'
    },
    {
      'title': '이해:인지의 패러다임',
      'writer': '월터 킨취',
      'isbn': '9788930084833',
      'url':
          'https://oasis.ssu.ac.kr/pyxis-api/attachments/biblio/65ec9dfe-11f0-2be9-e054-002128e7f09a'
    },
    {
      'title': '이해:인지의 패러다임',
      'writer': '월터 킨취',
      'isbn': '9788930084833',
      'url':
          'https://oasis.ssu.ac.kr/pyxis-api/attachments/biblio/65ec9dfe-11f0-2be9-e054-002128e7f09a'
    },
    {
      'title': '이해:인지의 패러다임',
      'writer': '월터 킨취',
      'isbn': '9788930084833',
      'url':
          'https://oasis.ssu.ac.kr/pyxis-api/attachments/biblio/65ec9dfe-11f0-2be9-e054-002128e7f09a'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: [
            SearchBox(context),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: SearchBook(BOOKLIST),
              ),
            )
          ],
        ),
      ),
    );
  }
}

SearchBox(context) {
  return Container(
    child: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: TextField(
            onChanged: (value) {
              queryData = value;
            },
            decoration: InputDecoration(
              labelText: 'Search',
              helperText: '',
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          // height: MediaQuery.of(context).size.width * 0.1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0.0,
            ),
            onPressed: () {},
            child: Image.asset(
              'assets/searchButton.png',
            ),
          ),
        )
      ],
    ),
  );
}
