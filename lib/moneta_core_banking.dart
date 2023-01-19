import 'package:moneta_core_banking/src/repo/banking_repository.dart';

class MonetaCoreBanking {
  final String requestToken;
  late BankingRepository _bankingRepo;

  MonetaCoreBanking({required this.requestToken}) {
    _bankingRepo = BankingRepository(requestToken);
  }
}
