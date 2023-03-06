import 'dart:convert';

import '../../moneta_core_banking.dart';

Transaction transactionFromJson(String str) => Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
  Transaction({
    required this.bank,
    required this.accountName,
    required this.transactionType,
    required this.transactionAmount,
    required this.transactionTime,
    required this.transactionState,
    required this.source,
  });

  Bank bank;
  String accountName;
  String transactionType;
  String transactionAmount;
  String transactionTime;
  String transactionState;
  String source;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    bank: Bank.fromJson(json["bank"]),
    accountName: json["accountName"],
    transactionType: json["transactionType"],
    transactionAmount: json["transactionAmount"],
    transactionTime: json["transactionTime"],
    transactionState: json["transactionState"],
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "bank": bank.toJson(),
    "accountName": accountName,
    "transactionType": transactionType,
    "transactionAmount": transactionAmount,
    "transactionTime": transactionTime,
    "transactionState": transactionState,
    "source": source,
  };
}
