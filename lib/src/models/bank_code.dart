import 'package:moneta_core_banking/moneta_core_banking.dart';

class BankCode {
  String? bankCode;
  String? bankName;

  BankCode({
    required this.bankCode,
    required this.bankName,
  });

  BankCode.fromCBNFormat({this.bankCode, this.bankName});

  BankCode.fromCoreBankingFormat({required Bank? bank}) {
    bankCode = bank?.code;
    bankName = bank?.name;
  }

  static List<BankCode> convertMapToList(Map<String, String> inputMap) {
    return inputMap.entries
        .map((entry) =>
            BankCode.fromCBNFormat(bankCode: entry.key, bankName: entry.value))
        .toList();
  }

  static String getBankListString(List<BankCode> bankList) {
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln('---- List of Banks ---');
    for (int i = 0; i < bankList.length; i++) {
      stringBuffer.writeln('${i + 1}. Bank: ${bankList[i].bankName}, ${bankList[i].bankCode}');
    }
    return stringBuffer.toString();
  }
}
