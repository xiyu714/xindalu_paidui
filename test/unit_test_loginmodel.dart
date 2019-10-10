import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:paidui_xitong/model/login.dart';
import 'package:paidui_xitong/model/user.dart' as test_user;
import 'dart:convert';

void main() {
  test('my first unit test', () {
    var answer = 42;
    expect(answer, 42);
    print("hello");
  });

  test("测试user，自动生成功能", () {
    String jsonStr='{"name":"Jack"}';
    Map user = json.decode(jsonStr);
    test_user.User data = test_user.User.fromJson(user);
    print("${data.name}, ${data.email}");
  });

  test("user post", () async {
    var user = User("xx", "xx");
    var login = await user.post();
    expect(login.toJson().toString(), "{Status: 1, StatusCode: 0, Msg: 您的帐号不存在，请查证后再次尝试登录！, ErrorObj: null, ResultObj: null}");
  });


}