import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('즐겨찾기 화면입니다!'),
      ),
      body: Container(
        child: Center(
          child: Text('즐겨찾기 화면'),
        ),
      ),
    );
  }
}
