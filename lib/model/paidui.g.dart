// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paidui.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paidui _$PaiduiFromJson(Map<String, dynamic> json) {
  return Paidui()
    ..Status = json['Status'] as int
    ..StatusCode = json['StatusCode'] as int
    ..Msg = json['Msg'] as String
    ..ErrorObj = json['ErrorObj']
    ..ResultObj = json['ResultObj'] == null
        ? null
        : _ResultObj.fromJson(json['ResultObj'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PaiduiToJson(Paidui instance) => <String, dynamic>{
      'Status': instance.Status,
      'StatusCode': instance.StatusCode,
      'Msg': instance.Msg,
      'ErrorObj': instance.ErrorObj,
      'ResultObj': instance.ResultObj
    };

_ResultObj _$_ResultObjFromJson(Map<String, dynamic> json) {
  return _ResultObj()..Value = json['Value'] as int;
}

Map<String, dynamic> _$_ResultObjToJson(_ResultObj instance) =>
    <String, dynamic>{'Value': instance.Value};
