import '../../moneta_core_banking.dart';

class Account {
  Account({
    required this.id,
    required this.accountNumber,
    required this.accountName,
    required this.aggregator,
    @Deprecated("Bank Code has been discontinued, use [bank.code] instead to "
        "access the Bank Code")
    required this.bankCode,
    required this.bank,
  }){
    /// Prefer the bank.code
    bankCode = bank?.code;
  }

  int? id;
  String? accountNumber;
  String? accountName;
  int? aggregator;
  @Deprecated("Bank Code has been discontinued, use [bank.code] instead to "
      "access the Bank Code")
  String? bankCode;
  Bank? bank;

  factory Account.fromJson(Map<String, dynamic>? json) => Account(
    id: json?["id"],
    accountNumber: json?["account_number"],
    accountName: json?["account_name"],
    aggregator: json?["aggregator"],
    bankCode: Bank.fromJson(json?["bank"]).code,
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
