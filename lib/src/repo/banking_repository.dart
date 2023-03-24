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
      endpoint: "/accounts/$id/transfer",
      reqBody: request,
    );
    return response;
  }

  @override
  Future<ApiResponse> getBalance(String id) async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/accounts/$id/balance",
    );
    return response;
  }

  @override
  Future<ApiResponse> getAllBanks() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/banks/all",
    );
    return response;
  }

  @override
  Future<ApiResponse> getOnboardedBanks() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/banks/onboarded",
    );
    return response;
  }

  @override
  Future<ApiResponse> getMyAccounts() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/accounts",
    );
    return response;
  }

  @override
  Future<ApiResponse> addAccount(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post, endpoint: "/accounts", reqBody: request);
    return response;
  }

  @override
  Future<ApiResponse> getStatement(String accountId) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "/accounts/$accountId/statement",
    );
    return response;
  }

  @override
  Future<ApiResponse> resolveAccount(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/accounts/resolve",
        reqBody: request);
    return response;
  }

  @override
  Future<ApiResponse> removeAccount(String id) async {
    ApiResponse response = await api.call(
      method: HttpMethod.delete,
      endpoint: "/accounts/$id",
    );
    return response;
  }

  @override
  Future<ApiResponse> getTransactions(String accountId) async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/accounts/$accountId/transactions",
    );
    return response;
  }

  @override
  Future<ApiResponse> getBeneficiaries() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/beneficiaries",
    );
    return response;
  }

  @override
  Future<ApiResponse> addBeneficiary(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post, endpoint: "/beneficiaries", reqBody: request);
    return response;
  }

  @override
  Future<ApiResponse> removeBeneficiary(String beneficiaryId) async {
    ApiResponse response = await api.call(
      method: HttpMethod.delete,
      endpoint: "/beneficiaries/$beneficiaryId",
    );
    return response;
  }

  @override
  Future<ApiResponse> verifyPin(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "/transaction/pin/verify",
      reqBody: request,
    );

    return response;
  }

  @override
  Future<ApiResponse> createPin(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "/transaction/pin",
      reqBody: request,
    );

    return response;
  }

  @override
  Future<ApiResponse> updatePin(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "/transaction/pin/update",
      reqBody: request,
    );
    return response;
  }

  @override
  Future<ApiResponse> resolveBank(String accountNumber) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/banks/resolve",
        reqBody: {"account_number": accountNumber});
    return response;
  }
}
