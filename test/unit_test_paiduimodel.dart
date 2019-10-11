import 'package:flutter_test/flutter_test.dart';
import 'package:paidui_xitong/model/login.dart';
import 'dart:convert';
import 'package:paidui_xitong/model/paidui.dart';
import 'package:paidui_xitong/global.dart';

import 'utils.dart';

void main() {
  group("单条数据测试", () {
    test("排队post", () async {
      await util_login();

      var paidui = await Paidui.post();
      expect(paidui.Status, 0);
    });
  });
  group("历史数据测试", () {
    test("历史数据get", () async {
      await util_login();

     var history = await Paidui_history.post();
     print("history: ${jsonEncode(history.ResultObj.PointDTO)}");
    });
  });
}