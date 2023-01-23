import 'package:moneta_core_banking/src/repo/banking_repo_interface.dart';
import 'package:moneta_core_banking/src/utils/api_response.dart';

import '../utils/api_service.dart';

class BankingRepository extends IBankingRepository {
  final String token;
  late ApiService api;

  BankingRepository(this.token) {
    api = ApiService(token);
  }

  @override
  Future<ApiResponse> doTransfer(
    Map<String, dynamic> request,
    String id,
  ) async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "banks/$id/transfer",
      reqBody: request,
    );
    return response;
  }

  @override
  Future<ApiResponse> getBalance(String id) async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "banks/$id/balance",
    );
    return response;
  }

  @override
  Future<ApiResponse> doTransferOther(
    Map<String, dynamic> request,
    String id,
  ) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "banks/$id/transfer_other",
      reqBody: request,
    );
    return response;
  }
}
