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
}
