import 'package:flutter_test/flutter_test.dart';
import 'package:paidui_xitong/model/login.dart';
import 'dart:convert';
import 'package:paidui_xitong/model/paidui.dart';
import 'package:paidui_xitong/global.dart';

void main() {
  test("排队post", () async {
    // 这个测试透露了账户，不安全，如果要开源，要删除
    var user = User("19918208693", "199nanshou");
    var login = await user.post();
    AccessToken = login.ResultObj.AccessToken;

    var paidui = await Paidui.post();
    expect(paidui.Status, 0);
  });
}