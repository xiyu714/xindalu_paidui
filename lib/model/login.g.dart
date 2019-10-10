// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login()
    ..Status = json['Status'] as int
    ..StatusCode = json['StatusCode'] as int
    ..Msg = json['Msg'] as String
    ..ErrorObj = json['ErrorObj']
    ..ResultObj = json['ResultObj'] == null
        ? null
        : _ResultObj.fromJson(json['ResultObj'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'Status': instance.Status,
      'StatusCode': instance.StatusCode,
      'Msg': instance.Msg,
      'ErrorObj': instance.ErrorObj,
      'ResultObj': instance.ResultObj
    };

_ResultObj _$_ResultObjFromJson(Map<String, dynamic> json) {
  return _ResultObj()
    ..UserID = json['UserID'] as int
    ..AccessToken = json['AccessToken'] as String;
}

Map<String, dynamic> _$_ResultObjToJson(_ResultObj instance) =>
    <String, dynamic>{
      'UserID': instance.UserID,
      'AccessToken': instance.AccessToken
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['Account'] as String, json['Password'] as String,
      IsRememberMe: json['IsRememberMe'] as bool);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Account': instance.Account,
      'Password': instance.Password,
      'IsRememberMe': instance.IsRememberMe
    };
