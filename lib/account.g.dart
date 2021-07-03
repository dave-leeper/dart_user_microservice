// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    json['userName'] as String,
    json['password'] as String,
    json['email'] as String,
    (json['groups'] as List<dynamic>).map((e) => e as String).toList(),
    DateTime.parse(json['transactionDate'] as String),
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'groups': instance.groups,
      'transactionDate': instance.transactionDate.toIso8601String(),
    };
