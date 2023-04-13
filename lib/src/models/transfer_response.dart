/// Contains a List of Booleans corresponding to the
/// List of recipient objects to be transferred.

class TransferResponse {
  TransferResponse({
    this.data,
  });

  List<bool>? data;

  factory TransferResponse.fromJson(Map<String, dynamic> json) => TransferResponse(
    data: json["data"] == null ? [] : List<bool>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}

