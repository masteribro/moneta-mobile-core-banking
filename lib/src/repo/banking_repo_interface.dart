import 'package:moneta_base_library/lib_response.dart';


abstract class IBankingRepository {
  Future<MonetaResponseModel> doTransfer(
    Map<String, dynamic> request,
    String id,
  );

  Future<MonetaResponseModel> getBalance(String id);

  Future<MonetaResponseModel> doTransferOther(
    Map<String, dynamic> request,
    String id,
  );
}
