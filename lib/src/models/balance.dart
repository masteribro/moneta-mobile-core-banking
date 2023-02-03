class Balance {
  String? responseCode;
  String? responseDescription;
  String? description;
  double? availableBalance;
  double? currentBalance;

  Balance({
    this.responseCode,
    this.responseDescription,
    this.description,
    this.availableBalance,
    this.currentBalance,
  });

  Balance.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseDescription = json['responseDescription'];
    description = json['description'];
    availableBalance = json['availableBalance'];
    currentBalance = json['currentBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['responseCode'] = responseCode;
    data['responseDescription'] = responseDescription;
    data['description'] = description;
    data['availableBalance'] = availableBalance;
    data['currentBalance'] = currentBalance;
    return data;
  }
}
