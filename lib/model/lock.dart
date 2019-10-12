import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:paidui_xitong/global.dart';
part 'lock.g.dart';

@JsonSerializable()
class Lock {
  int Status;
  int StatusCode;
  String Msg;
  var ErrorObj;
  String ResultObj;
  Lock();

  static Future<Lock> post() async {
    var dio = Dio(BaseOptions(
        headers: {
          "AccessToken": AccessToken,
        }
    ));
    var response = await dio.post("http://api.nlecloud.com/Cmds", queryParameters: {
      "deviceId": 44443,
      "apiTag": "lock_up",  // 想设为5分钟，为了方便调试先设为60
    });
    return Lock.fromJson(response.data);
  }

  factory Lock.fromJson(Map<String, dynamic> json) => _$LockFromJson(json);
  Map<String, dynamic> toJson() => _$LockToJson(this);
}