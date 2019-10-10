import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

part 'login.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()

class Login{
  Login();
  int Status;
  int StatusCode;
  String Msg;
  var ErrorObj;
  _ResultObj ResultObj;
  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

@JsonSerializable()
class _ResultObj {
  _ResultObj();
  int UserID;
  String AccessToken;

  factory _ResultObj.fromJson(Map<String, dynamic> json) => _$_ResultObjFromJson(json);
  Map<String, dynamic> toJson() => _$_ResultObjToJson(this);
}

@JsonSerializable()
class User {
  String Account;
  String Password;
  bool IsRememberMe;

  User(this.Account, this.Password, {this.IsRememberMe = true});

  Future<Login> post() async {
    var dio = Dio();
    var response = await dio.post("http://api.nlecloud.com/Users/Login", data: this.toJson());
    // 当不能连接时，或者不能正常得到返回时，会抛出异常
    return Login.fromJson(response.data);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}