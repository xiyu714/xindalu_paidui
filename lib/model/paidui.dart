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

@JsonSerializable()
class Paidui_history {
  int Status;
  int StatusCode;
  String Msg;
  var ErrorObj;
  _ResultObj_history ResultObj;

  Paidui_history();

  static Future<Paidui_history> post() async {
    var dio = Dio(BaseOptions(
        headers: {
          "AccessToken": AccessToken,
        }
    ));
    var response = await dio.get("http://api.nlecloud.com/devices/44443/datas?apitags=number_down", queryParameters: {
      "Method": 1,
      "TimeAgo": 5,
    });
    //print(response);
    return Paidui_history.fromJson(response.data);
  }

  factory Paidui_history.fromJson(Map<String, dynamic> json) => _$Paidui_historyFromJson(json);
  Map<String, dynamic> toJson() => _$Paidui_historyToJson(this);
}

@JsonSerializable()
class _ResultObj_history {
  _ResultObj_history();

  factory _ResultObj_history.fromJson(Map<String, dynamic> json) => _$_ResultObj_historyFromJson(json);
  Map<String, dynamic> toJson() => _$_ResultObj_historyToJson(this);
}