import 'package:paidui_xitong/global.dart';
import 'package:paidui_xitong/model/login.dart';

util_login() async {
  // 这个测试透露了账户，不安全，如果要开源，要删除
  var user = User(字符串_账号, 字符串_密码);
  var login = await user.post();
  AccessToken = login.ResultObj.AccessToken;
}
