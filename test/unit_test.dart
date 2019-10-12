import 'package:flutter_test/flutter_test.dart';
import 'package:paidui_xitong/model/cmd.dart';
import 'utils.dart';

import 'package:paidui_xitong/model/lock.dart';
import 'package:paidui_xitong/model/online.dart';
import 'dart:convert';

void main() {
  group("lock 相关", () {
    test("lock", () async {
      await util_login();

      var data = await Lock.post(2);
      print(jsonEncode(data));
    });
  });

  group("cmd 相关", () {
    test("lock", () async {
      await util_login();

      var data = await Cmd.post(44443, "lock", "黄nb");
      print(jsonEncode(data));
    });
  });

  group("online 相关", () {
    test("online", () async {
      await util_login();

      var data = await Online.get(44443);
      print(jsonEncode(data.ResultObj["IsOnline"]));
    });

    test("online是否在线上", () async {
      await util_login();

      var data = await Online.isOnline(44443);
      print(data);
    });
  });
}