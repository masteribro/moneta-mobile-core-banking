import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moneta_base_library/moneta_base_library.dart';
import 'package:moneta_core_banking/moneta_core_banking.dart';

void main() {
  late MonetaCoreBanking coreHandler;
  late Either<Balance, String> response;
  String testToken;
  String? testID;

  setUp(() async {
    testToken = "5|DLhoDiWFfy1WzBkThyeH3PNh9cAPaxACnfLTdn5b";
    testID = "1";
    coreHandler = MonetaCoreBanking(requestToken: testToken);
  });

  test('Test serialization on Core Banking Model', () {});

  /// NOTE: These tests make real network calls.
  /// Only run these tests to verify actual Server Responses
  test('Test core banking balance getter response type', () async {
    response = await coreHandler.getBalance(testID!);
    debugPrint(response.toString());
  });
}
