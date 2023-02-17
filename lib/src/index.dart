import 'package:either_dart/either.dart';
import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/src/repo/banking_repository.dart';

import '../moneta_core_banking.dart';

import 'repo/banking_repo_interface.dart';

/// main entry class for all core banking functionality
class MonetaCoreBanking {
  ///client request token passed from core app
  final String requestToken;

  ///initialization of banking repo as a type of banking repo interface
  late IBankingRepository _bankingRepo;

  MonetaCoreBanking({
    required this.requestToken,
  }) {
    _bankingRepo = BankingRepository(requestToken);
  }

  ///implementation of get balance using dart either to return values for balance being either the balance object on success or a string having message for a failure response
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

  ///returns either TransferResponse on success or error message
  Future<Either<TransferResponse, String>> transfer(
      Map<String, dynamic> request, String id) async {
    try {
      ApiResponse res = await _bankingRepo.doTransfer(request, id);
      if (res.statusCode == 200) {
        TransferResponse transferResponse =
            TransferResponse.fromJson(res.data["data"]);
        return Left(transferResponse);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
}
