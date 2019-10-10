import 'package:flutter/material.dart';
import 'package:paidui_xitong/page/login.dart';

void main() async {
  runApp(
    MaterialApp(
      home: await login(),
    )
  );
}