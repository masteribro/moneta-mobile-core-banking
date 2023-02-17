class TransferResponse {
  String? responseCode;
  String? responseDescription;
  String? description;
  String? transactionReference;
  String? posted;
  String? transactionStatus;
  String? postingDate;
  String? postingReference;
  String? creditedAccount;

  TransferResponse(
      {this.responseCode,
      this.responseDescription,
      this.description,
      this.transactionReference,
      this.posted,
      this.transactionStatus,
      this.postingDate,
      this.postingReference,
      this.creditedAccount});

  TransferResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseDescription = json['responseDescription'];
    description = json['description'];
    transactionReference = json['transactionReference'];
    posted = json['posted'];
    transactionStatus = json['transactionStatus'];
    postingDate = json['postingDate'];
    postingReference = json['postingReference'];
    creditedAccount = json['creditedAccount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['responseCode'] = responseCode;
    data['responseDescription'] = responseDescription;
    data['description'] = description;
    data['transactionReference'] = transactionReference;
    data['posted'] = posted;
    data['transactionStatus'] = transactionStatus;
    data['postingDate'] = postingDate;
    data['postingReference'] = postingReference;
    data['creditedAccount'] = creditedAccount;
    return data;
  }
}
