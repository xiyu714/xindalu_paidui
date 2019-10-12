import 'package:json_annotation/json_annotation.dart';

// 用于生成通用的字段
abstract class Common_response {
  int Status;
  int StatusCode;
  String Msg;
  var ErrorObj;
  var ResultObj;  // 这里设为var，因为比如在命令api中，它是String类型
}