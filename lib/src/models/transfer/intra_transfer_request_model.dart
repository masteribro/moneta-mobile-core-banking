import 'package:moneta_core_banking/src/models/transfer/transfer_request_model.dart';

class IntraTransferRequestModel extends TransferRequestModel {
  int? amount;
  String? fromAccountNumber;
  String? toAccountNumber;
  String? narration;
  bool? saveBeneficiary;
  String? beneficiaryAccountName;

  IntraTransferRequestModel({
    this.amount,
    this.fromAccountNumber,
    this.toAccountNumber,
    this.narration,
    this.saveBeneficiary,
    this.beneficiaryAccountName,
  });

  factory IntraTransferRequestModel.fromJson(Map<String, dynamic> json) => IntraTransferRequestModel(
    amount: json["amount"],
    fromAccountNumber: json["from_account_number"],
    toAccountNumber: json["to_account_number"],
    narration: json["narration"],
    saveBeneficiary: json["save_beneficiary"],
    beneficiaryAccountName: json["beneficiary_account_name"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "amount": amount,
    "from_account_number": fromAccountNumber,
    "to_account_number": toAccountNumber,
    "narration": narration,
    "save_beneficiary": saveBeneficiary,
    "beneficiary_account_name": beneficiaryAccountName,
  };

  @override
  bool isIntra() {
    return true;
  }
}
