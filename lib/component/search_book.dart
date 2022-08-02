import 'package:flutter/material.dart';

SearchBook(List<Map<String, String>> data) {
  List<Widget> BookList = [];
  if (data.length == 0) {
    BookList.add(Container(child: Text('찾은 데이터가 없습니다!')));
  } else {
    for (int i = 0; i < data.length; i++) {
      BookList.add(
        Container(
          color: Colors.black12,
          height: 100,
          margin: EdgeInsets.all(1),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Image.network(data[i]['url'].toString()),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data[i]['title'].toString(),
                      style: TextStyle(fontSize: 20)),
                  Text(data[i]['writer'].toString(),
                      style: TextStyle(fontSize: 14)),
                  Text('ISBN : ' + data[i]['isbn'].toString(),
                      style: TextStyle(fontSize: 14)),
                ],
              )
            ],
          ),
        ),
      );
    }
  }

  return BookList;
}
