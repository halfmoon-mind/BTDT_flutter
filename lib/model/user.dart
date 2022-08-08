import 'package:cloud_firestore/cloud_firestore.dart';

class USER {
  late String? uid;
  late String? email;
  late String? id;
  late String? bank_loc;
  late String? bank_data;
  late String? name;
  late String? phone;
  late List? lend;

  USER({
    this.uid,
    this.email,
    this.id,
    this.bank_loc,
    this.bank_data,
    this.name,
    this.phone,
    this.lend,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'id': id,
      'bank_loc': bank_loc,
      'bank_data': bank_data,
      'name': name,
      'phone': phone,
      'lend': lend,
    };
  }

  static USER fromJson(Map<String, dynamic> json) => USER(
        uid: json['uid'],
        email: json['email'],
        id: json['id'],
        bank_loc: json['bank_loc'],
        bank_data: json['bank_data'],
        name: json['name'],
        phone: json['phone'],
        lend: json['lend'],
      );
}
