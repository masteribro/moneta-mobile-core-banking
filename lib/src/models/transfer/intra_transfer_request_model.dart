import 'package:moneta_core_banking/src/models/transfer/transfer_request_model.dart';

class IntraTransferRequestModel extends TransferRequestModel {
  int? amount;
  String? fromAccountNumber;
  String? toAccountNumber;
  String? narration;

  IntraTransferRequestModel({
    this.amount,
    this.fromAccountNumber,
    this.toAccountNumber,
    this.narration,
  });

  factory IntraTransferRequestModel.fromJson(Map<String, dynamic> json) => IntraTransferRequestModel(
    amount: json["amount"],
    fromAccountNumber: json["from_account_number"],
    toAccountNumber: json["to_account_number"],
    narration: json["narration"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "from_account_number": fromAccountNumber,
    "to_account_number": toAccountNumber,
    "narration": narration,
  };

  @override
  bool isIntra() {
    return true;
  }
}
