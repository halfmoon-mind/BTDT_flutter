import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('찾기 화면입니다!'),
      ),
      body: Container(
        child: Center(
          child: Text('찾기 화면'),
        ),
      ),
    );
  }
}
