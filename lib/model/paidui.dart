import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:paidui_xitong/global.dart';
part 'paidui.g.dart';

@JsonSerializable()
class Paidui {
  int Status;
  int StatusCode;
  String Msg;
  var ErrorObj;
  _ResultObj ResultObj;

  Paidui();

  static Future<Paidui> post() async {
    var dio = Dio(BaseOptions(
        headers: {
          "AccessToken": AccessToken,
        }
    ));
    var response = await dio.get("http://api.nlecloud.com/devices/44443/sensors/number_down");
    //print(response);
    return Paidui.fromJson(response.data);
  }

  factory Paidui.fromJson(Map<String, dynamic> json) => _$PaiduiFromJson(json);
  Map<String, dynamic> toJson() => _$PaiduiToJson(this);
}

@JsonSerializable()
class _ResultObj {
  _ResultObj();
  int Value;

  factory _ResultObj.fromJson(Map<String, dynamic> json) => _$_ResultObjFromJson(json);
  Map<String, dynamic> toJson() => _$_ResultObjToJson(this);
}