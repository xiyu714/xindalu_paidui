import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:paidui_xitong/global.dart';

import 'package:paidui_xitong/model/common.dart';

part 'online.g.dart';

@JsonSerializable()
class Online with Common_response {
  Online();

  static Future<Online> get(int deviceId) async {
    var dio = Dio(BaseOptions(
        headers: {
          "AccessToken": AccessToken,
        }
    ));
    var response = await dio.get("http://api.nlecloud.com/Devices/$deviceId");
    return Online.fromJson(response.data);
  }

  static Future<bool> isOnline(int deviceId) async {
    return (await Online.get(deviceId)).ResultObj["IsOnline"];
  }

  factory Online.fromJson(Map<String, dynamic> json) => _$OnlineFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineToJson(this);
}