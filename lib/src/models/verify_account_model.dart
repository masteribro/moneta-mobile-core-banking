// To parse this JSON data, do
//
//     final verifyAccountModel = verifyAccountModelFromJson(jsonString);

import 'dart:convert';

VerifyAccountModel verifyAccountModelFromJson(String str) => VerifyAccountModel.fromJson(json.decode(str));

String verifyAccountModelToJson(VerifyAccountModel data) => json.encode(data.toJson());

class VerifyAccountModel {
  int? userId;
  String? accountNumber;
  int? bankId;
  String? accountName;
  bool? aggregator;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  VerifyAccountModel({
    this.userId,
    this.accountNumber,
    this.bankId,
    this.accountName,
    this.aggregator,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory VerifyAccountModel.fromJson(Map<String, dynamic> json) => VerifyAccountModel(
    userId: json["user_id"],
    accountNumber: json["account_number"],
    bankId: json["bank_id"],
    accountName: json["account_name"],
    aggregator: json["aggregator"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "account_number": accountNumber,
    "bank_id": bankId,
    "account_name": accountName,
    "aggregator": aggregator,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
