class AllAccountModel {
  int? id;
  String? accountName;
  String? accountNumber;
  int? aggregator;
  int? userId;
  int? bankId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic credentials;
  int? accountTypeId;
  AllAccountBank? bank;
  AccountType? accountType;

  AllAccountModel({
    this.id,
    this.accountName,
    this.accountNumber,
    this.aggregator,
    this.userId,
    this.bankId,
    this.createdAt,
    this.updatedAt,
    this.credentials,
    this.accountTypeId,
    this.bank,
    this.accountType,
  });

  factory AllAccountModel.fromJson(Map<String, dynamic> json) => AllAccountModel(
    id: json["id"],
    accountName: json["account_name"],
    accountNumber: json["account_number"],
    aggregator: json["aggregator"],
    userId: json["user_id"],
    bankId: json["bank_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    credentials: json["credentials"],
    accountTypeId: json["account_type_id"],
    bank: json["bank"] == null ? null : AllAccountBank.fromJson(json["bank"]),
    accountType: json["account_type"] == null ? null : AccountType.fromJson(json["account_type"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "account_name": accountName,
    "account_number": accountNumber,
    "aggregator": aggregator,
    "user_id": userId,
    "bank_id": bankId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "credentials": credentials,
    "account_type_id": accountTypeId,
    "bank": bank?.toJson(),
    "account_type": accountType?.toJson(),
  };
}

class AccountType {
  int? id;
  String? name;
  String? code;
  int? bankId;
  DateTime? createdAt;
  DateTime? updatedAt;

  AccountType({
    this.id,
    this.name,
    this.code,
    this.bankId,
    this.createdAt,
    this.updatedAt,
  });

  factory AccountType.fromJson(Map<String, dynamic> json) => AccountType(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    bankId: json["bank_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "bank_id": bankId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class AllAccountBank {
  int? id;
  String? name;
  String? alias;
  String? code;
  String? url;
  int? isActive;
  String? tokenPath;
  String? balancePath;
  String? transferPath;
  String? transferInterPath;
  String? metadata;
  dynamic createdAt;
  dynamic updatedAt;

  AllAccountBank({
    this.id,
    this.name,
    this.alias,
    this.code,
    this.url,
    this.isActive,
    this.tokenPath,
    this.balancePath,
    this.transferPath,
    this.transferInterPath,
    this.metadata,
    this.createdAt,
    this.updatedAt,
  });

  factory AllAccountBank.fromJson(Map<String, dynamic> json) => AllAccountBank(
    id: json["id"],
    name: json["name"],
    alias: json["alias"],
    code: json["code"],
    url: json["url"],
    isActive: json["is_active"],
    tokenPath: json["token_path"],
    balancePath: json["balance_path"],
    transferPath: json["transfer_path"],
    transferInterPath: json["transfer_inter_path"],
    metadata: json["metadata"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "alias": alias,
    "code": code,
    "url": url,
    "is_active": isActive,
    "token_path": tokenPath,
    "balance_path": balancePath,
    "transfer_path": transferPath,
    "transfer_inter_path": transferInterPath,
    "metadata": metadata,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
