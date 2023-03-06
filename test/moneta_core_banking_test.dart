import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moneta_core_banking/moneta_core_banking.dart';
import 'package:moneta_core_banking/src/models/account.dart';
import 'package:moneta_core_banking/src/models/transaction.dart';

void main() {
  late MonetaCoreBanking coreHandler;
  late Either<Balance, String> response;
  late Either<TransferResponse, String> transferResponse;
  late Either<Map, String> statementResponse;
  late Either<List<Bank>, String> getBanksResponse;
  late Either<List<Account>, String> getAllAccountsResponse;
  late Either<Account, String> addAccountResponse;
  late Either<Account, String> resolveAccountResponse;
  late Either<List<Transaction>, String> getTransactionsResponse;
  late Either<String, String> removeAccountResponse;
  String testToken;
  String? testID;

  setUp(() async {
    testToken = "5|DLhoDiWFfy1WzBkThyeH3PNh9cAPaxACnfLTdn5b";
    testID = "1";
    coreHandler = MonetaCoreBanking(requestToken: testToken, mock: true);
  });

  test('Test serialization on Core Banking Model', () {});

  /// NOTE: These tests make real network calls.
  /// Only run these tests to verify actual Server Responses
  ///
  test('Test get balance - Core Banking', () async {
    response = await coreHandler.getBalance(testID!);
    debugPrint(response.toString());
  });

  test('Test do transfer - Core Banking', () async {
    transferResponse = await coreHandler.transfer({
      "amount": 100,
      "account_number": 3087813431,
    }, "011");
    debugPrint(transferResponse.toString());
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

  test('Test add a new account - Core Banking', () async {
    addAccountResponse = await coreHandler.addAccount({
      "account_number" : "3087813431",
      "bank" : "011", // firstBank
    });
    debugPrint(addAccountResponse.toString());
  });

  test('Test get all banks - Core Banking', () async {
    getBanksResponse = await coreHandler.getAllBanks();
    // debugPrint(getBanksResponse.left.first.name);
    debugPrint(getBanksResponse.toString());
  });

  test('Test resolve account - Core Banking', () async {
    resolveAccountResponse = await coreHandler.resolveAccount("3087813431", "011");
    if (resolveAccountResponse.isLeft){
      debugPrint(resolveAccountResponse.left.accountName);
    } else {
      debugPrint(resolveAccountResponse.right.toString());
    }
  });

  test('Test get transactions - Core Banking', () async {
    getTransactionsResponse = await coreHandler.getTransactions("4");
    if (getTransactionsResponse.isLeft){
      debugPrint(getTransactionsResponse.left.length.toString());
    } else {
      debugPrint(getTransactionsResponse.right.toString());
  test('Test remove account - Core Banking', () async {
    removeAccountResponse = await coreHandler.removeAccount("4");
    if (resolveAccountResponse.isLeft){
      debugPrint(removeAccountResponse.left);
    } else {
      debugPrint(removeAccountResponse.right.toString());
    }
  });
}
