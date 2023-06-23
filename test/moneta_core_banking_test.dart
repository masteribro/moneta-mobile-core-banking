import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moneta_core_banking/moneta_core_banking.dart';

void main() {
  late MonetaCoreBanking coreHandler;
  late Either<Balance, String> response;
  late Either<TransferResponse, String> transferResponse;
  late Either<Map, String> statementResponse;
  late Either<List<Bank>, String> getBanksResponse;
  late Either<List<Bank>, String> resolveResponse;
  late Either<List<OnboardedBank>, String> getOnboardedBanksResponse;
  late Either<List<Account>, String> getAllAccountsResponse;
  late Either<ResolvedAccount, String> resolveAccountResponse;
  late Either<String, String> removeAccountResponse;
  late Either<List<Transaction>, String> getTransactionsResponse;
  late Either<List<Account>, String> getBeneficiariesResponse;
  late Either<Account, String> addBeneficiaryResponse;
  late Either<String, String> removeBeneficiaryResponse;
  late Either<List<NotificationModel>, String> getAllNotificationsResponse;
  late Either<NotificationModel, String> getNotificationResponse;
  String testToken;
  String? testID;

  setUp(() async {
    testToken = "377|rIiEIuJLfFWiOYhbmuAIVC4fqj1oqUyi4HoUhoyG";
    testID = "3";
    coreHandler = MonetaCoreBanking(requestToken: testToken, mock: true);
  });

  test('Test serialization on Core Banking Model', () {});

  /// NOTE: These tests make real network calls.
  /// Only run these tests to verify actual Server Responses or change the
  /// [coreHandler] [mock] to true
  test('Test get balance - Core Banking', () async {
    response = await coreHandler.getBalance(testID!);
    debugPrint(response.toString());
  });

  test('Test do transfer - Core Banking', () async {
    transferResponse = await coreHandler.transfer({
      "transfer": [
        {
          "amount": "100",
          "account": "3087813431",
          "description": "Staging Moneta Core Banking Mobile App Test DO TRANSFER",
          "bank" : "011",
          // "scheduled": true,
          // "scheduled_time: DateTime.now()
        },
        {
          "amount": "100",
          "account": "3087813431",
          "description": "Staging Moneta Core Banking Mobile App Test DO TRANSFER",
          "bank" : "011",
          // "scheduled": true,
          // "scheduled_time: DateTime.now()
        },
      ]},
        "3" // Account ID To Transfer From
    );
    // print(transferResponse.left.data);
    transferResponse.mapLeft((left) => debugPrint(left.toString()));
  });

  test('Test get account statement - Core Banking', () async {
    statementResponse = await coreHandler.getStatement("1");
    debugPrint(statementResponse.toString());
  });

  test('Test get all accounts - Core Banking', () async {
    getAllAccountsResponse = await coreHandler.getMyAccounts();
    if (getAllAccountsResponse.isLeft){
      debugPrint(getAllAccountsResponse.left.toString());
    }
    debugPrint(getAllAccountsResponse.toString()) ;
  });

  test('Test get all banks - Core Banking', () async {
    getBanksResponse = await coreHandler.getAllBanks();
    // debugPrint(getBanksResponse.left.first.name);
    debugPrint(getBanksResponse.toString());
  });

  test('Test resolve bank - Core Banking', () async {
    resolveResponse = await coreHandler.resolveBank("3087813431");
    // debugPrint(getBanksResponse.left.first.name);
    debugPrint(resolveResponse.toString());
  });

  test('Test get onboarded banks - Core Banking', () async {
    getOnboardedBanksResponse = await coreHandler.getOnboardedBanks();
    // debugPrint(getBanksResponse.left.first.name);
    debugPrint(getOnboardedBanksResponse.toString());
  });

  test('Test resolve account - Core Banking', () async {
    resolveAccountResponse = await coreHandler.resolveAccount("0739414875", "044");
    if (resolveAccountResponse.isLeft){
      debugPrint(resolveAccountResponse.left.accountName);
    } else {
      debugPrint(resolveAccountResponse.right.toString());
    }
  });

  test('Test remove account - Core Banking', () async {
    removeAccountResponse = await coreHandler.removeAccount("1");
    if (removeAccountResponse.isLeft){
      debugPrint(removeAccountResponse.left);
    } else {
      debugPrint(removeAccountResponse.right.toString());
    }
  });

  test('Test get transactions - Core Banking', () async {
    getTransactionsResponse = await coreHandler.getTransactions("3");
    if (getTransactionsResponse.isLeft){
      debugPrint(getTransactionsResponse.left.length.toString());
    } else {
      debugPrint(getTransactionsResponse.right.toString());
    }
  });

  test('Test get beneficiaries - Core Banking', () async {
    getBeneficiariesResponse = await coreHandler.getBeneficiaries();
    if (getBeneficiariesResponse.isLeft){
      debugPrint(getBeneficiariesResponse.left.toString());
    } else {
      debugPrint(getBeneficiariesResponse.right.toString());
    }
  });

  test('Test add a new beneficiary - Core Banking', () async {
    addBeneficiaryResponse = await coreHandler.addBeneficiary({
      "account_number" : "3087813431",
      "account_name" : "Johnpaul Muoneme",
      "bank" : "011", // firstBank
    });
    debugPrint(addBeneficiaryResponse.toString());
  });

  test('Test remove beneficiary - Core Banking', () async {
    removeBeneficiaryResponse = await coreHandler.removeBeneficiary("1");
    debugPrint(removeBeneficiaryResponse.toString());
  });

  test('Test create pin - Core Banking', () async {
    Either<String, String> response = await coreHandler.createPin({'pin': '1234'});
    debugPrint(response.toString());
  });

  test('Test update pin - Core Banking', () async {
    Either<String, String> response = await coreHandler.updatePin({
      'old_pin': '1234',
      'pin': '1234',
    });
    debugPrint(response.left.toString());
  });

  test('Test verify pin - Core Banking', () async {
    Either<String, String> response = await coreHandler.verifyPin({'pin': '1234'});
    debugPrint(response.left.toString());
  });

  test('Test has pin - Core Banking', () async {
    Either<bool, String> response = await coreHandler.hasPin();
    debugPrint(response.left.toString());
  });

  test('Test get all notifications - Core Banking', () async {
    getAllNotificationsResponse = await coreHandler.getAllNotifications();
    if (getAllNotificationsResponse.isLeft){
      debugPrint(getAllNotificationsResponse.left.toString());
    }
    debugPrint(getAllNotificationsResponse.toString()) ;
  });

  test('Test get single notification - Core Banking', () async {
    getNotificationResponse = await coreHandler.getNotification(testID ?? "5");
    if (getNotificationResponse.isLeft){
      debugPrint(getNotificationResponse.left.toString());
    }
    debugPrint(getNotificationResponse.toString()) ;
  });
}
