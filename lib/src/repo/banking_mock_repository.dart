import 'package:dio/dio.dart';
import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/src/repo/banking_repo_interface.dart';

class BankingRepositoryMock extends IBankingRepository {
  final String token;

  BankingRepositoryMock(this.token);

  @override
  Future<ApiResponse> doTransfer(
      Map<String, dynamic> request, String id) async {
    await Future.delayed(const Duration(seconds: 3));
    return ApiResponse(Response(
        statusCode: 200,
        data: {
          "status": "success",
          "data": {},
        },
        requestOptions: RequestOptions(path: "")));
  }

  @override
  Future<ApiResponse> doTransferOther(Map<String, dynamic> request, String id) {
    // TODO: implement doTransferOther
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getBalance(String id) {
    // TODO: implement getBalance
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getAllBanks() {
    // TODO: implement getAllBanks
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getMyAccounts() async {
    await Future.delayed(const Duration(seconds: 3));
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
  Future<ApiResponse> addAccount(Map<String, dynamic> request) {
    // TODO: implement addAccount
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getStatement(String bankId) {
    // TODO: implement getStatement
    throw UnimplementedError();
  }
}
