import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/src/repo/banking_repository.dart';

import '../moneta_core_banking.dart';
import 'models/account.dart';
import 'repo/banking_mock_repository.dart';
import 'repo/banking_repo_interface.dart';

/// main entry class for all core banking functionality
class MonetaCoreBanking {
  ///client request token passed from core app
  final String requestToken;

  ///initialization of banking repo as a type of banking repo interface
  late IBankingRepository _bankingRepo;
  final bool mock;

  MonetaCoreBanking({
    required this.requestToken,
    this.mock = false
  }) {
    _bankingRepo = mock ? BankingRepositoryMock(requestToken) : BankingRepository(requestToken);
  }

  ///implementation of get balance using dart either to return values for balance being either the [Balance] object on success or a string having message for a failure response
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

  ///returns either [TransferResponse] on success or error message
  Future<Either<TransferResponse, String>> transferOther(
      Map<String, dynamic> request, String id) async {
    try {
      ApiResponse res = await _bankingRepo.doTransferOther(request, id);
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

  /// returns either AccountInfo on success or error message
  Future<Either<Account, String>> addAccount(Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.addAccount(request);

      if (res.statusCode == 200) {
        Account account = Account.fromJson(res.data["data"]);
        return Left(account);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  ///returns either List of [Bank]s on success or error message
  Future<Either<List<Bank>, String>> getAllBanks() async {
    try {
      ApiResponse res = await _bankingRepo.getAllBanks();
      if (res.statusCode == 200) {
        assert(res.data["data"].runtimeType.toString().contains("List"));
        List<Bank> bankList = [];
        for (var bank in res.data["data"]){
          bankList.add(Bank.fromJson(bank));
        }
        return Left(bankList);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  ///returns either GetAccounrsResponse on success or error message
  Future<Either<List<Account>, String>> getMyAccounts() async {
    try {
      ApiResponse res = await _bankingRepo.getMyAccounts();
      if (res.statusCode == 200) {
        debugPrint("RunTime Type: ${res.data["data"].runtimeType}");
        assert(res.data["data"].runtimeType.toString().contains("List"));
        List<Account> accountList = [];
        for (var account in res.data["data"]){
          accountList.add(Account.fromJson(account));
        }
        return Left(accountList);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  ///returns either GetBanksResponse on success or error message
  Future<Either<Map, String>> getStatement(String bankId) async {
    try {
      ApiResponse res = await _bankingRepo.getStatement(bankId);
      if (res.statusCode == 200) {
        return Left(res.data);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
}
