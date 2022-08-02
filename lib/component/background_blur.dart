import 'package:flutter/material.dart';

background() {
  return BoxDecoration(
    image: DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
        image: AssetImage('assets/Login.jpg'),
        fit: BoxFit.cover),
  );
}
