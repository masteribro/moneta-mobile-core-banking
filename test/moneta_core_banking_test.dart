import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moneta_base_library/lib_errors.dart';
import 'package:moneta_core_banking/moneta_core_banking.dart';

void main() {
  late MonetaCoreBanking coreHandler;
  late Either<Balance, LibErrors> response;
  // late Either<String, LibErrors> transferResponse;
  late Either<Map, LibErrors> statementResponse;
  late Either<List<Bank>, LibErrors> getBanksResponse;
  late Either<List<Bank>, LibErrors> resolveResponse;
  late Either<List<OnboardedBank>, LibErrors> getOnboardedBanksResponse;
  late Either<List<Account>, LibErrors> getAllAccountsResponse;
  late Either<ResolvedAccount, LibErrors> resolveAccountResponse;
  late Either<String, LibErrors> removeAccountResponse;
  late Either<TransactionsResponseModel, LibErrors> getTransactionsResponse;
  late Either<List<Account>, LibErrors> getBeneficiariesResponse;
  late Either<Account, LibErrors> addBeneficiaryResponse;
  late Either<String, LibErrors> removeBeneficiaryResponse;
  late Either<List<NotificationModel>, LibErrors> getAllNotificationsResponse;
  late Either<NotificationModel, LibErrors> getNotificationResponse;
  late Either<List<AllAccountModel>, LibErrors> getAllSavingsAccountsResponse;
  late Either<AccountCreationResponse, LibErrors> addSavingsAccountResponse;
  late Either<List<AccountTypeModel>, LibErrors> getAllAccountTypesResponse;
  late Either<List<Map<String, String?>>, LibErrors>
      getAccountCreationFieldsResponse;
  String testToken;
  String? testID;

  setUp(() async {
    testToken = "549|xfLoL4ICPQGDGp1MDiSj5PvGPfr1HbnxoVvUZO2P";
    testID = "3";
    coreHandler = MonetaCoreBanking(
        requestToken: testToken, mock: false, isStaging: false);
  });

  test('Test serialization on Core Banking Model', () {});

  /// NOTE: These tests make real network calls.
  /// Only run these tests to verify actual Server Responses or change the
  /// [coreHandler] [mock] to true
  test('Test get balance - Core Banking', () async {
    response = await coreHandler.getBalance(testID!);
    response.map((right) => debugPrint(right.message));
    debugPrint(response.toString());
  });
  test('Test transaction log - Core Banking', () async {
    var response = await coreHandler.getATransactionLog("Z0b2BmbuvsLM");
    debugPrint(response.toString());
  });

  // test('Test do intra transfer - Core Banking', () async {
  //   transferResponse =
  //       await coreHandler.transfer(IntraTransferRequestModel.fromJson({
  //     "amount": 1000,
  //     "from_account_number": "1100039727",
  //     "to_account_number": "1100250913",
  //     "narration": "Test"
  //   }));
  //   // print(transferResponse.left.data);
  //   transferResponse.mapLeft((left) => debugPrint(left.toString()));
  // });

  // test('Test do inter transfer - Core Banking', () async {
  //   transferResponse =
  //       await coreHandler.transfer(InterTransferRequestModel.fromJson({
  //     "amount": "20",
  //     "payer_name": "Payer name",
  //     "payer_account_number": "1100250913",
  //     "receiver_name": "Abdulqudduus Babalola",
  //     "receiver_account_number": "0817064402",
  //     "receiver_bank_code": "044",
  //     "receiver_phone_number": "08124792224",
  //     "narration": "testing"
  //   }));
  //   // print(transferResponse.left.data);
  //   transferResponse.mapLeft((left) => debugPrint(left.toString()));
  //   transferResponse.map((right) => debugPrint(right.toString()));
  // });

  test('Test get account statement - Core Banking', () async {
    statementResponse = await coreHandler.getStatement("1");
    debugPrint(statementResponse.toString());
  });

  test('Test get all accounts - Core Banking', () async {
    getAllAccountsResponse = await coreHandler.getMyAccounts();
    if (getAllAccountsResponse.isLeft) {
      debugPrint(getAllAccountsResponse.left.first.extendedBank?.name);
    }
    debugPrint(getAllAccountsResponse.toString());
  });

  test('Test get bank codes - Core Banking', () async {
    final response = await coreHandler.getBankCodesV2("1");
    // debugPrint(getBanksResponse.left.first.name);
    debugPrint(BankCode.getBankListString(response.left));
    assert(response.isLeft);
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
    resolveAccountResponse =
        await coreHandler.resolveAccount("0739414875", "044");
    if (resolveAccountResponse.isLeft) {
      debugPrint(resolveAccountResponse.left.accountName);
    } else {
      debugPrint(resolveAccountResponse.right.toString());
    }
  });

  test('Test remove account - Core Banking', () async {
    removeAccountResponse = await coreHandler.removeAccount("1");
    if (removeAccountResponse.isLeft) {
      debugPrint(removeAccountResponse.left);
    } else {
      debugPrint(removeAccountResponse.right.toNewlineSeparatedString());
    }
  });

  test('Test get transactions - Core Banking', () async {
    getTransactionsResponse =
        await coreHandler.getTransactions(TransactionsRequestModel.fromJson({
      "account_number": "1100251099",
      "from_date": "08-09-2023",
      "to_date": "",
      "pageSize": "20",
      "pageNumber": "1"
    }));
    if (getTransactionsResponse.isLeft) {
      debugPrint(getTransactionsResponse.left.toJson().toString());
    } else {
      // debugPrint(getTransactionsResponse.right.message);
      debugPrint(getTransactionsResponse.right.toNewlineSeparatedString());
    }
  });

  test('Test get transactions V2 - Core Banking', () async {
    final response = await coreHandler.getTransactionsV2(
        "17",
        TransactionsRequestModelV2.fromJson({
          "from_date": "08-09-2023",
          "to_date": "",
          "pageSize": "20",
          "pageNumber": "1"
        }));
    if (response.isLeft) {
      debugPrint("Transactions: ${response.left}");
      for (final value in response.left){
        debugPrint(value.narration);
      }
      // debugPrint(response.left..narration);
    } else {
      // debugPrint(getTransactionsResponse.right.message);
      debugPrint(response.right.toNewlineSeparatedString());
    }
  });

  test('Test get beneficiaries - Core Banking', () async {
    getBeneficiariesResponse = await coreHandler.getBeneficiaries();
    if (getBeneficiariesResponse.isLeft) {
      debugPrint(getBeneficiariesResponse.left.toString());
    } else {
      debugPrint(getBeneficiariesResponse.right.toString());
    }
  });

  test('Test add a new beneficiary - Core Banking', () async {
    addBeneficiaryResponse = await coreHandler.addBeneficiary({
      "account_number": "3087813431",
      "account_name": "Johnpaul Muoneme",
      "bank": "011", // firstBank
    });
    debugPrint(addBeneficiaryResponse.toString());
  });

  test('Test remove beneficiary - Core Banking', () async {
    removeBeneficiaryResponse = await coreHandler.removeBeneficiary("1");
    debugPrint(removeBeneficiaryResponse.toString());
  });

  test('Test create pin - Core Banking', () async {
    Either<String, LibErrors> response =
        await coreHandler.createPin({'pin': '1234'});
    debugPrint(response.toString());
  });

  test('Test update pin - Core Banking', () async {
    Either<String, LibErrors> response = await coreHandler.updatePin({
      'old_pin': '1234',
      'pin': '1234',
    });
    debugPrint(response.left.toString());
  });

  test('Test verify pin - Core Banking', () async {
    Either<String, LibErrors> response =
        await coreHandler.verifyPin({'pin': '1234'});
    debugPrint(response.left.toString());
  });

  test('Test has pin - Core Banking', () async {
    Either<bool, LibErrors> response = await coreHandler.hasPin();
    debugPrint(response.left.toString());
  });

  test('Test get all notifications - Core Banking', () async {
    getAllNotificationsResponse = await coreHandler.getAllNotifications();
    if (getAllNotificationsResponse.isLeft) {
      debugPrint(getAllNotificationsResponse.left.toString());
    }
    debugPrint(getAllNotificationsResponse.toString());
  });

  test('Test get single notification - Core Banking', () async {
    getNotificationResponse = await coreHandler.getNotification(testID ?? "5");
    if (getNotificationResponse.isLeft) {
      debugPrint(getNotificationResponse.left.toString());
    }
    debugPrint(getNotificationResponse.toString());
  });

  test('Test get all account types - Core Banking', () async {
    getAllAccountTypesResponse = await coreHandler.getAccountTypes();
    if (getAllAccountTypesResponse.isLeft) {
      debugPrint(getAllAccountTypesResponse.left.toString());
      debugPrint(getAllAccountTypesResponse.left.map((e) => e.interestRate).toList().toString());
    }
    debugPrint(getAllAccountTypesResponse.toString());
  });

  test('Test get all savings accounts - Core Banking', () async {
    getAllSavingsAccountsResponse = await coreHandler.getAllAccounts();
    if (getAllSavingsAccountsResponse.isLeft) {
      debugPrint(getAllSavingsAccountsResponse.left.toString());
    }
    debugPrint(getAllSavingsAccountsResponse.toString());
  });

  test('Test add savings accounts - Core Banking', () async {
    addSavingsAccountResponse =
        await coreHandler.addSavingsAccount(AddSavingsRequestModel.fromJson({
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
    if (addSavingsAccountResponse.isLeft) {
      debugPrint(addSavingsAccountResponse.left.toString());
    }
    debugPrint(addSavingsAccountResponse.toString());
  });

  test('Test get account creation fields - Core Banking', () async {
    getAccountCreationFieldsResponse =
        await coreHandler.getAccountCreationFields(2.toString());
    if (getAccountCreationFieldsResponse.isLeft) {
      debugPrint(getAccountCreationFieldsResponse.left.toString());
    } else {
      debugPrint(getAccountCreationFieldsResponse.right.message);
    }
  });

  test('Test create accounts - Core Banking', () async {
    addSavingsAccountResponse =
        await coreHandler.createAccount(CreateAccountRequest.fromJson({
      // "bank_id": "2",
      // "account_type_id": "1",
      // "bvn": "22440037046",
      // "last_name": "Babalola",
      // "other_names": "Abdulqudduus",
      // "gender": "M",
      // "place_of_birth": "Ikeja, Lagos",
      // "date_of_birth": "1999-05-21",
      // "address": "Lugbe, FCT",
      // Regent MFB: Babalola Abdulqudduus
      // 1300243913 ? Probably
      // 1400243916
      // 1500243919
      // "phone": "08143336732",
      // "national_identity_number": "65520881942"
    }));
    if (addSavingsAccountResponse.isLeft) {
      debugPrint(addSavingsAccountResponse.left.toString());
    }
    addSavingsAccountResponse
        .map((right) => {debugPrint(right.toNewlineSeparatedString())});
    // debugPrint(addSavingsAccountResponse.toString());
  });

  test('Test Verify Account V2', () async {
    final result = await coreHandler.verifyAccountV2({
      "account_number": "1100251240",
      //This is the first endpoint to call when connecting an account.
      "bank_code": "090125"
      //regent=090125;ewt=NG0450001
    });

    assert(result.isLeft);
  });

  test('Test Connect Account V2', () async {
    final result = await coreHandler
        .connectAccountV2({"account_number": "0450018564", "otp": "053410"});

    assert(result.isLeft);
  });

  test('Test Transfer V2', () async {
    final result = await coreHandler.transferV2({
      "amount": "20",
      "account_id": "27",
      "beneficiary_account_number": "1100252797", //1200252790
      "beneficiary_bank_code": "090125",
      "save_beneficiary": false
    });

    assert(result.isLeft);
  });

  test('Test Create Account V2', () async {
    final result = await coreHandler.createAccountV2({
      "bank_code": "REGENT_BANK_CODE",
      "account_type_id": "1",
      "bvn": "12345678901",
      "first_name": "Hohn",
      "last_name": "Doe",
      "other_names": "John",
      "gender": "M",
      "date_of_birth": "1990-01-01",
      "phone": "+2348012345678",
      "place_of_birth": "Lagos",
      "address": "123 Main St, Lagos",
      "national_identity_number": "1234567890",
      "city": "Abuja",
      "state": "FCT"
    });

    assert(result.isLeft);
  });

  test('Test Get Account Balance V2', () async {
    final result = await coreHandler.balanceEnquiryV2("27"); //27

    assert(result.isLeft);
  });
}
