// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cmd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cmd _$CmdFromJson(Map<String, dynamic> json) {
  return Cmd()
    ..Status = json['Status'] as int
    ..StatusCode = json['StatusCode'] as int
    ..Msg = json['Msg'] as String
    ..ErrorObj = json['ErrorObj']
    ..ResultObj = json['ResultObj'] as String;
}

Map<String, dynamic> _$CmdToJson(Cmd instance) => <String, dynamic>{
      'Status': instance.Status,
      'StatusCode': instance.StatusCode,
      'Msg': instance.Msg,
      'ErrorObj': instance.ErrorObj,
      'ResultObj': instance.ResultObj
    };
