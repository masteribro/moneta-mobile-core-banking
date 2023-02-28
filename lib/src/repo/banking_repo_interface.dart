import 'package:moneta_base_library/lib_response.dart';


abstract class IBankingRepository {
  Future<ApiResponse> doTransfer(
    Map<String, dynamic> request,
    String id,
  );

  Future<ApiResponse> getBalance(String id);

  Future<ApiResponse> getAllBanks();

  Future<ApiResponse> getMyAccounts();

  Future<ApiResponse> addAccount(Map<String, dynamic> request);

  Future<ApiResponse> getStatement(String bankId);
}
