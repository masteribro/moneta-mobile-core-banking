class OnboardedBank {
  int? id;
  String? name;
  String? alias;
  String? code;

  OnboardedBank({this.id, this.name, this.alias, this.code});

  OnboardedBank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['alias'] = alias;
    data['code'] = code;
    return data;
  }
}
