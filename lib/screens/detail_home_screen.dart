import 'package:flutter/material.dart';
import 'package:bookting/model/lend_book.dart';

const double textWidth = 140;

class DetailScreen extends StatelessWidget {
  DetailScreen(this.data);
  final LEND_BOOK data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '검색 결과',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black12,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 300,
                width: 200,
                margin: const EdgeInsets.all(10),
                child: Image.network(data.URL!, height: 300, width: 200),
              ),
            ),
            Text(
              data.TITLE!,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  '${data.WRITER}',
                  style: const TextStyle(fontSize: 18),
                ),
                const Text(
                  ' (지은이)',
                  style: TextStyle(fontSize: 18, color: Colors.black38),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '${data.PUBLISHER}',
                  style: const TextStyle(fontSize: 18),
                ),
                const Text(
                  ' (출판사)',
                  style: TextStyle(fontSize: 18, color: Colors.black38),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              children: [
                const SizedBox(
                  width: textWidth,
                  child: Text(
                    '해당 도서 대여 횟수',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  '${data.LEND_CNT}',
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: textWidth,
                  child: Text(
                    'BIBLO ID',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  data.BIBLIO!,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: textWidth,
                  child: Text(
                    '재고량',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  '${data.NUM}개 (서점)',
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: textWidth,
                  child: Text(
                    '대여 시작',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  '${data.START}',
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: textWidth,
                  child: Text(
                    '대여 종료',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  '${data.END}',
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: textWidth,
                  child: Text(
                    '위 치',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  '${data.LOC}',
                  style: const TextStyle(fontSize: 15),
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Image.asset('assets/map.png'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text(
                                  '확인',
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text(
                    '위치 보기',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
