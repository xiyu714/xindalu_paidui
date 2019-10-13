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
    var response = await dio.get("http://api.nlecloud.com/devices/44443/sensors/number_up");
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
    var response = await dio.get("http://api.nlecloud.com/devices/44443/datas?apitags=number_up", queryParameters: {
      "Method": 1,
      "TimeAgo": 60,  // 想设为5分钟，为了方便调试先设为60
    });
    return Paidui_history.fromJson(response.data);
  }

  factory Paidui_history.fromJson(Map<String, dynamic> json) => _$Paidui_historyFromJson(json);
  Map<String, dynamic> toJson() => _$Paidui_historyToJson(this);
}

/* 当历史数据只有两条时
{
  ResultObj: {
    PageCount: 1,
    PageIndex: 1,
    RecordCount: 2,
    Count: 2,
    DeviceId: 44443,
    DataPoints: [
      {
        ApiTag: number_down,
        PointDTO: [
          {
            Value: 7,
            RecordTime: 2019-10-1121: 48: 50
          },
          {
            Value: 8,
            RecordTime: 2019-10-1121: 48: 45
          }
        ]
      }
    ]
  },
  Status: 0,
  StatusCode: 0,
  Msg: null,
  ErrorObj: null
}
 */
/* 当没有数据时
{
  ResultObj: {
    PageCount: 1,
    PageIndex: 1,
    RecordCount: 0,
    Count: 0,
    DeviceId: 44443,
    DataPoints: null
  },
  Status: 0,
  StatusCode: 0,
  Msg: null,
  ErrorObj: null
}
 */

@JsonSerializable()
class _ResultObj_history {
  _ResultObj_history();
  @JsonKey(
    name: "DataPoints",
    fromJson: _PointDTOFromJson,
  )
  List<_PointDTO> PointDTO;  // 对应ResultObj -> DataPoints -> 第一个对象 -> PointDTO

  factory _ResultObj_history.fromJson(Map<String, dynamic> json) => _$_ResultObj_historyFromJson(json);
  Map<String, dynamic> toJson() => _$_ResultObj_historyToJson(this);

  static List<_PointDTO> _PointDTOFromJson(json) {
    return (json[0]["PointDTO"] as List)
        .map((e) => _PointDTO.fromJson(e as Map<String, dynamic>))
        .toList();
    //print("get: ${json[0]["PointDTO"]}");
  }
}

@JsonSerializable()
class _PointDTO {
  int Value;
  String RecordTime;

  _PointDTO();
  factory _PointDTO.fromJson(Map<String, dynamic> json) => _$_PointDTOFromJson(json);
  Map<String, dynamic> toJson() => _$_PointDTOToJson(this);
}