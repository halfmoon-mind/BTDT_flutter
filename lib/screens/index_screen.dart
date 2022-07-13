import 'package:bookting/tabs/tabs_favorite.dart';
import 'package:flutter/material.dart';
import 'package:bookting/tabs/tabs_home.dart';
import 'package:bookting/tabs/tabs_map.dart';
import 'package:bookting/tabs/tabs_profile.dart';
import 'package:bookting/tabs/tabs_search.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    FavoriteTab(),
    SearchTab(),
    HomeTab(),
    MapTap(),
    ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 14),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '즐겨찾기'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '찾기'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: '지도'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
        ],
      ),
      body: _tabs[_currentIndex],
    );
  }
}
