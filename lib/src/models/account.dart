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
    this.userId,
    this.bankId,
    this.createdAt,
    this.updatedAt,
    this.credentials,
    this.accountTypeId,
    this.extendedBank,
    this.accountType
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
  /// To access functionality such as [tokenPath], [balancePath] etc. You can
  /// use the [extendedBank] variable instead.
  Bank? bank;
  int? userId;
  int? bankId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic credentials;
  int? accountTypeId;
  AllAccountBank? extendedBank;
  AccountType? accountType;
  

  factory Account.fromJson(Map<String, dynamic>? json) => Account(
    id: json?["id"],
    accountNumber: json?["account_number"],
    accountName: json?["account_name"],
    aggregator: json?["aggregator"],
    bankCode: Bank.fromJson(json?["bank"]).code,
    bank: Bank.fromJson(json?["bank"]),
    userId: json?["user_id"],
    bankId: json?["bank_id"],
    createdAt: json?["created_at"] == null ? null : DateTime.parse(json?["created_at"]),
    updatedAt: json?["updated_at"] == null ? null : DateTime.parse(json?["updated_at"]),
    credentials: json?["credentials"],
    accountTypeId: json?["account_type_id"],
    extendedBank: json?["bank"] == null ? null : AllAccountBank.fromJson(json?["bank"]),
    accountType: json?["account_type"] == null ? null : AccountType.fromJson(json?["account_type"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "account_number": accountNumber,
    "account_name": accountName,
    "aggregator": aggregator,
    "bank_code": bankCode,
    "bank": bank?.toJson(),
    "user_id": userId,
    "bank_id": bankId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "credentials": credentials,
    "account_type_id": accountTypeId,
    "extended_bank": extendedBank?.toJson(),
    "account_type": accountType?.toJson(),
  };
}
