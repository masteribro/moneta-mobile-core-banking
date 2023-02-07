import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/src/constants/constants.dart';
import 'package:moneta_core_banking/src/repo/banking_repo_interface.dart';

class BankingRepository extends IBankingRepository {
  final String token;
  late ApiService api;

  BankingRepository(this.token) {
    api = ApiService(token: token, config: AppConstants.libConfig,);
  }

  @override
  Future<MonetaResponseModel> doTransfer(
    Map<String, dynamic> request,
    String id,
  ) async {
    MonetaResponseModel response = await api.call(
      method: HttpMethod.get,
      endpoint: "banks/$id/transfer",
      reqBody: request,
    );
    return response;
  }

  @override
  Future<MonetaResponseModel> getBalance(String id) async {
    MonetaResponseModel response = await api.call(
      method: HttpMethod.get,
      endpoint: "banks/$id/balance",
    );
    return response;
  }

  @override
  Future<MonetaResponseModel> doTransferOther(
    Map<String, dynamic> request,
    String id,
  ) async {
    MonetaResponseModel response = await api.call(
      method: HttpMethod.post,
      endpoint: "banks/$id/transfer_other",
      reqBody: request,
    );
    return response;
  }
}
