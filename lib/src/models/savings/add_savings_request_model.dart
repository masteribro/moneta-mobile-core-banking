// To parse this JSON data, do
//
//     final addSavingsRequestModel = addSavingsRequestModelFromJson(jsonString);

import 'dart:convert';

AddSavingsRequestModel addSavingsRequestModelFromJson(String str) => AddSavingsRequestModel.fromJson(json.decode(str));

String addSavingsRequestModelToJson(AddSavingsRequestModel data) => json.encode(data.toJson());

class AddSavingsRequestModel {
  String? bankId;
  String? accountTypeId;
  String? bvn;
  String? lastName;
  String? otherNames;
  String? gender;
  String? placeOfBirth;
  String? dateOfBirth;
  String? address;
  String? phone;

  AddSavingsRequestModel({
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
  });

  factory AddSavingsRequestModel.fromJson(Map<String, dynamic> json) => AddSavingsRequestModel(
    bankId: json["bank_id"],
    accountTypeId: json["account_type_id"],
    bvn: json["bvn"],
    lastName: json["last_name"],
    otherNames: json["other_names"],
    gender: json["gender"],
    placeOfBirth: json["place_of_birth"],
    dateOfBirth: json["date_of_birth"],
    address: json["address"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "bank_id": bankId,
    "account_type_id": accountTypeId,
    "bvn": bvn,
    "last_name": lastName,
    "other_names": otherNames,
    "gender": gender,
    "place_of_birth": placeOfBirth,
    "date_of_birth": dateOfBirth,
    "address": address,
    "phone": phone,
  };
}
