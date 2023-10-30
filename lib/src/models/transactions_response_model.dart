class TransactionsResponseModel {
  bool? isSuccessful;
  dynamic customerIdInString;
  TransactionMessage? message;
  dynamic transactionTrackingRef;
  dynamic page;

  TransactionsResponseModel({
    this.isSuccessful,
    this.customerIdInString,
    this.message,
    this.transactionTrackingRef,
    this.page,
  });

  factory TransactionsResponseModel.fromJson(Map<String, dynamic> json) =>
      TransactionsResponseModel(
        isSuccessful: json["IsSuccessful"],
        customerIdInString: json["CustomerIDInString"],
        message: json["Message"] == null
            ? null
            : TransactionMessage.fromJson(json["Message"]),
        transactionTrackingRef: json["TransactionTrackingRef"],
        page: json["Page"],
      );

  Map<String, dynamic> toJson() => {
        "IsSuccessful": isSuccessful,
        "CustomerIDInString": customerIdInString,
        "Message": message?.toJson(),
        "TransactionTrackingRef": transactionTrackingRef,
        "Page": page,
      };
}

class TransactionMessage {
  List<TransactionModel>? transactions;
  Page? page;

  TransactionMessage({
    this.transactions,
    this.page,
  });

  factory TransactionMessage.fromJson(Map<String, dynamic> json) =>
      TransactionMessage(
        transactions: json["data"] == null
            ? []
            : List<TransactionModel>.from(
                json["data"]!.map((x) => TransactionModel.fromJson(x))),
        page: json["page"] == null ? null : Page.fromJson(json["page"]),
      );

  Map<String, dynamic> toJson() => {
        "data": transactions == null
            ? []
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
        "page": page?.toJson(),
      };
}

class TransactionModel {
  int? id;
  DateTime? currentDate;
  bool? isReversed;
  dynamic reversalReferenceNo;
  num? withdrawableAmount;
  String? uniqueIdentifier;
  String? instrumentNo;
  DateTime? transactionDate;
  String? transactionDateString;
  String? referenceId;
  String? narration;
  num? amount;
  num? openingBalance;
  num? balance;
  String? postingType;
  String? debit;
  String? credit;
  bool? isCardTransation;
  dynamic accountNumber;
  String? serviceCode;
  String? recordType;
  dynamic productInfo;
  TransferLog? transferLog;

  TransactionModel({
    this.id,
    this.currentDate,
    this.isReversed,
    this.reversalReferenceNo,
    this.withdrawableAmount,
    this.uniqueIdentifier,
    this.instrumentNo,
    this.transactionDate,
    this.transactionDateString,
    this.referenceId,
    this.narration,
    this.amount,
    this.openingBalance,
    this.balance,
    this.postingType,
    this.debit,
    this.credit,
    this.isCardTransation,
    this.accountNumber,
    this.serviceCode,
    this.recordType,
    this.productInfo,
    this.transferLog,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["Id"],
        currentDate: json["CurrentDate"] == null
            ? null
            : DateTime.parse(json["CurrentDate"]),
        isReversed: json["IsReversed"],
        reversalReferenceNo: json["ReversalReferenceNo"],
        withdrawableAmount: json["WithdrawableAmount"],
        uniqueIdentifier: json["UniqueIdentifier"],
        instrumentNo: json["InstrumentNo"],
        transactionDate: json["TransactionDate"] == null
            ? null
            : DateTime.parse(json["TransactionDate"]),
        transactionDateString: json["TransactionDateString"],
        referenceId: json["ReferenceID"],
        narration: json["Narration"],
        amount: json["Amount"]?.toDouble(),
        openingBalance: json["OpeningBalance"],
        balance: json["Balance"]?.toDouble(),
        postingType: json["PostingType"],
        debit: json["Debit"],
        credit: json["Credit"],
        isCardTransation: json["IsCardTransation"],
        accountNumber: json["AccountNumber"],
        serviceCode: json["ServiceCode"],
        recordType: json["RecordType"],
        productInfo: json["ProductInfo"],
        transferLog: json["TransferLog"] == null
            ? null
            : TransferLog.fromJson(json["TransferLog"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CurrentDate": currentDate?.toIso8601String(),
        "IsReversed": isReversed,
        "ReversalReferenceNo": reversalReferenceNo,
        "WithdrawableAmount": withdrawableAmount,
        "UniqueIdentifier": uniqueIdentifier,
        "InstrumentNo": instrumentNo,
        "TransactionDate": transactionDate?.toIso8601String(),
        "TransactionDateString": transactionDateString,
        "ReferenceID": referenceId,
        "Narration": narration,
        "Amount": amount,
        "OpeningBalance": openingBalance,
        "Balance": balance,
        "PostingType": postingType,
        "Debit": debit,
        "Credit": credit,
        "IsCardTransation": isCardTransation,
        "AccountNumber": accountNumber,
        "ServiceCode": serviceCode,
        "RecordType": recordType,
        "ProductInfo": productInfo,
      };
}

class TransferLog {
  int? id;
  int? accountId;
  String? reference;
  String? transferType;
  int? amount;
  String? recipientAccountNumber;
  String? recipientAccountName;
  String? recipientBankCode;
  String? recipientBankName;
  Map<String, dynamic>? metadata;

  TransferLog({
    this.id,
    this.accountId,
    this.reference,
    this.transferType,
    this.amount,
    this.recipientAccountNumber,
    this.recipientAccountName,
    this.recipientBankCode,
    this.recipientBankName,
    this.metadata,
  });

  factory TransferLog.fromJson(Map<String, dynamic> json) => TransferLog(
        id: json["id"],
        accountId: json["account_id"],
        reference: json["reference"],
        transferType: json["transfer_type"],
        amount: json["amount"],
        recipientAccountNumber: json["recipient_account_number"],
        recipientAccountName: json["recipient_account_name"],
        recipientBankCode: json["recipient_bank_code"],
        recipientBankName: json["recipient_bank_name"],
        metadata: json["metadata"],
      );
}

class Page {
  int? size;
  int? totalCount;
  int? totalPages;

  Page({
    this.size,
    this.totalCount,
    this.totalPages,
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        size: json["size"],
        totalCount: json["totalCount"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "totalCount": totalCount,
        "totalPages": totalPages,
      };
}
