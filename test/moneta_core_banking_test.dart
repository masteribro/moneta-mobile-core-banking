import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moneta_core_banking/moneta_core_banking.dart';

void main() {
  late MonetaCoreBanking coreHandler;
  late Either<Balance, String> response;
  late Either<String, String> transferResponse;
  late Either<Map, String> statementResponse;
  late Either<List<Bank>, String> getBanksResponse;
  late Either<List<Bank>, String> resolveResponse;
  late Either<List<OnboardedBank>, String> getOnboardedBanksResponse;
  late Either<List<Account>, String> getAllAccountsResponse;
  late Either<ResolvedAccount, String> resolveAccountResponse;
  late Either<String, String> removeAccountResponse;
  late Either<TransactionsResponseModel, String> getTransactionsResponse;
  late Either<List<Account>, String> getBeneficiariesResponse;
  late Either<Account, String> addBeneficiaryResponse;
  late Either<String, String> removeBeneficiaryResponse;
  late Either<List<NotificationModel>, String> getAllNotificationsResponse;
  late Either<NotificationModel, String> getNotificationResponse;
  late Either<List<AllAccountModel>, String> getAllSavingsAccountsResponse;
  late Either<AccountCreationResponse, String> addSavingsAccountResponse;
  late Either<List<AccountTypeModel>, String> getAllAccountTypesResponse;
  late Either<List<Map<String, String?>>, String> getAccountCreationFieldsResponse;
  String testToken;
  String? testID;

  setUp(() async {
    testToken = "483|kSWCE7TwXq4aWoEcP9XAfQfC818fNwvNxF9b0RTP";
    testID = "3";
    coreHandler = MonetaCoreBanking(requestToken: testToken, mock: false, isStaging: false);
  });

  test('Test serialization on Core Banking Model', () {});

  /// NOTE: These tests make real network calls.
  /// Only run these tests to verify actual Server Responses or change the
  /// [coreHandler] [mock] to true
  test('Test get balance - Core Banking', () async {
    response = await coreHandler.getBalance(testID!);
    debugPrint(response.toString());
  });

  test('Test do intra transfer - Core Banking', () async {
    transferResponse = await coreHandler.transfer(IntraTransferRequestModel.fromJson(
        {
          "amount": 1000,
          "from_account_number": "1100039727",
          "to_account_number": "1100250913",
          "narration": "Test"
        }));
    // print(transferResponse.left.data);
    transferResponse.mapLeft((left) => debugPrint(left.toString()));
  });

  test('Test do inter transfer - Core Banking', () async {
    transferResponse = await coreHandler.transfer(InterTransferRequestModel.fromJson({
      "amount": "20",
      "payer_name": "Payer name",
      "payer_account_number": "1100250913",
      "receiver_name": "Abdulqudduus Babalola",
      "receiver_account_number": "0817064402",
      "receiver_bank_code": "044",
      "receiver_phone_number": "08124792224",
      "narration": "testing"
    }));
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
      debugPrint(getAllAccountsResponse.left.first.extendedBank?.name);
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
    getTransactionsResponse = await coreHandler.getTransactions(TransactionsRequestModel.fromJson({
      "account_number": "1100251099",
      "from_date": "08-09-2023",
      "to_date": "",
      "pageSize": "20",
      "pageNumber": "1"
    }));
    if (getTransactionsResponse.isLeft){
      debugPrint(getTransactionsResponse.left.toJson().toString());
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

  test ('Test get all account types - Core Banking', () async {
    getAllAccountTypesResponse = await coreHandler.getAccountTypes();
    if (getAllAccountTypesResponse.isLeft){
      debugPrint(getAllAccountTypesResponse.left.toString());
    }
    debugPrint(getAllAccountTypesResponse.toString());
  });

  test ('Test get all savings accounts - Core Banking', () async {
    getAllSavingsAccountsResponse = await coreHandler.getAllAccounts();
    if (getAllSavingsAccountsResponse.isLeft){
      debugPrint(getAllSavingsAccountsResponse.left.toString());
    }
    debugPrint(getAllSavingsAccountsResponse.toString());
  });

  test ('Test add savings accounts - Core Banking', () async {
    addSavingsAccountResponse = await coreHandler.addSavingsAccount(AddSavingsRequestModel.fromJson({
      "bank_id": "2",
      "account_type_id": "2",
      "bvn": "1109887723",
      "last_name": "Kenwood",
      "other_names": "Kehlani",
      "gender": "F",
      "place_of_birth": "FCT, Abuja",
      "date_of_birth": "20-05-1992",
      "address": "Lugbe, FCT",
      "phone": "08022491679"
    }));
    if (addSavingsAccountResponse.isLeft){
      debugPrint(addSavingsAccountResponse.left.toString());
    }
    debugPrint(addSavingsAccountResponse.toString());
  });

  test ('Test get account creation fields - Core Banking', () async {
    getAccountCreationFieldsResponse = await coreHandler.getAccountCreationFields(2.toString());
    if (getAccountCreationFieldsResponse.isLeft){
      debugPrint(getAccountCreationFieldsResponse.left.toString());
    } else {
      debugPrint(getAccountCreationFieldsResponse.right);
    }
  });

  test ('Test create accounts - Core Banking', () async {
    addSavingsAccountResponse = await coreHandler.createAccount(CreateAccountRequest.fromJson({
      "bank_id": "2",
      "account_type_id": "1",
      "bvn": "22440037046",
      "last_name": "Babalola",
      "other_names": "Abdulqudduus",
      "gender": "M",
      "place_of_birth": "Ikeja, Lagos",
      "date_of_birth": "1999-05-21",
      "address": "Lugbe, FCT",
      // Regent MFB: Babalola Abdulqudduus
      // 1300243913 ? Probably
      // 1400243916
      // 1500243919
      "phone": "08143336732",
      "national_identity_number": "65520881942"
    }));
    if (addSavingsAccountResponse.isLeft){
      debugPrint(addSavingsAccountResponse.left.toString());
    }
    debugPrint(addSavingsAccountResponse.toString());
  });
}
