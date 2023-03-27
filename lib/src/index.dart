import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/src/repo/banking_repository.dart';

import '../moneta_core_banking.dart';
import 'constants/constants.dart';
import 'repo/banking_mock_repository.dart';
import 'repo/banking_repo_interface.dart';

/// main entry class for all core banking functionality
class MonetaCoreBanking {
  ///client request token passed from core app
  final String requestToken;

  ///initialization of banking repo as a type of banking repo interface
  late IBankingRepository _bankingRepo;
  final bool mock;

  MonetaCoreBanking({required this.requestToken, this.mock = false}) {
    _bankingRepo = mock
        ? BankingRepositoryMock(requestToken)
        : BankingRepository(requestToken);
  }

  ///implementation of get balance using dart either to return values for balance being either the [Balance] object on success or a string having message for a failure response
  Future<Either<Balance, String>> getBalance(String id) async {
    try {
      ApiResponse res = await _bankingRepo.getBalance(id);

      if (AppConstants.successfulResponses.contains(res.statusCode)) {
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
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
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
  Future<Either<Account, String>> addAccount(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.addAccount(request);

      if (AppConstants.successfulResponses.contains(res.statusCode)) {
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
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        assert(res.data["data"].runtimeType.toString().contains("List"));
        List<Bank> bankList = [];
        for (var bank in res.data["data"]) {
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

  /// Returns either List of possible [Bank]s on success or error message
  Future<Either<List<Bank>, String>> resolveBank(String accountNumber) async {
    try {
      ApiResponse res = await _bankingRepo.resolveBank(accountNumber);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        assert(res.data["data"].runtimeType.toString().contains("List"));
        List<Bank> bankList = [];
        for (var bank in res.data["data"]) {
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

  ///returns either List of [OnboardedBank]s on success or error message
  Future<Either<List<OnboardedBank>, String>> getOnboardedBanks() async {
    try {
      ApiResponse res = await _bankingRepo.getOnboardedBanks();
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        assert(res.data["data"].runtimeType.toString().contains("List"));
        List<OnboardedBank> bankList = [];
        for (var bank in res.data["data"]) {
          bankList.add(OnboardedBank.fromJson(bank));
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
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        debugPrint("RunTime Type: ${res.data["data"].runtimeType}");
        assert(res.data["data"].runtimeType.toString().contains("List"));
        List<Account> accountList = [];
        for (var account in res.data["data"]) {
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
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  /// Resolves an account Number and Returns an Account object containing the Account Namae
  Future<Either<Account, String>> resolveAccount(
      String accountNumber, String bankCode) async {
    try {
      ApiResponse res = await _bankingRepo
          .resolveAccount({"account_number": accountNumber, "bank": bankCode});
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        Account account = Account.fromJson(res.data["data"]);
        return Left(account);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(e.toString());
    }
  }

  Future<Either<String, String>> removeAccount(String id) async {
    try {
      ApiResponse res = await _bankingRepo.removeAccount(id);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["message"]);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(e.toString());
    }
  }

  /// Returns Either a List of Transaction objects on success or error message
  Future<Either<List<Transaction>, String>> getTransactions(
      String accountId) async {
    try {
      ApiResponse res = await _bankingRepo.getTransactions(accountId);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        debugPrint("RunTime Type: ${res.data["data"].runtimeType}");
        assert(res.data["data"].runtimeType.toString().contains("List"));
        List<Transaction> transactions = [];
        for (var account in res.data["data"]) {
          transactions.add(Transaction.fromJson(account));
        }
        return Left(transactions);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  /// Returns Either a List of Account objects on success or error message
  Future<Either<List<Account>, String>> getBeneficiaries() async {
    try {
      ApiResponse res = await _bankingRepo.getBeneficiaries();
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        debugPrint("RunTime Type: ${res.data["data"].runtimeType}");
        assert(res.data["data"].runtimeType.toString().contains("List"));

        List<Account> beneficiaries = [];
        for (var account in res.data["data"]) {
          beneficiaries.add(Account.fromJson(account));
        }
        return Left(beneficiaries);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  /// returns either Account object on success or error message
  Future<Either<Account, String>> addBeneficiary(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.addBeneficiary(request);

      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        Account account = Account.fromJson(res.data["data"]);
        return Left(account);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  Future<Either<String, String>> removeBeneficiary(String beneficiaryId) async {
    try {
      ApiResponse res = await _bankingRepo.removeBeneficiary(beneficiaryId);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["message"]);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(e.toString());
    }
  }

  Future<Either<String, String>> verifyPin(Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.verifyPin(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["data"]);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(e.toString());
    }
  }

  Future<Either<String, String>> createPin(Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.createPin(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["data"]);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(e.toString());
    }
  }

  Future<Either<String, String>> updatePin(Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.updatePin(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["data"]);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(e.toString());
    }
  }

  Future<Either<bool, String>> hasPin() async {
    try {
      ApiResponse res = await _bankingRepo.hasPin();
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["data"]["pin"]);
      } else {
        return Right(res.data["message"]);
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(e.toString());
    }
  }
}
