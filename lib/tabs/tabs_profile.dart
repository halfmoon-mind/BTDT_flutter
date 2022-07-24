import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필 화면입니다!'),
      ),
      body: Container(
        child: Center(
          child: Text('프로필 화면'),
        ),
      ),
    );
  }
}
