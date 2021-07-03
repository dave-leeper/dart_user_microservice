import 'package:json_annotation/json_annotation.dart';

// pub run build_runner build
part 'account.g.dart';

@JsonSerializable()
class Account {
  String userName;
  String password;
  String email;
  List<String> groups;
  DateTime transactionDate = DateTime.now();

  Account(
    this.userName, 
    this.password,
    this.email,
    this.groups,
    this.transactionDate,
  );

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}