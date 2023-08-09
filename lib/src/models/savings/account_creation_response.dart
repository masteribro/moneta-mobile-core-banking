class AccountCreationResponse {
  String? accountNumber;
  String? accountName;

  AccountCreationResponse({
    this.accountNumber,
    this.accountName,
  });

  factory AccountCreationResponse.fromJson(Map<String, dynamic> json) => AccountCreationResponse(
    accountNumber: json["account_number"],
    accountName: json["account_name"],
  );

  Map<String, dynamic> toJson() => {
    "account_number": accountNumber,
    "account_name": accountName,
  };
}
