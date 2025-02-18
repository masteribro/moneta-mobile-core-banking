import 'package:moneta_base_library/moneta_base_library.dart';

class AppConstants {
  static final LibraryConfiguration stagingLibConfig =
  LibraryConfiguration(libraryBaseUrl: "https://demo-bank.moneta.ng/api/v1/");

  static final LibraryConfiguration prodLibConfig =
  LibraryConfiguration(libraryBaseUrl: "https://core-banking.moneta.ng/api/");

  static final successfulResponses = [200, 201];
}
