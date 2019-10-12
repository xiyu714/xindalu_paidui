// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lock _$LockFromJson(Map<String, dynamic> json) {
  return Lock()
    ..Status = json['Status'] as int
    ..StatusCode = json['StatusCode'] as int
    ..Msg = json['Msg'] as String
    ..ErrorObj = json['ErrorObj']
    ..ResultObj = json['ResultObj'] as String;
}

Map<String, dynamic> _$LockToJson(Lock instance) => <String, dynamic>{
      'Status': instance.Status,
      'StatusCode': instance.StatusCode,
      'Msg': instance.Msg,
      'ErrorObj': instance.ErrorObj,
      'ResultObj': instance.ResultObj
    };
