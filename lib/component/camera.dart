import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UseCamera extends StatefulWidget {
  @override
  _UseCamera createState() => _UseCamera();
}

class _UseCamera extends State<UseCamera> {
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Future getImage(ImageSource imageSource) async {
      final pickedFile = await picker.pickImage(source: imageSource);

      setState(() {
        _image = File(pickedFile!.path);
      });
    }

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TextButton(
          onPressed: () {
            getImage(ImageSource.camera);
          },
          child: Text('Camera'),
        ),
        TextButton(
          onPressed: () {
            getImage(ImageSource.gallery);
          },
          child: Text('Gallery'),
        ),
        showImage(),
      ],
    )));
  }

  Widget showImage() {
    if (_image == null) {
      return Container();
    } else {
      return Image.file(_image!);
    }
  }
}
