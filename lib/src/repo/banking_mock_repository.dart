import 'package:dio/dio.dart';
import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/src/models/transfer/transfer_request_model.dart';
import 'package:moneta_core_banking/src/repo/banking_repo_interface.dart';

import '../../moneta_core_banking.dart';

class BankingRepositoryMock extends IBankingRepository {
  final String token;

  BankingRepositoryMock(this.token);

  @override
  Future<ApiResponse> doTransfer(
      TransferRequestModel request) async {

    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Transfer was successful",
          "data": []
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> getATransactionLog(String monetaReference) {
    // TODO: implement getATransactionLog
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getBalance(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Balance Retreived Successfully",
          "data": {
            "responseCode": "00",
            "responseDescription": "SUCCESS",
            "description": null,
            "availableBalance": 1107394.37,
            "currentBalance": 1111446.67
          }
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> getAllBanks() async {
    // TODO: implement getAllBanks
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "All Banks Retreived",
          "data": [
            {
              "name": "Access Bank",
              "slug": "access-bank",
              "code": "044",
              "ussd": "*901#"
            },
            {
              "name": "Access Bank (Diamond)",
              "slug": "access-bank-diamond",
              "code": "063",
              "ussd": "*426#"
            },
            {
              "name": "ALAT by WEMA",
              "slug": "alat-by-wema",
              "code": "035A",
              "ussd": "*945*100#"
            },
            {
              "name": "ASO Savings and Loans",
              "slug": "asosavings",
              "code": "401",
              "ussd": ""
            },
            {
              "name": "Bowen Microfinance Bank",
              "slug": "bowen-microfinance-bank",
              "code": "50931",
              "ussd": ""
            },
            {
              "name": "CEMCS Microfinance Bank",
              "slug": "cemcs-microfinance-bank",
              "code": "50823",
              "ussd": ""
            },
            {
              "name": "Citibank Nigeria",
              "slug": "citibank-nigeria",
              "code": "023",
              "ussd": ""
            },
            {
              "name": "Ecobank Nigeria",
              "slug": "ecobank-nigeria",
              "code": "050",
              "ussd": "*326#"
            },
            {
              "name": "Ekondo Microfinance Bank",
              "slug": "ekondo-microfinance-bank",
              "code": "562",
              "ussd": "*540*178#"
            },
            {
              "name": "Fidelity Bank",
              "slug": "fidelity-bank",
              "code": "070",
              "ussd": "*770#"
            },
            {
              "name": "First Bank of Nigeria",
              "slug": "first-bank-of-nigeria",
              "code": "011",
              "ussd": "*894#"
            },
            {
              "name": "First City Monument Bank",
              "slug": "first-city-monument-bank",
              "code": "214",
              "ussd": "*329#"
            },
            {
              "name": "Globus Bank",
              "slug": "globus-bank",
              "code": "00103",
              "ussd": "*989#"
            },
            {
              "name": "Guaranty Trust Bank",
              "slug": "guaranty-trust-bank",
              "code": "058",
              "ussd": "*737#"
            },
            {
              "name": "Hasal Microfinance Bank",
              "slug": "hasal-microfinance-bank",
              "code": "50383",
              "ussd": "*322*127#"
            },
            {
              "name": "Heritage Bank",
              "slug": "heritage-bank",
              "code": "030",
              "ussd": "*322#"
            },
            {
              "name": "Jaiz Bank",
              "slug": "jaiz-bank",
              "code": "301",
              "ussd": "*389*301#"
            },
            {
              "name": "Keystone Bank",
              "slug": "keystone-bank",
              "code": "082",
              "ussd": "*7111#"
            },
            {
              "name": "Kuda Bank",
              "slug": "kuda-bank",
              "code": "50211",
              "ussd": ""
            },
            {
              "name": "One Finance",
              "slug": "one-finance",
              "code": "565",
              "ussd": "*1303#"
            },
            {"name": "Paga", "slug": "paga", "code": "327", "ussd": ""},
            {
              "name": "Parallex Bank",
              "slug": "parallex-bank",
              "code": "526",
              "ussd": "*322*318*0#"
            },
            {
              "name": "PayCom",
              "slug": "paycom",
              "code": "100004",
              "ussd": "*955#"
            },
            {
              "name": "Polaris Bank",
              "slug": "polaris-bank",
              "code": "076",
              "ussd": "*833#"
            },
            {
              "name": "Providus Bank",
              "slug": "providus-bank",
              "code": "101",
              "ussd": ""
            },
            {
              "name": "Rubies MFB",
              "slug": "rubies-mfb",
              "code": "125",
              "ussd": "*7797#"
            },
            {
              "name": "Sparkle Microfinance Bank",
              "slug": "sparkle-microfinance-bank",
              "code": "51310",
              "ussd": ""
            },
            {
              "name": "Stanbic IBTC Bank",
              "slug": "stanbic-ibtc-bank",
              "code": "221",
              "ussd": "*909#"
            },
            {
              "name": "Standard Chartered Bank",
              "slug": "standard-chartered-bank",
              "code": "068",
              "ussd": ""
            },
            {
              "name": "Sterling Bank",
              "slug": "sterling-bank",
              "code": "232",
              "ussd": "*822#"
            },
            {
              "name": "Suntrust Bank",
              "slug": "suntrust-bank",
              "code": "100",
              "ussd": "*5230#"
            },
            {
              "name": "TAJ Bank",
              "slug": "taj-bank",
              "code": "302",
              "ussd": "*898#"
            },
            {
              "name": "TCF MFB",
              "slug": "tcf-mfb",
              "code": "51211",
              "ussd": "*908#"
            },
            {
              "name": "Titan Trust Bank",
              "slug": "titan-trust-bank",
              "code": "102",
              "ussd": "*922#"
            },
            {
              "name": "Union Bank of Nigeria",
              "slug": "union-bank-of-nigeria",
              "code": "032",
              "ussd": "*826#"
            },
            {
              "name": "United Bank For Africa",
              "slug": "united-bank-for-africa",
              "code": "033",
              "ussd": "*919#"
            },
            {
              "name": "Unity Bank",
              "slug": "unity-bank",
              "code": "215",
              "ussd": "*7799#"
            },
            {"name": "VFD", "slug": "vfd", "code": "566", "ussd": ""},
            {
              "name": "Wema Bank",
              "slug": "wema-bank",
              "code": "035",
              "ussd": "*945#"
            },
            {
              "name": "Zenith Bank",
              "slug": "zenith-bank",
              "code": "057",
              "ussd": "*966#"
            }
          ]
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> getOnboardedBanks() async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "All Onboarded Banks Retrieved",
          "data": [
            {
              "id": 1,
              "name": "Zenith Bank",
              "alias": "zenith-bank",
              "code": "057"
            }
          ]
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> getMyAccounts() async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "data": [
            {
              "id": 1,
              "account_number": "0773175637",
              "account_name": "Tijjani Yusuf",
              "aggregator": 1,
              "bank_code": "011",
              "bank": {
                "name": "First Bank of Nigeria",
                "slug": "first-bank-of-nigeria",
                "code": "011",
                "ussd": "*894#"
              },
            },
            {
              "id": 2,
              "account_number": "0773175637",
              "account_name": "Tijjani Yusuf",
              "aggregator": 0,
              "bank_code": "50211",
              "bank": {
                "name": "Kuda Bank",
                "slug": "kuda-bank",
                "code": "50211",
                "ussd": ""
              },
            },
            {
              "id": 5,
              "account_number": "0773175637",
              "account_name": "Tijjani Yusuf",
              "aggregator": 1,
              "bank_code": "057",
              "bank": {
                "name": "Zenith Bank",
                "slug": "zenith-bank",
                "code": "057",
                "ussd": "*966#"
              },
            }
          ],
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> addAccount(Map<String, dynamic> request) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "data": {
            "id": 1,
            "account_number": "0773175637",
            "account_name": "Tijjani Yusuf",
            "aggregator": 1,
            "bank_code": "011",
            "bank": {
              "name": "First Bank of Nigeria",
              "slug": "first-bank-of-nigeria",
              "code": "011",
              "ussd": "*894#"
            },
          },
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> getStatement(String bankId) async {
    await Future.delayed(const Duration(seconds: 3));
    return ApiResponse(Response(
        statusCode: 200,
        data: {"status": "success", "data": []},
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> resolveAccount(Map<String, dynamic> request) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Account Resolved",
          "data": {
            "account_number": "3087813431",
            "account_name": "MUONEME JOHNPAUL CHUKWUEMEKA"
          }
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> removeAccount(String id) async {
    await Future.delayed(const Duration(seconds: 3));
    return ApiResponse(Response(
        statusCode: 200,
        data: {"status": "success", "message": "Account deleted successfully"},
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> getTransactions(TransactionsRequestModel request) async {
    await Future.delayed(const Duration(seconds: 1));
    if ((int.tryParse(request.pageNumber ?? "0") ?? 0) > 3) {
      return ApiResponse(Response(
          statusCode: 200,
          data: {
            "status": "success",
            "message": "Transaction History Retrieved",
            "data": {
              "IsSuccessful": true,
              "CustomerIDInString": null,
              "Message": {
                "data": [
                  {
                    "Id": 1864833,
                    "CurrentDate": "2023-09-01T07:59:48",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": null,
                    "InstrumentNo": null,
                    "TransactionDate": "2023-08-31T00:00:00",
                    "TransactionDateString": "Thursday, August 31, 2023 12:00 AM",
                    "ReferenceID": "AE23083199999",
                    "Narration": "Service Charge for the Month Ending for Aug-2023 - 02210011010025109/Aina Jonathan Joba",
                    "Amount": 5000,
                    "OpeningBalance": 37000,
                    "Balance": 32000,
                    "PostingType": "EndOfDayPosting",
                    "Debit": "50.00",
                    "Credit": "",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": null,
                    "RecordType": "Debit",
                    "ProductInfo": null
                  },
                  {
                    "Id": 1864834,
                    "CurrentDate": "2023-09-01T07:59:48",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": null,
                    "InstrumentNo": null,
                    "TransactionDate": "2023-08-31T00:00:00",
                    "TransactionDateString": "Thursday, August 31, 2023 12:00 AM",
                    "ReferenceID": "AE23083199999",
                    "Narration": "INTEREST CAPITALIZED FOR Aug-2023- 02210011010025109",
                    "Amount": 12,
                    "OpeningBalance": 32000,
                    "Balance": 32012,
                    "PostingType": "EndOfDayPosting",
                    "Debit": "",
                    "Credit": "0.12",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": null,
                    "RecordType": "Credit",
                    "ProductInfo": null
                  },
                  {
                    "Id": 1864835,
                    "CurrentDate": "2023-09-01T07:59:48",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": null,
                    "InstrumentNo": null,
                    "TransactionDate": "2023-08-31T00:00:00",
                    "TransactionDateString": "Thursday, August 31, 2023 12:00 AM",
                    "ReferenceID": "AE23083199999",
                    "Narration": "WITHOLDING TAX ON - 02210011010025109/Aina Jonathan Joba",
                    "Amount": 1.2,
                    "OpeningBalance": 32012,
                    "Balance": 32010.8,
                    "PostingType": "EndOfDayPosting",
                    "Debit": "0.02",
                    "Credit": "",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": null,
                    "RecordType": "Debit",
                    "ProductInfo": null
                  },
                  {
                    "Id": 1864084,
                    "CurrentDate": "2023-09-01T07:59:37",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": null,
                    "InstrumentNo": null,
                    "TransactionDate": "2023-08-31T00:00:00",
                    "TransactionDateString": "Thursday, August 31, 2023 12:00 AM",
                    "ReferenceID": "AE23083199999",
                    "Narration": "SMS Charge for Aug-2023",
                    "Amount": 3000,
                    "OpeningBalance": 40000,
                    "Balance": 37000,
                    "PostingType": "EndOfDayPosting",
                    "Debit": "30.00",
                    "Credit": "",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": null,
                    "RecordType": "Debit",
                    "ProductInfo": null
                  },
                  {
                    "Id": 1862807,
                    "CurrentDate": "2023-08-28T11:51:30",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": "020035522308281151300000000000000000000000",
                    "InstrumentNo": "A00000011300",
                    "TransactionDate": "2023-08-28T00:00:00",
                    "TransactionDateString": "Monday, August 28, 2023 12:00 AM",
                    "ReferenceID": "A2308280038",
                    "Narration": "TRFTestingFRM JONATHAN JOBA AINA TO Aina Jonathan Joba|JONATHAN JOBA AINA|Access Bank|Aina Jonathan",
                    "Amount": 30000,
                    "OpeningBalance": 10000,
                    "Balance": 40000,
                    "PostingType": "ISOPosting",
                    "Debit": "",
                    "Credit": "300.00",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": "1018",
                    "RecordType": "Credit",
                    "ProductInfo": null
                  },
                  {
                    "Id": 1862794,
                    "CurrentDate": "2023-08-28T11:35:00",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": "020035495508281135000000000000000000000000",
                    "InstrumentNo": "A00000011299",
                    "TransactionDate": "2023-08-28T00:00:00",
                    "TransactionDateString": "Monday, August 28, 2023 12:00 AM",
                    "ReferenceID": "A2308280024",
                    "Narration": "TRFTestingFRM JONATHAN JOBA AINA TO Aina Jonathan Joba|JONATHAN JOBA AINA|Access Bank|Aina Jonathan",
                    "Amount": 10000,
                    "OpeningBalance": 0,
                    "Balance": 10000,
                    "PostingType": "ISOPosting",
                    "Debit": "",
                    "Credit": "100.00",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": "1018",
                    "RecordType": "Credit",
                    "ProductInfo": null
                  }
                ],
                "page": {
                  "size": 20,
                  "totalCount": 6,
                  "totalPages": 1
                }
              },
              "TransactionTrackingRef": null,
              "Page": null
            }
          },
          requestOptions: RequestOptions(path: "")));
    } else {
      return ApiResponse(Response(
          statusCode: 200,
          data: {
            "status": "success",
            "message": "Transaction History Retrieved",
            "data": {
              "IsSuccessful": true,
              "CustomerIDInString": null,
              "Message": {
                "data": [
                  {
                    "Id": 1864833,
                    "CurrentDate": "2023-09-01T07:59:48",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": null,
                    "InstrumentNo": null,
                    "TransactionDate": "2023-08-31T00:00:00",
                    "TransactionDateString": "Thursday, August 31, 2023 12:00 AM",
                    "ReferenceID": "AE23083199999",
                    "Narration": "Service Charge for the Month Ending for Aug-2023 - 02210011010025109/Aina Jonathan Joba",
                    "Amount": 5000,
                    "OpeningBalance": 37000,
                    "Balance": 32000,
                    "PostingType": "EndOfDayPosting",
                    "Debit": "50.00",
                    "Credit": "",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": null,
                    "RecordType": "Debit",
                    "ProductInfo": null
                  },
                  {
                    "Id": 1864834,
                    "CurrentDate": "2023-09-01T07:59:48",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": null,
                    "InstrumentNo": null,
                    "TransactionDate": "2023-08-31T00:00:00",
                    "TransactionDateString": "Thursday, August 31, 2023 12:00 AM",
                    "ReferenceID": "AE23083199999",
                    "Narration": "INTEREST CAPITALIZED FOR Aug-2023- 02210011010025109",
                    "Amount": 12,
                    "OpeningBalance": 32000,
                    "Balance": 32012,
                    "PostingType": "EndOfDayPosting",
                    "Debit": "",
                    "Credit": "0.12",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": null,
                    "RecordType": "Credit",
                    "ProductInfo": null
                  },
                  {
                    "Id": 1864835,
                    "CurrentDate": "2023-09-01T07:59:48",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": null,
                    "InstrumentNo": null,
                    "TransactionDate": "2023-08-31T00:00:00",
                    "TransactionDateString": "Thursday, August 31, 2023 12:00 AM",
                    "ReferenceID": "AE23083199999",
                    "Narration": "WITHOLDING TAX ON - 02210011010025109/Aina Jonathan Joba",
                    "Amount": 1.2,
                    "OpeningBalance": 32012,
                    "Balance": 32010.8,
                    "PostingType": "EndOfDayPosting",
                    "Debit": "0.02",
                    "Credit": "",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": null,
                    "RecordType": "Debit",
                    "ProductInfo": null
                  },
                  {
                    "Id": 1864084,
                    "CurrentDate": "2023-09-01T07:59:37",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": null,
                    "InstrumentNo": null,
                    "TransactionDate": "2023-08-31T00:00:00",
                    "TransactionDateString": "Thursday, August 31, 2023 12:00 AM",
                    "ReferenceID": "AE23083199999",
                    "Narration": "SMS Charge for Aug-2023",
                    "Amount": 3000,
                    "OpeningBalance": 40000,
                    "Balance": 37000,
                    "PostingType": "EndOfDayPosting",
                    "Debit": "30.00",
                    "Credit": "",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": null,
                    "RecordType": "Debit",
                    "ProductInfo": null
                  },
                  {
                    "Id": 1862807,
                    "CurrentDate": "2023-08-28T11:51:30",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": "020035522308281151300000000000000000000000",
                    "InstrumentNo": "A00000011300",
                    "TransactionDate": "2023-08-28T00:00:00",
                    "TransactionDateString": "Monday, August 28, 2023 12:00 AM",
                    "ReferenceID": "A2308280038",
                    "Narration": "TRFTestingFRM JONATHAN JOBA AINA TO Aina Jonathan Joba|JONATHAN JOBA AINA|Access Bank|Aina Jonathan",
                    "Amount": 30000,
                    "OpeningBalance": 10000,
                    "Balance": 40000,
                    "PostingType": "ISOPosting",
                    "Debit": "",
                    "Credit": "300.00",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": "1018",
                    "RecordType": "Credit",
                    "ProductInfo": null
                  },
                  {
                    "Id": 1862794,
                    "CurrentDate": "2023-08-28T11:35:00",
                    "IsReversed": false,
                    "ReversalReferenceNo": null,
                    "WithdrawableAmount": 0,
                    "UniqueIdentifier": "020035495508281135000000000000000000000000",
                    "InstrumentNo": "A00000011299",
                    "TransactionDate": "2023-08-28T00:00:00",
                    "TransactionDateString": "Monday, August 28, 2023 12:00 AM",
                    "ReferenceID": "A2308280024",
                    "Narration": "TRFTestingFRM JONATHAN JOBA AINA TO Aina Jonathan Joba|JONATHAN JOBA AINA|Access Bank|Aina Jonathan",
                    "Amount": 10000,
                    "OpeningBalance": 0,
                    "Balance": 10000,
                    "PostingType": "ISOPosting",
                    "Debit": "",
                    "Credit": "100.00",
                    "IsCardTransation": false,
                    "AccountNumber": null,
                    "ServiceCode": "1018",
                    "RecordType": "Credit",
                    "ProductInfo": null
                  }
                ],
                "page": {
                  "size": 20,
                  "totalCount": 6,
                  "totalPages": 1
                }
              },
              "TransactionTrackingRef": null,
              "Page": null
            }
          },
          requestOptions: RequestOptions(path: "")));
    }
  }

  @override
  Future<ApiResponse> getBeneficiaries() async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "data": [
            {
              "id": 1,
              "account_number": "3087813431",
              "account_name": "Johnpaul Muoneme",
              "bank": {
                "id": 11,
                "name": "First Bank of Nigeria",
                "slug": "first-bank-of-nigeria",
                "code": "011",
                "usssd": "*894#"
              }
            }
          ],
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> addBeneficiary(Map<String, dynamic> request) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "data": {
            "id": 1,
            "account_number": request["account_number"],
            "account_name": request["account_name"],
            "aggregator": 1,
            "bank_code": request["bank"],
            "bank": {
              "name": "First Bank of Nigeria",
              "slug": "first-bank-of-nigeria",
              "code": "011",
              "ussd": "*894#"
            },
          },
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> removeBeneficiary(String beneficiaryId) async {
    await Future.delayed(const Duration(seconds: 3));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Beneficiary Removed",
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> createPin(Map<String, dynamic> request) async {
    await Future.delayed(const Duration(seconds: 3));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Transaction pin set successfully",
          "data": []
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> verifyPin(Map<String, dynamic> request) async {
    await Future.delayed(const Duration(seconds: 3));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Transaction pin verified",
          "data": []
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> updatePin(Map<String, dynamic> request) async {
    await Future.delayed(const Duration(seconds: 3));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Transaction pin updated successfully",
          "data": []
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> resolveBank(String accountNumber) async {
    await Future.delayed(const Duration(seconds: 3));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Suggested Banks Retreived",
          "data": [
            {
              "id": 14,
              "name": "Guaranty Trust Bank",
              "slug": "guaranty-trust-bank",
              "code": "058",
              "ussd": "*737#"
            },
            {
              "id": 39,
              "name": "Wema Bank",
              "slug": "wema-bank",
              "code": "035",
              "ussd": "*945#"
            }
          ]
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> hasPin() async {
    await Future.delayed(const Duration(seconds: 3));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "message": "User Retreived",
          "data": {
            "id": 3,
            "name": "Johnpaul Muoneme",
            "email": "johnpaul.muoneme@dreamlabs.com.ng",
            "phone": null,
            "pin": true,
            "accounts": [
              {
                "id": 2,
                "account_number": "2407834143",
                "account_name": "JOHNPAUL CHUKWUEMEKA MUONEME",
                "aggregator": 0,
                "bank": {
                  "id": "41",
                  "name": "Zenith Bank",
                  "slug": "zenith-bank",
                  "code": "057",
                  "ussd": "*966#"
                }
              }
            ]
          }
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> getAllNotifications() async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Notification Retreived",
          "data": [
            {
            "id": 1,
            "title": "Title",
            "description": "I am the description",
            "status": "unread",
            "type": {
              "id": 1,
              "name": "transaction"
            },
            "user": {
              "id": 1,
              "name": "Johnpaul Muoneme",
              "email": "johnpaul.muoneme@dreamlabs.com.ng",
              "phone": null,
              "pin": true
            }
          },
            {
              "id": 2,
              "title": "Second Title",
              "description": "I am the second description",
              "status": "read",
              "type": {
                "id": 1,
                "name": "transaction"
              },
              "user": {
                "id": 1,
                "name": "Johnpaul Muoneme",
                "email": "johnpaul.muoneme@dreamlabs.com.ng",
                "phone": null,
                "pin": true
              }
            }
          ]
        },
        requestOptions: RequestOptions(path: ""))
    );
  }

  @override
  Future<ApiResponse> getNotification(String notificationId) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Notification Retreived",
          "data": {
            "id": 1,
            "title": "Title",
            "description": "I am the description",
            "status": "unread",
            "type": {
              "id": 1,
              "name": "transaction"
            },
            "user": {
              "id": 1,
              "name": "Johnpaul Muoneme",
              "email": "johnpaul.muoneme@dreamlabs.com.ng",
              "phone": null,
              "pin": true
            }
          }
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> validateAccount(Map<String, dynamic> request) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "An OTP has been sent to your the phone number associated with the account",
          "data": {
            "phone_number": "070335****8"
          }
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> verifyAccount(Map<String, dynamic> request) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Account Verified",
          "data": {
            "user_id": 1,
            "account_number": "1100039727",
            "bank_id": 2,
            "account_name": "KAMORU SAKIRU DAMILARE",
            "aggregator": true,
            "updated_at": "2023-06-23T12:38:34.000000Z",
            "created_at": "2023-06-23T12:38:34.000000Z",
            "id": 1
          }
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> addSavingsAccount(AddSavingsRequestModel request) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Account Created",
          "data": {
            "account_number": "1234567891",
            "account_name": "Abdulhamid Ifeanyi Adekunle"
          }
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> getAllSavingsAccount() async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "All Accounts Retrieved",
          "data": [
            {
              "id": 1,
              "account_name": "KAMORU SAKIRU DAMILARE",
              "account_number": "1100039727",
              "aggregator": 1,
              "user_id": 1,
              "bank_id": 2,
              "created_at": "2023-07-14T09:57:25.000000Z",
              "updated_at": "2023-07-14T09:57:25.000000Z",
              "credentials": null,
              "account_type_id": 2,
              "bank": {
                "id": 2,
                "name": "Regent MFB",
                "alias": "regent-mfb",
                "code": "090125",
                "url": "http://52.168.85.231/BankOneWebAPI/api",
                "is_active": 1,
                "token_path": "/?",
                "balance_path": "/Account/GetAccountByAccountNumber/2?",
                "transfer_path": "/transaction",
                "transfer_inter_path": "/transaction",
                "metadata": "{\"token\":{\"test\":\"60631a02-9cfe-40e1-949b-7b080d827955\",\"live\":\"####\"},\"default\":{\"account_number\":\"1025612672\"}}",
                "created_at": null,
                "updated_at": null
              },
              "account_type": {
                "id": 2,
                "name": "Easy Savings",
                "code": "101",
                "bank_id": 2,
                "created_at": "2023-08-04T16:01:55.000000Z",
                "updated_at": "2023-08-04T16:01:55.000000Z"
              }
            }
          ]
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> getAccountTypes() async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Account Types Retrieved",
          "data": [
            {
              "id": 1,
              "name": "Savings",
              "code": "100",
              "bank_id": 2,
              "created_at": "2023-08-07T08:17:34.000000Z",
              "updated_at": "2023-08-07T08:17:34.000000Z",
              "bank": {
                "id": 2,
                "name": "Regent MFB",
                "alias": "regent-mfb",
                "code": "090125",
                "url": "http://52.168.85.231/BankOneWebAPI/api",
                "is_active": 1,
                "token_path": "/?",
                "balance_path": "/Account/GetAccountByAccountNumber/2?",
                "transfer_path": "/transaction",
                "transfer_inter_path": "/transaction",
                "metadata": "{\"token\":{\"test\":\"60631a02-9cfe-40e1-949b-7b080d827955\",\"live\":\"####\"},\"default\":{\"account_number\":\"1025612672\"}}",
                "created_at": null,
                "updated_at": null
              }
            },
            {
              "id": 2,
              "name": "Easy Savings",
              "code": "101",
              "bank_id": 2,
              "created_at": "2023-08-07T08:17:35.000000Z",
              "updated_at": "2023-08-07T08:17:35.000000Z",
              "bank": {
                "id": 2,
                "name": "Regent MFB",
                "alias": "regent-mfb",
                "code": "090125",
                "url": "http://52.168.85.231/BankOneWebAPI/api",
                "is_active": 1,
                "token_path": "/?",
                "balance_path": "/Account/GetAccountByAccountNumber/2?",
                "transfer_path": "/transaction",
                "transfer_inter_path": "/transaction",
                "metadata": "{\"token\":{\"test\":\"60631a02-9cfe-40e1-949b-7b080d827955\",\"live\":\"####\"},\"default\":{\"account_number\":\"1025612672\"}}",
                "created_at": null,
                "updated_at": null
              }
            },
            {
              "id": 3,
              "name": "Current Individual Account",
              "code": "201",
              "bank_id": 2,
              "created_at": "2023-08-07T10:48:46.000000Z",
              "updated_at": "2023-08-07T10:48:46.000000Z",
              "bank": {
                "id": 2,
                "name": "Regent MFB",
                "alias": "regent-mfb",
                "code": "090125",
                "url": "http://52.168.85.231/BankOneWebAPI/api",
                "is_active": 1,
                "token_path": "/?",
                "balance_path": "/Account/GetAccountByAccountNumber/2?",
                "transfer_path": "/transaction",
                "transfer_inter_path": "/transaction",
                "metadata": "{\"token\":{\"test\":\"60631a02-9cfe-40e1-949b-7b080d827955\",\"live\":\"####\"},\"default\":{\"account_number\":\"1025612672\"}}",
                "created_at": null,
                "updated_at": null
              }
            }
          ]
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> getAccountCreationFields(String bankId) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Account Creation Fields Retrieved",
          "data": {
            "bvn": "1109887723",
            "last_name": "Kenwood",
            "other_names": "Kehlani",
            "gender": "F",
            "date_of_birth": "1992-05-20",
            "phone": null,
            "address": "Lugbe, FCT",
            "place_of_birth": "FCT, Abuja"
          }
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> createAccount(CreateAccountRequest request) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Account Created",
          "data": {
            "account_number": "1234567891",
            "account_name": "Abdulhamid Ifeanyi Adekunle"
          }
        },
        requestOptions: RequestOptions(path: "")));
  }
}
