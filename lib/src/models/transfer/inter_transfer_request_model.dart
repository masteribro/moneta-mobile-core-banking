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

  InterTransferRequestModel({
    this.amount,
    this.payerName,
    this.payerAccountNumber,
    this.receiverName,
    this.receiverAccountNumber,
    this.receiverBankCode,
    this.receiverPhoneNumber,
    this.narration,
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
  };

  @override
  bool isIntra() {
    return false;
  }
}
