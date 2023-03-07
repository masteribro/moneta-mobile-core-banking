import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/src/constants/constants.dart';
import 'package:moneta_core_banking/src/repo/banking_repo_interface.dart';

class BankingRepository extends IBankingRepository {
  final String token;
  late ApiService api;

  BankingRepository(this.token) {
    api = ApiService(
      token: token,
      config: AppConstants.libConfig,
    );
  }

  @override
  Future<ApiResponse> doTransfer(
    Map<String, dynamic> request,
    String id,
  ) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
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
  Future<ApiResponse> getAllBanks() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "banks/all",
    );
    return response;
  }

  @override
  Future<ApiResponse> getMyAccounts() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "banks/accounts",
    );
    return response;
  }

  @override
  Future<ApiResponse> addAccount(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post, endpoint: "banks/accounts", reqBody: request);
    return response;
  }

  @override
  Future<ApiResponse> getStatement(String bankId) async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "banks/$bankId/transactions",
    );
    return response;
  }

  @override
  Future<ApiResponse> resolveAccount(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "banks/acccounts/resolve",
      reqBody: request
    );
    return response;
  }

  @override
  Future<ApiResponse> removeAccount(String id) async {
    ApiResponse response = await api.call(
        method: HttpMethod.delete,
        endpoint: "/banks/accounts/$id",
    );
    return response;
  }

  @override
  Future<ApiResponse> getTransactions(String accountId) {
    // TODO: implement getTransactions
    throw UnimplementedError();
  }
}
