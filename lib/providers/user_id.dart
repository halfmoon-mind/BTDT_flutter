import 'package:flutter/material.dart';

class UserId with ChangeNotifier {
  String _user = '';
  String get user => _user;

  void changeUser(String user) {
    _user = user;
    notifyListeners();
  }

  void signOutUser(String user) {
    _user = '';
    notifyListeners();
  }
}
