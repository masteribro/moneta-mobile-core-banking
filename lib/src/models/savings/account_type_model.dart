class AccountTypeModel {
  int? id;
  String? name;
  String? code;
  int? bankId;
  DateTime? createdAt;
  DateTime? updatedAt;
  AccountTypeBank? bank;

  AccountTypeModel({
    this.id,
    this.name,
    this.code,
    this.bankId,
    this.createdAt,
    this.updatedAt,
    this.bank,
  });

  factory AccountTypeModel.fromJson(Map<String, dynamic> json) => AccountTypeModel(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    bankId: json["bank_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    bank: json["bank"] == null ? null : AccountTypeBank.fromJson(json["bank"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "bank_id": bankId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "bank": bank?.toJson(),
  };
}

class AccountTypeBank {
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

  AccountTypeBank({
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

  factory AccountTypeBank.fromJson(Map<String, dynamic> json) => AccountTypeBank(
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
