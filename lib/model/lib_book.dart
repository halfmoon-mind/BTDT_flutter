import 'package:cloud_firestore/cloud_firestore.dart';

class LIB_BOOK {
  late String? BIBLIO;
  late String? LOC;
  late String? NUM;
  late String? PUBLISHER;
  late String? TITLE;
  late String? WRITER;
  late String? URL;

  LIB_BOOK({
    this.BIBLIO,
    this.LOC,
    this.NUM,
    this.PUBLISHER,
    this.TITLE,
    this.WRITER,
    this.URL,
  });

  Map<String, dynamic> toJson() {
    return {
      'BIBLO': BIBLIO,
      'LOC': LOC,
      'NUM': NUM,
      'PUBLISHER': PUBLISHER,
      'TITLE': TITLE,
      'WRITER': WRITER,
      'URL': URL,
    };
  }

  static LIB_BOOK fromJson(Map<String, dynamic> json) => LIB_BOOK(
        BIBLIO: json['BIBLIO'],
        LOC: json['LOC'],
        NUM: json['NUM'],
        PUBLISHER: json['PUBLISHER'],
        TITLE: json['TITLE'],
        WRITER: json['WRITER'],
        URL: json['URL'],
      );
}
