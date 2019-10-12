import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:paidui_xitong/global.dart';
import 'package:paidui_xitong/model/common.dart';
part 'cmd.g.dart';

// 做为更为通用的发送数据
@JsonSerializable()
class Cmd with Common_response {
  Cmd();

  static Future<Cmd> post(int deviceId, String _apiTag, var data) async {
    var dio = Dio(BaseOptions(
        headers: {
          "AccessToken": AccessToken,
        }
    ));
    var response = await dio.post("http://api.nlecloud.com/Cmds", queryParameters: {
      "deviceId": deviceId,
      "apiTag": _apiTag,  // 想设为5分钟，为了方便调试先设为60
    },
        data: data);
    return Cmd.fromJson(response.data);
  }

  factory Cmd.fromJson(Map<String, dynamic> json) => _$CmdFromJson(json);
  Map<String, dynamic> toJson() => _$CmdToJson(this);
}