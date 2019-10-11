import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:paidui_xitong/global.dart';
part 'paidui.g.dart';

@JsonSerializable()
class Paidui {


  static post() async {
    var dio = Dio(BaseOptions(
        headers: {
          "AccessToken": AccessToken,
        }
    ));
    var response = await dio.get("http://api.nlecloud.com/devices/44443/sensors/number_down");
    print(response);
  }
}