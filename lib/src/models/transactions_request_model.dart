class TransactionsRequestModel {
  String? accountNumber;
  String? fromDate;
  String? toDate;
  String? pageSize;
  String? pageNumber;

  TransactionsRequestModel({
    this.accountNumber,
    this.fromDate,
    this.toDate,
    this.pageSize,
    this.pageNumber,
  });

  factory TransactionsRequestModel.fromJson(Map<String, dynamic> json) =>
      TransactionsRequestModel(
        accountNumber: json["account_number"],
        fromDate: json["from_date"],
        toDate: json["to_date"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
      );

  Map<String, dynamic> toJson() => {
    "account_number": accountNumber,
    "from_date": fromDate,
    "to_date": toDate,
    "pageSize": pageSize,
    "pageNumber": pageNumber,
  };
}

class TransactionsRequestModelV2 {
  String? fromDate;
  String? toDate;
  String? pageSize;
  String? pageNumber;

  TransactionsRequestModelV2({
    this.fromDate,
    this.toDate,
    this.pageSize,
    this.pageNumber,
  });

  factory TransactionsRequestModelV2.fromJson(Map<String, dynamic> json) =>
      TransactionsRequestModelV2(
        fromDate: json["from_date"],
        toDate: json["to_date"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
      );

  Map<String, dynamic> toJson() => {
    "from_date": fromDate,
    "to_date": toDate,
    "pageSize": pageSize,
    "pageNumber": pageNumber,
  };
}
