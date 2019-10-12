// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Online _$OnlineFromJson(Map<String, dynamic> json) {
  return Online()
    ..Status = json['Status'] as int
    ..StatusCode = json['StatusCode'] as int
    ..Msg = json['Msg'] as String
    ..ErrorObj = json['ErrorObj']
    ..ResultObj = json['ResultObj'];
}

Map<String, dynamic> _$OnlineToJson(Online instance) => <String, dynamic>{
      'Status': instance.Status,
      'StatusCode': instance.StatusCode,
      'Msg': instance.Msg,
      'ErrorObj': instance.ErrorObj,
      'ResultObj': instance.ResultObj
    };
