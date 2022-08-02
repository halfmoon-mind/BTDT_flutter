import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String? BOOK_ID;
  late String? END;
  late String? START;
  late String? UID;

  User({
    this.UID,
    this.START,
    this.END,
    this.BOOK_ID,
  });

  Map<String, dynamic> toJson() {
    return {
      'UID': UID,
      'START': START,
      'END': END,
      'BOOK_ID': BOOK_ID,
    };
  }

  static User fromJson(Map<String, dynamic> json) => User(
        UID: json['UID'],
        START: json['START'],
        END: json['END'],
        BOOK_ID: json['BOOK_ID'],
      );
}
