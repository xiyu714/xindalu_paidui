import 'package:flutter_test/flutter_test.dart';
import 'utils.dart';

import 'package:paidui_xitong/model/lock.dart';
import 'dart:convert';

void main() {
  group("lock 相关", () {
    test("lock", () async {
      await util_login();

      var data = await Lock.post(2);
      print(jsonEncode(data));
    });
  });
}