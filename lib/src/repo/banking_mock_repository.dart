import 'package:dio/dio.dart';
import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/src/repo/banking_repo_interface.dart';

import '../../moneta_core_banking.dart';
import '../models/transaction.dart';

class BankingRepositoryMock extends IBankingRepository {
  final String token;

  BankingRepositoryMock(this.token);

  @override
  Future<ApiResponse> doTransfer(
      Map<String, dynamic> request, String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "message": "Transfer was successful",
          "data": {
            "responseCode": "00",
            "responseDescription": "SUCCESSFUL",
            "description": "FOOD TRANSFER",
            "transactionReference": "MNTX-REF-000123-220223030513",
            "posted": "N",
            "transactionStatus": "FAILED",
            "postingDate": null,
            "postingReference": "ZM--AG-2728",
            "creditedAccount": "3087813431"
          }
        },
        requestOptions: RequestOptions(path: "")));
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
  Future<ApiResponse> getTransactions(String accountId) async {
    await Future.delayed(const Duration(seconds: 1));
    if ((int.tryParse(accountId) ?? 0) > 3) {
      return ApiResponse(Response(
          statusCode: 200,
          data: {
            "status": "success",
            "data": [
              Transaction(
                      bank: Bank.fromJson({
                        "name": "Zenith Bank",
                        "slug": "zenith_bank",
                        "code": "044",
                        "ussd": "*966#"
                      }),
                      accountName: "Simon Cowel",
                      transactionType: "Debit",
                      transactionAmount: "25600",
                      transactionTime: "11:50am",
                      transactionState: "Success",
                      source: "Elsewhere")
                  .toJson(),
              Transaction(
                      bank: Bank.fromJson(
                        {
                          "name": "United Bank For Africa",
                          "slug": "united-bank-for-africa",
                          "code": "033",
                          "ussd": "*919#"
                        },
                      ),
                      accountName: "Simon Cowel",
                      transactionType: "Debit",
                      transactionAmount: "1670000000",
                      transactionTime: "09:50am",
                      transactionState: "Failed",
                      source: "Moneta")
                  .toJson(),
              Transaction(
                      bank: Bank.fromJson({
                        "name": "First Bank",
                        "slug": "first_bank",
                        "code": "011",
                        "ussd": "*894#"
                      }),
                      accountName: "Simon Cowel",
                      transactionType: "Debit",
                      transactionAmount: "100500",
                      transactionTime: "09:50am",
                      transactionState: "Success",
                      source: "Moneta")
                  .toJson(),
              Transaction(
                      bank: Bank.fromJson({
                        "name": "First Bank",
                        "slug": "first_bank",
                        "code": "011",
                        "ussd": "*894#"
                      }),
                      accountName: "Simon Cowel",
                      transactionType: "Debit",
                      transactionAmount: "100500",
                      transactionTime: "09:50am",
                      transactionState: "Success",
                      source: "Moneta")
                  .toJson(),
            ],
          },
          requestOptions: RequestOptions(path: "")));
    } else {
      return ApiResponse(Response(
          statusCode: 200,
          data: {
            "status": "success",
            "data": [
              Transaction(
                      bank: Bank.fromJson({
                        "name": "Zenith Bank",
                        "slug": "zenith_bank",
                        "code": "044",
                        "ussd": "*966#"
                      }),
                      accountName: "Simon Cowel",
                      transactionType: "Debit",
                      transactionAmount: "25600",
                      transactionTime: "11:50am",
                      transactionState: "Success",
                      source: "Elsewhere")
                  .toJson(),
              Transaction(
                      bank: Bank.fromJson(
                        {
                          "name": "United Bank For Africa",
                          "slug": "united-bank-for-africa",
                          "code": "033",
                          "ussd": "*919#"
                        },
                      ),
                      accountName: "Simon Cowel",
                      transactionType: "Debit",
                      transactionAmount: "1670000000",
                      transactionTime: "09:50am",
                      transactionState: "Failed",
                      source: "Moneta")
                  .toJson(),
              Transaction(
                      bank: Bank.fromJson({
                        "name": "First Bank",
                        "slug": "first_bank",
                        "code": "011",
                        "ussd": "*894#"
                      }),
                      accountName: "Simon Cowel",
                      transactionType: "Debit",
                      transactionAmount: "100500",
                      transactionTime: "09:50am",
                      transactionState: "Success",
                      source: "Moneta")
                  .toJson(),
              Transaction(
                      bank: Bank.fromJson({
                        "name": "First Bank",
                        "slug": "first_bank",
                        "code": "011",
                        "ussd": "*894#"
                      }),
                      accountName: "Simon Cowel",
                      transactionType: "Debit",
                      transactionAmount: "100500",
                      transactionTime: "09:50am",
                      transactionState: "Success",
                      source: "Moneta")
                  .toJson(),
            ],
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
  Future<ApiResponse> createPin(Map<String, dynamic> request) {
    // TODO: implement createPin
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> verifyPin(Map<String, dynamic> request) {
    // TODO: implement verifyPin
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> updatePin(Map<String, dynamic> request) {
    // TODO: implement updatePin
    throw UnimplementedError();
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
  Future<ApiResponse> hasPin() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
