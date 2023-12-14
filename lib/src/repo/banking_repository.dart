import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/src/constants/constants.dart';
import 'package:moneta_core_banking/src/models/create_account_request_model.dart';
import 'package:moneta_core_banking/src/models/savings/add_savings_request_model.dart';
import 'package:moneta_core_banking/src/models/transactions_request_model.dart';
import 'package:moneta_core_banking/src/models/transfer/transfer_request_model.dart';
import 'package:moneta_core_banking/src/repo/banking_repo_interface.dart';

class BankingRepository extends IBankingRepository {
  final String token;
  late ApiService api;

  BankingRepository(this.token, bool isStaging) {
    api = ApiService(
      token: token,
      config: isStaging
          ? AppConstants.stagingLibConfig
          : AppConstants.prodLibConfig,
    );
  }

  @override
  Future<ApiResponse> doTransfer(
    TransferRequestModel request,
  ) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "/v1/bank-one/transfer/${request.isIntra() ? 'intra' : 'inter'}",
      reqBody: request.toJson(),
    );
    return response;
  }

  @override
  Future<ApiResponse> transferV2(Map<String, dynamic> request,)async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "/v2/banking/transfer",
      reqBody: request,
    );
    return response;
  }

  @override
  Future<ApiResponse> getATransactionLog(String monetaReference) async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/v1/transfers/$monetaReference",
    );
    return response;
  }

  @override
  Future<ApiResponse> getBalance(String id) async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/v1/accounts/$id/balance",
    );
    return response;
  }

  @override
  Future<ApiResponse> getBankCodesV2(String accountId) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "/v2/banking/bank-codes/$accountId",
    );
    return response;
  }

  @override
  Future<ApiResponse> getAllBanks() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/v1/banks/all",
    );
    return response;
  }

  @override
  Future<ApiResponse> getOnboardedBanks() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/v1/banks/onboarded",
    );
    return response;
  }

  @override
  Future<ApiResponse> getMyAccounts() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/v1/accounts",
    );
    return response;
  }

  @override
  Future<ApiResponse> addAccount(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post, endpoint: "/v1/accounts", reqBody: request);
    return response;
  }

  @override
  Future<ApiResponse> getStatement(String accountId) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "/v1/accounts/$accountId/statement",
    );
    return response;
  }

  @override
  Future<ApiResponse> resolveAccount(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/v1/accounts/resolve",
        reqBody: request);
    return response;
  }

  @override
  Future<ApiResponse> removeAccount(String id) async {
    ApiResponse response = await api.call(
      method: HttpMethod.delete,
      endpoint: "/v1/accounts/$id",
    );
    return response;
  }

  @override
  Future<ApiResponse> getTransactions(TransactionsRequestModel request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/v1/bank-one/transaction-history",
        reqBody: request.toJson());
    return response;
  }

  @override
  Future<ApiResponse> getBeneficiaries() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/v1/beneficiaries",
    );
    return response;
  }

  @override
  Future<ApiResponse> addBeneficiary(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post, endpoint: "/v1/beneficiaries", reqBody: request);
    return response;
  }

  @override
  Future<ApiResponse> removeBeneficiary(String beneficiaryId) async {
    ApiResponse response = await api.call(
      method: HttpMethod.delete,
      endpoint: "/v1/beneficiaries/$beneficiaryId",
    );
    return response;
  }

  @override
  Future<ApiResponse> verifyPin(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "/v1/transactions/pin/verify",
      reqBody: request,
    );

    return response;
  }

  @override
  Future<ApiResponse> createPin(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "/v1/transactions/pin",
      reqBody: request,
    );

    return response;
  }

  @override
  Future<ApiResponse> updatePin(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "/v1/transactions/pin/update",
      reqBody: request,
    );
    return response;
  }

  @override
  Future<ApiResponse> resolveBank(String accountNumber) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/v1/banks/resolve",
        reqBody: {"account_number": accountNumber});
    return response;
  }

  @override
  Future<ApiResponse> hasPin() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/v1/user",
    );
    return response;
  }

  @override
  Future<ApiResponse> getAllNotifications() async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/v1/notifications",
    );
    return response;
  }

  @override
  Future<ApiResponse> getNotification(String notificationId) async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "/v1/notifications/$notificationId",
    );
    return response;
  }

  @override
  Future<ApiResponse> validateAccount(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/v1/accounts/validate",
        reqBody: request);
    return response;
  }

  @override
  Future<ApiResponse> verifyAccount(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/v1/accounts/verify",
        reqBody: request);
    return response;
  }

  @override
  Future<ApiResponse> addSavingsAccount(AddSavingsRequestModel request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/v1/accounts/create-bank-account",
        reqBody: request.toJson());
    return response;
  }

  @override
  Future<ApiResponse> getAllSavingsAccount() async {
    ApiResponse response =
        await api.call(method: HttpMethod.get, endpoint: "/v1/accounts");
    return response;
  }

  @override
  Future<ApiResponse> getAccountTypes() async {
    ApiResponse response = await api.call(
        method: HttpMethod.get, endpoint: "/v1/accounts/account-types");
    return response;
  }

  @override
  Future<ApiResponse> getAccountCreationFields(String bankId) async {
    ApiResponse response = await api.call(
        method: HttpMethod.get,
        endpoint: "/v1/accounts/create-account-fields?bank_id=$bankId");
    return response;
  }

  @override
  Future<ApiResponse> createAccount(CreateAccountRequest request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/v1/accounts/create-bank-account",
        reqBody: request.toJson());
    return response;
  }

  @override
  Future<ApiResponse> verifyAccountV2(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/v2/banking/connect-account/verify",
        reqBody: request
    );
    return response;
  }

  @override
  Future<ApiResponse> createAccountV2(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/v2/banking/create-account",
        reqBody: request
    );
    return response;
  }

  @override
  Future<ApiResponse> connectAccountV2(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
        method: HttpMethod.post,
        endpoint: "/v2/banking/connect-account",
        reqBody: request
    );
    return response;
  }

  @override
  Future<ApiResponse> balanceEnquiryV2(String accountId) async {
    ApiResponse response = await api.call(
        method: HttpMethod.get,
        endpoint: "/v2/banking/balance-enquiry/$accountId",
    );
    return response;
  }
}
