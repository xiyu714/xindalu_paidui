import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 自动登录，页面跳转
Future<Widget> login() async {
  return login();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String name = prefs.get("user_name");
  String password = prefs.get("user_password");
  if (name?.isEmpty) {
    // 没有保存密码
  } else {
    // 对保存的密码进行验证
    return Login();
  }
}

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: Scaffold(
          body: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 100, bottom: 10),
              child: Text(
                'XIYU',
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53), fontSize: 50.0),
              ),
            ),
          ]
          )
      ),
    );
  }
}
