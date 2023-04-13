/// Contains a List of Booleans corresponding to the
/// List of recipient objects to be transferred.
class TransferResponse {
  List<bool> recipientStatus;

  TransferResponse(
      {required this.recipientStatus,});

  factory TransferResponse.fromJson(Map<String, dynamic>? json) => TransferResponse(
    recipientStatus: json?["data"],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = recipientStatus;
    return data;
  }
}
