import 'package:cloud_firestore/cloud_firestore.dart';

class LEND_BOOK {
  late String? BIBLIO;
  late String? LEND_CNT;
  late String? LOC;
  late String? NUM;
  late String? PUBLISHER;
  late String? TITLE;
  late String? WRITER;
  late String? URL;
  late String? LEND_USER;
  late String? START;
  late String? END;
  late int? PRICE;

  LEND_BOOK({
    this.BIBLIO,
    this.LEND_CNT,
    this.LOC,
    this.NUM,
    this.PUBLISHER,
    this.TITLE,
    this.WRITER,
    this.URL,
    this.LEND_USER,
    this.START,
    this.END,
    this.PRICE,
  });

  Map<String, dynamic> toJson() {
    return {
      'BIBLO': BIBLIO,
      'LEND_CNT': LEND_CNT,
      'LOC': LOC,
      'NUM': NUM,
      'PUBLISHER': PUBLISHER,
      'TITLE': TITLE,
      'WRITER': WRITER,
      'URL': URL,
      'LEND_USER': LEND_USER,
      'START': START,
      'END': END,
      'PRICE': PRICE,
    };
  }

  static LEND_BOOK fromJson(Map<String, dynamic> json) => LEND_BOOK(
        BIBLIO: json['BIBLIO'],
        LEND_CNT: json['LEND_CNT'],
        LOC: json['LOC'],
        NUM: json['NUM'],
        PUBLISHER: json['PUBLISHER'],
        TITLE: json['TITLE'],
        WRITER: json['WRITER'],
        URL: json['URL'],
        LEND_USER: json['LEND_USER'],
        START: json['START'],
        END: json['END'],
        PRICE: json['PRICE'],
      );
}
