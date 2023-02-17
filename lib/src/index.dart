import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/src/repo/banking_repository.dart';

import '../moneta_core_banking.dart';

import 'repo/banking_mock_repository.dart';
import 'repo/banking_repo_interface.dart';

class MonetaCoreBanking {
  final String requestToken;
  late IBankingRepository _bankingRepo;

  MonetaCoreBanking({
    required this.requestToken,
  }) {
    _bankingRepo = BankingRepository(requestToken);
  }

  Future<Either<Balance, String>> getBalance(String id) async {
    try {
      ApiResponse res = await _bankingRepo.getBalance(id);

      if (res.statusCode == 200) {
        Balance balance = Balance.fromJson(res.data["data"]);
        return Left(balance);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
}
