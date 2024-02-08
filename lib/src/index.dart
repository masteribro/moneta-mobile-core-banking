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
  final bool isStaging;

  MonetaCoreBanking(
      {required this.requestToken, this.mock = false, this.isStaging = true}) {
    _bankingRepo = mock
        ? BankingRepositoryMock(requestToken)
        : BankingRepository(requestToken, isStaging);
  }

  ///implementation of get balance using dart either to return values for balance being either the [Balance] object on success or a string having message for a failure response
  Future<Either<Balance, LibErrors>> getBalance(String id) async {
    try {
      ApiResponse res = await _bankingRepo.getBalance(id);

      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        Balance balance = Balance.fromJson(res.data["data"]);
        return Left(balance);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  ///returns either TransferResponse on success or error message
  ///
  Future<Either<Map<String, dynamic>, LibErrors>> transfer(
      TransferRequestModel request) async {
    try {
      ApiResponse res = await _bankingRepo.doTransfer(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        // print("Fron Transfer response ${res.data["data"]}");
        var resData = res.data["data"] as Map<String, dynamic>;
        // make a new call to get the transaction record
        // String monetaReference = resData["MonetaReference"];

        // if (transactionLog.isLeft) {
        //   return transactionLog;
        // } else {
        //   throw transactionLog.right.errors;
        // }
        return Left(resData);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<Map<String, dynamic>, LibErrors>> transferV2(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.transferV2(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        var resData = res.data["data"] as Map<String, dynamic>;
        return Left(resData);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<TransactionModel, LibErrors>> getATransactionLog(
      String monetaReference) async {
    try {
      ApiResponse res = await _bankingRepo.getATransactionLog(monetaReference);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        var nData = res.data["data"];
        TransactionModel transaction = TransactionModel(
            id: nData["id"],
            currentDate: DateTime.now(),
            referenceId: nData["reference"],
            amount: nData["amount"],
            transactionDate: DateTime.tryParse(nData["created_at"]),
            // transactionDateString: ,
            recordType: "Debit",
            narration: "nil");

        return Left(transaction);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// returns either the phone number to receive OTP on success or error message
  Future<Either<String, LibErrors>> validateAccount(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.validateAccount(request);

      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        String phoneNumber = res.data["data"]["phone_number"];
        return Left(phoneNumber);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// returns either a [VerifyAccountModel] on success or error message
  Future<Either<VerifyAccountModel, LibErrors>> verifyAccount(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.verifyAccount(request);

      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        VerifyAccountModel verifyAccountModel =
            VerifyAccountModel.fromJson(res.data["data"]);
        return Left(verifyAccountModel);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  ///returns either List of [Bank]s on success or error message
  Future<Either<List<BankCode>, LibErrors>> getBankCodesV2(
      String accountId) async {
    try {
      ApiResponse res = await _bankingRepo.getBankCodesV2(accountId);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        List<BankCode> bankCodeList = [];

        /// A list of Bank Objects
        if (res.data["data"].runtimeType.toString().contains("List")) {
          for (var bank in res.data["data"]) {
            bankCodeList
                .add(BankCode.fromCoreBankingFormat(bank: Bank.fromJson(bank)));
          }
        } else if (res.data["data"].runtimeType.toString().contains("Map")) {
          /// A Map of Bank Codes
          bankCodeList = BankCode.convertMapToList(res.data["data"]);
        }
        return Left(bankCodeList);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  ///returns either List of [Bank]s on success or error message
  Future<Either<List<Bank>, LibErrors>> getAllBanks() async {
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
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Returns either List of possible [Bank]s on success or error message
  Future<Either<List<Bank>, LibErrors>> resolveBank(
      String accountNumber) async {
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
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());

      ///Most error that happens here are error that are related to dart parsing
      /// the data of errors such as socket execption, os Error, nullexception ..
      /// so this just make it easy for users to understand .
      return Right(LibErrors.error("Error resolving account"));
    }
  }

  ///returns either List of [OnboardedBank]s on success or error message
  Future<Either<List<OnboardedBank>, LibErrors>> getOnboardedBanks() async {
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
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  ///returns either GetAccountsResponse on success or error message
  Future<Either<List<Account>, LibErrors>> getMyAccounts() async {
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
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  ///returns either GetBanksResponse on success or error message
  Future<Either<Map, LibErrors>> getStatement(String bankId) async {
    try {
      ApiResponse res = await _bankingRepo.getStatement(bankId);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Resolves an account Number and Returns an Account object containing the Account Name
  Future<Either<ResolvedAccount, LibErrors>> resolveAccount(
      String accountNumber, String bankCode) async {
    try {
      ApiResponse res = await _bankingRepo
          .resolveAccount({"account_number": accountNumber, "bank": bankCode});
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        ResolvedAccount account = ResolvedAccount.fromJson(res.data["data"]);
        return Left(account);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<String, LibErrors>> removeAccount(String id) async {
    try {
      ApiResponse res = await _bankingRepo.removeAccount(id);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["message"]);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Returns Either a List of Transaction objects on success or error message
  Future<Either<TransactionsResponseModel, LibErrors>> getTransactions(
      TransactionsRequestModel requestModel) async {
    try {
      ApiResponse res = await _bankingRepo.getTransactions(requestModel);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        debugPrint("RunTime Type: ${res.data["data"].runtimeType}");
        TransactionsResponseModel transactions =
            TransactionsResponseModel.fromJson(res.data["data"]);
        return Left(transactions);
      } else {
        LibErrors? errors =
            LibErrors.parseErrors(res.data, errorsKey: "message");
        return Right(errors ?? LibErrors());
      }
    } catch (e) {
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Returns Either a List of Account objects on success or error message
  Future<Either<List<Account>, LibErrors>> getBeneficiaries() async {
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
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// returns either Account object on success or error message
  Future<Either<Account, LibErrors>> addBeneficiary(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.addBeneficiary(request);

      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        Account account = Account.fromJson(res.data["data"]);
        return Left(account);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<String, LibErrors>> removeBeneficiary(
      String beneficiaryId) async {
    try {
      ApiResponse res = await _bankingRepo.removeBeneficiary(beneficiaryId);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["message"]);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<String, LibErrors>> verifyPin(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.verifyPin(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["message"]);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<String, LibErrors>> createPin(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.createPin(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["message"]);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<String, LibErrors>> updatePin(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.updatePin(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["message"]);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<bool, LibErrors>> hasPin() async {
    try {
      ApiResponse res = await _bankingRepo.hasPin();
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        return Left(res.data["data"]["pin"]);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Returns Either a List of Notification objects on success or error message
  Future<Either<List<NotificationModel>, LibErrors>>
      getAllNotifications() async {
    try {
      ApiResponse res = await _bankingRepo.getAllNotifications();
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        debugPrint("RunTime Type: ${res.data["data"].runtimeType}");
        assert(res.data["data"].runtimeType.toString().contains("List"));
        List<NotificationModel> notifications = [];
        for (var account in res.data["data"]) {
          notifications.add(NotificationModel.fromJson(account));
        }
        return Left(notifications);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Returns Either a Notification object on success or error message
  Future<Either<NotificationModel, LibErrors>> getNotification(
      String notificationId) async {
    try {
      ApiResponse res = await _bankingRepo.getNotification(notificationId);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        NotificationModel notification =
            NotificationModel.fromJson(res.data["data"]);
        return Left(notification);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Returns Either a List of Account Types Objects on success or error message
  Future<Either<List<AccountTypeModel>, LibErrors>> getAccountTypes() async {
    try {
      ApiResponse res = await _bankingRepo.getAccountTypes();
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        List<AccountTypeModel> accountTypes = [];
        for (var account in res.data["data"]) {
          accountTypes.add(AccountTypeModel.fromJson(account));
        }
        return Left(accountTypes);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Returns Either a List of Account Objects on success or error message
  Future<Either<List<AllAccountModel>, LibErrors>> getAllAccounts() async {
    try {
      ApiResponse res = await _bankingRepo.getAllSavingsAccount();
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        List<AllAccountModel> allAccounts = [];
        for (var account in res.data["data"]) {
          allAccounts.add(AllAccountModel.fromJson(account));
        }
        return Left(allAccounts);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Returns Either an Account Creation Response on success or error message
  Future<Either<AccountCreationResponse, LibErrors>> addSavingsAccount(
      AddSavingsRequestModel request) async {
    try {
      ApiResponse res = await _bankingRepo.addSavingsAccount(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        AccountCreationResponse accountCreationResponse =
            AccountCreationResponse.fromJson(res.data["data"]);
        return Left(accountCreationResponse);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Returns Either a List of Maps for each field on success or error message
  Future<Either<List<Map<String, String?>>, LibErrors>>
      getAccountCreationFields(String bankId) async {
    try {
      ApiResponse res = await _bankingRepo.getAccountCreationFields(bankId);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        List<Map<String, String?>> fields = [];
        debugPrint("RuntimeType: ${res.data["data"].runtimeType}");
        if (res.data["data"].runtimeType.toString().contains("Map")) {
          (res.data["data"] as Map).forEach((key, value) {
            fields.add({key: value});
          });
          return Left(fields);
        } else {
          return const Left([]);
        }
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Returns Either an Account Creation Response on success or error message
  Future<Either<AccountCreationResponse, LibErrors>> createAccount(
      CreateAccountRequest request) async {
    try {
      ApiResponse res = await _bankingRepo.createAccount(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        AccountCreationResponse accountCreationResponse =
            AccountCreationResponse.fromJson(res.data["data"]);
        return Left(accountCreationResponse);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<Map<String, dynamic>, LibErrors>> createAccountV2(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.createAccountV2(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        var resData = res.data["data"] as Map<String, dynamic>;
        return Left(resData);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<Map<String, dynamic>, LibErrors>> verifyAccountV2(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.verifyAccountV2(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        var resData = res.data["data"] as Map<String, dynamic>;
        return Left(resData);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<Map<String, dynamic>, LibErrors>> connectAccountV2(
      Map<String, dynamic> request) async {
    try {
      ApiResponse res = await _bankingRepo.connectAccountV2(request);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        var resData = res.data["data"] as Map<String, dynamic>;
        return Left(resData);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  Future<Either<Map<String, dynamic>, LibErrors>> balanceEnquiryV2(
      String accountId) async {
    try {
      ApiResponse res = await _bankingRepo.balanceEnquiryV2(accountId);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        var resData = res.data["data"] as Map<String, dynamic>;
        return Left(resData);
      } else {
        LibErrors? errors = LibErrors.parseErrors(res.data);
        return Right(errors ?? LibErrors());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      return Right(LibErrors.error(e.toString()));
    }
  }

  /// Returns Either a List of Transaction objects on success or error message
  Future<Either<List<TransactionResponseModelV2>, LibErrors>> getTransactionsV2(
      String accountId, TransactionsRequestModelV2 requestModel) async {
    try {
      ApiResponse res =
          await _bankingRepo.getTransactionsV2(accountId, requestModel);
      if (AppConstants.successfulResponses.contains(res.statusCode)) {
        debugPrint("RunTime Type: ${res.data["data"].runtimeType}");

        List<TransactionResponseModelV2> fields = [];

        if (res.data["data"].runtimeType.toString().contains("List")) {
          // debugPrint("Raw Transactions: ${res.data["data"]}");
          for (final value in (res.data["data"] as List)) {
            fields.add(TransactionResponseModelV2.fromJson(value));
          }
          return Left(fields);
        } else {
          return const Left([]);
        }
      } else {
        LibErrors? errors =
            LibErrors.parseErrors(res.data, errorsKey: "message");
        return Right(errors ?? LibErrors());
      }
    } catch (e) {
      return Right(LibErrors.error(e.toString()));
    }
  }
}
