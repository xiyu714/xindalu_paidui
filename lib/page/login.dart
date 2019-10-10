import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

// 自动登录，页面跳转
Future<Widget> login() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String name = prefs.get("user_name");
  String password = prefs.get("user_password");
  if(name?.isEmpty) {
    // 没有保存密码
  } else {
    // 对保存的密码进行验证
    
  }
}

