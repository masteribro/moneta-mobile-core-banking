import '../../moneta_core_banking.dart';

class Account {
  Account({
    required this.id,
    required this.accountNumber,
    required this.accountName,
    required this.aggregator,
    required this.bankCode,
    required this.bank,
  });

  int? id;
  String? accountNumber;
  String? accountName;
  int? aggregator;
  String? bankCode;
  Bank? bank;

  factory Account.fromJson(Map<String, dynamic>? json) => Account(
    id: json?["id"],
    accountNumber: json?["account_number"],
    accountName: json?["account_name"],
    aggregator: json?["aggregator"],
    bankCode: json?["bank_code"],
    bank: Bank.fromJson(json?["bank"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "account_number": accountNumber,
    "account_name": accountName,
    "aggregator": aggregator,
    "bank_code": bankCode,
    "bank": bank?.toJson(),
  };
}
