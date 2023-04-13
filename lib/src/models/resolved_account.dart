class ResolvedAccount {
  ResolvedAccount({
    required this.accountNumber,
    required this.accountName,
  });

  String? accountNumber;
  String? accountName;

  factory ResolvedAccount.fromJson(Map<String, dynamic>? json) => ResolvedAccount(
    accountNumber: json?["account_number"],
    accountName: json?["account_name"],
  );

  Map<String, dynamic> toJson() => {
    "account_number": accountNumber,
    "account_name": accountName,
  };
}
