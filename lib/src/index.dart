import 'package:dio/dio.dart';
import 'package:moneta_core_banking/src/repo/banking_repository.dart';
import 'package:moneta_core_banking/src/utils/api_response.dart';

class MonetaCoreBanking {
  final String requestToken;
  late BankingRepository _bankingRepo;

  MonetaCoreBanking({
    required this.requestToken,
  }) {
    _bankingRepo = BankingRepository(requestToken);
  }

  Future<ApiResponse> getBalance(String id) async {
    try {
      ApiResponse res = await _bankingRepo.getBalance(id);

      return res;
    } catch (e) {
      return ApiResponse(
        Response(
          statusCode: 500,
          data: e,
          requestOptions: RequestOptions(path: ''),
        ),
      );
    }
  }
}
