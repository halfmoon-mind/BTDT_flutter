import 'package:flutter/material.dart';

class MapTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: DefaultTextStyle(
          style: TextStyle(color: Colors.black, fontSize: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('   '),
              Icon(
                Icons.map,
                color: Colors.black54,
                size: 45,
              ),
              Text('지도'),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/map.png',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const Text(
                '단과대 도서위치',
                style: TextStyle(fontSize: 30),
              ),
              const Divider(
                height: 10,
                thickness: 1,
                color: Colors.grey,
              ),
              const Text('A: 인문/경상대학', style: TextStyle(fontSize: 20)),
              const Text('B: 자연대학', style: TextStyle(fontSize: 20)),
              const Text('C: 공과대학', style: TextStyle(fontSize: 20)),
              const Text('D: IT대학', style: TextStyle(fontSize: 20)),
              const Text('E: 융합특성화자유전공학부', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
