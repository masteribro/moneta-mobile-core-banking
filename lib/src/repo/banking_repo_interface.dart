import 'package:moneta_base_library/lib_response.dart';
import 'package:moneta_core_banking/src/models/create_account_request_model.dart';
import 'package:moneta_core_banking/src/models/savings/add_savings_request_model.dart';

abstract class IBankingRepository {
  Future<ApiResponse> doTransfer(
    Map<String, dynamic> request,
    String id,
  );

  Future<ApiResponse> getBalance(String id);

  Future<ApiResponse> getAllBanks();

  Future<ApiResponse> getOnboardedBanks();

  Future<ApiResponse> getMyAccounts();

  Future<ApiResponse> addAccount(Map<String, dynamic> request);

  Future<ApiResponse> validateAccount(Map<String, dynamic> request);

  Future<ApiResponse> verifyAccount(Map<String, dynamic> request);

  Future<ApiResponse> getStatement(String bankId);

  Future<ApiResponse> resolveAccount(Map<String, dynamic> request);

  Future<ApiResponse> resolveBank(String accountNumber);

  Future<ApiResponse> getTransactions(String accountId);

  Future<ApiResponse> getBeneficiaries();

  Future<ApiResponse> addBeneficiary(Map<String, dynamic> request);

  Future<ApiResponse> removeAccount(String id);

  Future<ApiResponse> removeBeneficiary(String beneficiaryId);

  Future<ApiResponse> verifyPin(Map<String, dynamic> request);

  Future<ApiResponse> createPin(Map<String, dynamic> request);

  Future<ApiResponse> updatePin(Map<String, dynamic> request);

  Future<ApiResponse> hasPin();

  Future<ApiResponse> getAllNotifications();

  Future<ApiResponse> getNotification(String notificationId);

  Future<ApiResponse> getAllSavingsAccount();

  Future<ApiResponse> addSavingsAccount(AddSavingsRequestModel request);

  Future<ApiResponse> getAccountTypes();

  Future<ApiResponse> getAccountCreationFields(String bankId);

  Future<ApiResponse> createAccount(CreateAccountRequest request);

}
