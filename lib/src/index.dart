import 'package:dio/dio.dart';
import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/src/repo/banking_repository.dart';

import '../moneta_core_banking.dart';

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

      if (res.statusCode == 200) {
        Balance balance = Balance.fromJson(res.data["data"]);

        return ApiResponse(Response(
            statusCode: 200,
            data: balance,

            /// The [path] should be a url, Passing this as a Phrase for ref. purposes
            requestOptions:
            RequestOptions(path: 'Get Settlements from Range')));
      } else {
        return res;
      }
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
