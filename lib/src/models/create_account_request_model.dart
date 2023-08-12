class CreateAccountRequest {
  String? bankId;
  String? accountTypeId;
  String? bvn;
  String? lastName;
  String? otherNames;
  String? gender;
  String? placeOfBirth;
  DateTime? dateOfBirth;
  String? address;
  String? phone;
  String? nationalIdentityNumber;

  CreateAccountRequest({
    this.bankId,
    this.accountTypeId,
    this.bvn,
    this.lastName,
    this.otherNames,
    this.gender,
    this.placeOfBirth,
    this.dateOfBirth,
    this.address,
    this.phone,
    this.nationalIdentityNumber,
  });

  factory CreateAccountRequest.fromJson(Map<String, dynamic> json) => CreateAccountRequest(
    bankId: json["bank_id"],
    accountTypeId: json["account_type_id"],
    bvn: json["bvn"],
    lastName: json["last_name"],
    otherNames: json["other_names"],
    gender: json["gender"],
    placeOfBirth: json["place_of_birth"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    address: json["address"],
    phone: json["phone"],
    nationalIdentityNumber: json["national_identity_number"],
  );

  Map<String, dynamic> toJson() => {
    "bank_id": bankId,
    "account_type_id": accountTypeId,
    "bvn": bvn,
    "last_name": lastName,
    "other_names": otherNames,
    "gender": gender,
    "place_of_birth": placeOfBirth,
    "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "address": address,
    "phone": phone,
    "national_identity_number": nationalIdentityNumber,
  };
}
