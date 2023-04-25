import 'package:moneta_base_library/lib_response.dart';

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

}
