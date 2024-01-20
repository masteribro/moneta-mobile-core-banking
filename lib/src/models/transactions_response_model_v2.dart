// To parse this JSON data, do
//
//     final transactionResponseModelV2 = transactionResponseModelV2FromJson(jsonString);

import 'dart:convert';

TransactionResponseModelV2 transactionResponseModelV2FromJson(String str) => TransactionResponseModelV2.fromJson(json.decode(str));

String transactionResponseModelV2ToJson(TransactionResponseModelV2 data) => json.encode(data.toJson());

class TransactionResponseModelV2 {
  final double? amount;
  final String? reference;
  final DateTime? date;
  final String? narration;
  final String? type;
  final Log? log;

  TransactionResponseModelV2({
    this.amount,
    this.reference,
    this.date,
    this.narration,
    this.type,
    this.log,
  });

  factory TransactionResponseModelV2.fromJson(Map<String, dynamic> json) => TransactionResponseModelV2(
    amount: json["amount"]?.toDouble(),
    reference: json["reference"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    narration: json["narration"],
    type: json["type"],
    log: json["log"] == null ? null : Log.fromJson(json["log"]),
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "reference": reference,
    "date": date?.toIso8601String(),
    "narration": narration,
    "type": type,
    "log": log?.toJson(),
  };
}

class Log {
  final int? id;
  final int? accountId;
  final String? reference;
  final String? transferType;
  final int? amount;
  final String? recipientAccountNumber;
  final String? recipientAccountName;
  final String? recipientBankCode;
  final String? recipientBankName;
  final Metadata? metadata;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Log({
    this.id,
    this.accountId,
    this.reference,
    this.transferType,
    this.amount,
    this.recipientAccountNumber,
    this.recipientAccountName,
    this.recipientBankCode,
    this.recipientBankName,
    this.metadata,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Log.fromJson(Map<String, dynamic> json) => Log(
    id: json["id"],
    accountId: json["account_id"],
    reference: json["reference"],
    transferType: json["transfer_type"],
    amount: json["amount"],
    recipientAccountNumber: json["recipient_account_number"],
    recipientAccountName: json["recipient_account_name"],
    recipientBankCode: json["recipient_bank_code"],
    recipientBankName: json["recipient_bank_name"],
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "account_id": accountId,
    "reference": reference,
    "transfer_type": transferType,
    "amount": amount,
    "recipient_account_number": recipientAccountNumber,
    "recipient_account_name": recipientAccountName,
    "recipient_bank_code": recipientBankCode,
    "recipient_bank_name": recipientBankName,
    "metadata": metadata?.toJson(),
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Metadata {
  final String? status;
  final String? statusDescription;
  final int? referenceId;
  final String? uniqueIdentifier;
  final bool? isSuccessFul;
  final String? responseMessage;
  final String? responseCode;
  final String? reference;
  final dynamic sessionId;
  final bool? requestStatus;
  final String? responseDescription;
  final String? responseStatus;

  Metadata({
    this.status,
    this.statusDescription,
    this.referenceId,
    this.uniqueIdentifier,
    this.isSuccessFul,
    this.responseMessage,
    this.responseCode,
    this.reference,
    this.sessionId,
    this.requestStatus,
    this.responseDescription,
    this.responseStatus,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    status: json["Status"],
    statusDescription: json["StatusDescription"],
    referenceId: json["ReferenceID"],
    uniqueIdentifier: json["UniqueIdentifier"],
    isSuccessFul: json["IsSuccessFul"],
    responseMessage: json["ResponseMessage"],
    responseCode: json["ResponseCode"],
    reference: json["Reference"],
    sessionId: json["SessionID"],
    requestStatus: json["RequestStatus"],
    responseDescription: json["ResponseDescription"],
    responseStatus: json["ResponseStatus"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "StatusDescription": statusDescription,
    "ReferenceID": referenceId,
    "UniqueIdentifier": uniqueIdentifier,
    "IsSuccessFul": isSuccessFul,
    "ResponseMessage": responseMessage,
    "ResponseCode": responseCode,
    "Reference": reference,
    "SessionID": sessionId,
    "RequestStatus": requestStatus,
    "ResponseDescription": responseDescription,
    "ResponseStatus": responseStatus,
  };
}
