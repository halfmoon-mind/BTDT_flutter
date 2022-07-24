import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

String email = "";
String password = "";
String name = "";
String id = "";
String phone = "";
String bank_loc = "우리은행";
String bank_data = "";
String password_check = "";

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원 가입'),
      ),
      body: ListView(
        children: [
          EmailInput(),
          NameInput(),
          IdInput(),
          PhoneInput(),
          BankLocInput(),
          BankInput(),
          PasswordInput(),
          PasswordCheckInput(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(thickness: 1),
          ),
          RegisterButton(),
          Padding(padding: EdgeInsets.all(5)),
        ],
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: TextField(
        onChanged: (value) {
          email = value.toString().trim();
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: '이메일',
          helperText: '',
        ),
      ),
    );
  }
}

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: TextField(
        onChanged: (value) {
          name = value;
        },
        decoration: InputDecoration(
          labelText: '이름',
          helperText: '',
        ),
      ),
    );
  }
}

class IdInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: TextField(
        onChanged: (value) {
          id = value;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: '학번 입력',
          helperText: '',
        ),
      ),
    );
  }
}

class BankLocInput extends StatefulWidget {
  _BankLocInput createState() => _BankLocInput();
}

class _BankLocInput extends State<BankLocInput> {
  final _valueList = ['우리은행', '카카오뱅크', '신한은행'];
  var _selectValue = '우리은행';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      width: MediaQuery.of(context).size.width,
      child: DropdownButton(
        isExpanded: true,
        value: _selectValue,
        items: _valueList.map(
          (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
        onChanged: (value) {
          setState(() {
            _selectValue = value.toString();
            bank_loc = _selectValue;
          });
        },
      ),
    );
  }
}

class BankInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: TextField(
        onChanged: (value) {
          bank_data = value;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: '계좌 입력',
          helperText: '',
        ),
      ),
    );
  }
}

class PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: TextField(
        onChanged: (value) {
          phone = value;
        },
        decoration: InputDecoration(
          labelText: '전화번호',
          helperText: '',
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: TextField(
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: '비밀번호',
          helperText: '',
        ),
      ),
    );
  }
}

class PasswordCheckInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: TextField(
        onChanged: (value) {
          password_check = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: '비밀번호 확인',
          helperText: '',
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: () async {
        if (password != password_check ||
            email.isEmpty ||
            name.isEmpty ||
            id.isEmpty ||
            phone.isEmpty ||
            bank_data.isEmpty) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  title: Column(
                    children: <Widget>[
                      new Text("경고"),
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "비밀번호가 동일하지 않거나, 비어있는 입력칸이 있습니다!",
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: new Text("확인"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        } else {
          try {
            UserCredential userCredential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: email, password: password);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('회원가입이 완료되었습니다!'),
              ),
            );

            CollectionReference users =
                FirebaseFirestore.instance.collection('user');
            users.add(({
              'uid': userCredential.user!.uid,
              'email': email,
              'id': id,
              'bank_loc': bank_loc,
              'bank_data': bank_data,
              'name': name,
              'phone': phone,
            }));
            Navigator.of(context).pop();
            print('성공!');
          } on FirebaseAuthException catch (e) {
            print(e.code);
          }
        }
      },
      child: Text(
        '회원가입하기!',
        style: TextStyle(color: theme.primaryColor),
      ),
    );
  }
}
