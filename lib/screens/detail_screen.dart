import 'package:flutter/material.dart';
import 'package:bookting/model/lib_book.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.data);
  final LIB_BOOK data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Image.network('src'),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    data.TITLE!,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '${data.WRITER} (지은이)',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                  child: Text(
                    '재고량',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  '${data.NUM} 개',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                  child: Text(
                    '위 치',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  '${data.LOC}',
                  style: const TextStyle(fontSize: 20),
                ),
                TextButton(onPressed: () {}, child: const Text('위치 보기')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
