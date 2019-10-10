import 'package:paidui_xitong/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:paidui_xitong/model/login.dart' as model_login;
import 'home.dart';
import 'package:provider/provider.dart';

// 自动登录，页面跳转
Future<Widget> login() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String name = prefs.get("user_name");
  String password = prefs.get("user_password");
  if (name == null || name.isEmpty) {
    // 没有保存密码
    return Login();
  } else {
    // 对保存的密码进行验证
    // 验证
    var user = model_login.User(name, password);
    model_login.Login response = await user.post();
    if(response.Status == 0) {
      print("自动登录成功");
      return Home();
    } else {
      print(response.Msg);
      return Login();
    }

    return Login();
  }
}

class Login extends StatefulWidget {
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  //获取Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
  String userName;
  String password;
  bool isShowPassWord = false;

  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  void login() async {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;
    //验证Form表单
    if(loginForm.validate()){
      // 保存表单的数据
      loginForm.save();
      // 验证
      var user = model_login.User(this.userName, this.password);
      model_login.Login response = await user.post();
      if(response.Status == 0) {
        // 保存密码
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("user_name", userName);
        prefs.setString("user_password", password);
        AccessToken = response.ResultObj.AccessToken;
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return Home();
            }
        ));
      } else {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("登录错误"),
              content: Text(response.Msg),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            );
          }
        );
        print(response.Msg);
      }
    }
  }

  Widget build(BuildContext context) {
    debugPrint("Login build");
    return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 100, bottom: 10),
              child: Text(
                'XIYU',
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontSize: 50.0
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: loginKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Container(
                      // 设置一个下划线作为分隔
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  width: 1.0
                              )
                          )
                      ),
                      child: new TextFormField(
                        decoration: InputDecoration(
                            labelText: '请输入账号',
                            border: InputBorder.none,
                            icon: Icon(Icons.person)
                        ),
                        onSaved: (value) {
                          userName = value;
                        },
                        validator: (value) {

                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  width: 1.0
                              )
                          )
                      ),
                      child: new TextFormField(
                        decoration: InputDecoration(
                            labelText: '请输入密码',
                            border: InputBorder.none,
                            icon: Icon(Icons.lock),
                            suffixIcon: new IconButton(
                              icon: new Icon(
                                isShowPassWord ? Icons.visibility : Icons.visibility_off,
                                color: Color.fromARGB(255, 126, 126, 126),
                              ),
                              onPressed: showPassWord,
                            )
                        ),
                        onSaved: (value) {
                          password = value;
                        },
                        validator: (value) {

                        },
                        obscureText: !isShowPassWord,
                      ),
                    ),
                    new Container(
                      height: 45.0,
                      margin: EdgeInsets.only(top: 40.0),
                      child: new SizedBox.expand(
                        child: new RaisedButton(
                          onPressed: login,
                          color: Color.fromARGB(255, 61, 203, 128),
                          child: new Text(
                            '登录',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 255, 255, 255)
                            ),
                          ),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(45.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}