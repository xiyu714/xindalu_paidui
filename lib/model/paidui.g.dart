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

Paidui_history _$Paidui_historyFromJson(Map<String, dynamic> json) {
  return Paidui_history()
    ..Status = json['Status'] as int
    ..StatusCode = json['StatusCode'] as int
    ..Msg = json['Msg'] as String
    ..ErrorObj = json['ErrorObj']
    ..ResultObj = json['ResultObj'] == null
        ? null
        : _ResultObj_history.fromJson(
            json['ResultObj'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Paidui_historyToJson(Paidui_history instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'StatusCode': instance.StatusCode,
      'Msg': instance.Msg,
      'ErrorObj': instance.ErrorObj,
      'ResultObj': instance.ResultObj
    };

_ResultObj_history _$_ResultObj_historyFromJson(Map<String, dynamic> json) {
  return _ResultObj_history()
    ..PointDTO = json['DataPoints'] == null
        ? null
        : _ResultObj_history._PointDTOFromJson(json['DataPoints']);
}

Map<String, dynamic> _$_ResultObj_historyToJson(_ResultObj_history instance) =>
    <String, dynamic>{'DataPoints': instance.PointDTO};

_PointDTO _$_PointDTOFromJson(Map<String, dynamic> json) {
  return _PointDTO()
    ..Value = json['Value'] as int
    ..RecordTime = json['RecordTime'] as String;
}

Map<String, dynamic> _$_PointDTOToJson(_PointDTO instance) => <String, dynamic>{
      'Value': instance.Value,
      'RecordTime': instance.RecordTime
    };
