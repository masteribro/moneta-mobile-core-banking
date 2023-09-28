import 'package:moneta_core_banking/src/models/transfer/transfer_request_model.dart';

class InterTransferRequestModel extends TransferRequestModel{
  String? amount;
  String? payerName;
  String? payerAccountNumber;
  String? receiverName;
  String? receiverAccountNumber;
  String? receiverBankCode;
  String? receiverPhoneNumber;
  String? narration;
  bool? saveBeneficiary;
  String? beneficiaryAccountName;

  InterTransferRequestModel({
    this.amount,
    this.payerName,
    this.payerAccountNumber,
    this.receiverName,
    this.receiverAccountNumber,
    this.receiverBankCode,
    this.receiverPhoneNumber,
    this.narration,
    this.saveBeneficiary,
    this.beneficiaryAccountName,
  });

  factory InterTransferRequestModel.fromJson(Map<String, dynamic> json) => InterTransferRequestModel(
    amount: json["amount"],
    payerName: json["payer_name"],
    payerAccountNumber: json["payer_account_number"],
    receiverName: json["receiver_name"],
    receiverAccountNumber: json["receiver_account_number"],
    receiverBankCode: json["receiver_bank_code"],
    receiverPhoneNumber: json["receiver_phone_number"],
    narration: json["narration"],
    saveBeneficiary: json["save_beneficiary"],
    beneficiaryAccountName: json["beneficiary_account_name"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "payer_name": payerName,
    "payer_account_number": payerAccountNumber,
    "receiver_name": receiverName,
    "receiver_account_number": receiverAccountNumber,
    "receiver_bank_code": receiverBankCode,
    "receiver_phone_number": receiverPhoneNumber,
    "narration": narration,
    "save_beneficiary": saveBeneficiary,
    "beneficiary_account_name": beneficiaryAccountName,
  };

  @override
  bool isIntra() {
    return false;
  }
}
