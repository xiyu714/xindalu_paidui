import 'package:paidui_xitong/global.dart';
import 'package:paidui_xitong/model/login.dart';

util_login() async {
  // 这个测试透露了账户，不安全，如果要开源，要删除
  var user = User("19918208693", "199nanshou");
  var login = await user.post();
  AccessToken = login.ResultObj.AccessToken;
}
