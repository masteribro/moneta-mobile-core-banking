import '../utils/api_response.dart';

abstract class IBankingRepository {
  Future<ApiResponse> doTransfer(
    Map<String, dynamic> request,
    String id,
  );

  Future<ApiResponse> getBalance(String id);

  Future<ApiResponse> doTransferOther(
    Map<String, dynamic> request,
    String id,
  );
}
