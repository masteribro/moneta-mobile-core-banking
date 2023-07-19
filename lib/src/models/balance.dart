// class Balance {
//   String? responseCode;
//   String? responseDescription;
//   String? description;
//   String? availableBalance;
//   String? currentBalance;
//
//   Balance({
//     this.responseCode,
//     this.responseDescription,
//     this.description,
//     this.availableBalance,
//     this.currentBalance,
//   });
//
//   Balance.fromJson(Map<String, dynamic> json) {
//     responseCode = json['responseCode'];
//     responseDescription = json['responseDescription'];
//     description = json['description'];
//     availableBalance = json['availableBalance'].toString();
//     currentBalance = json['currentBalance'].toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['responseCode'] = responseCode;
//     data['responseDescription'] = responseDescription;
//     data['description'] = description;
//     data['availableBalance'] = availableBalance;
//     data['currentBalance'] = currentBalance;
//     return data;
//   }
// }

class Balance {
  double? balance;

  Balance({this.balance});

  Balance.fromJson(Map<String, dynamic> json) {
    balance = double.parse(json['balance'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    return data;
  }
}
