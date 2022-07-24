import 'package:flutter/material.dart';

class MapTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('맵화면입니다!'),
      ),
      body: Container(
        child: Center(
          child: Text('맵 화면'),
        ),
      ),
    );
  }
}
