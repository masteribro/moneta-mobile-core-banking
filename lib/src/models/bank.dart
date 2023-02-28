class Bank {
  String? name;
  String? slug;
  String? code;
  String? ussd;

  Bank({this.name, this.slug, this.code, this.ussd});

  @override
  String toString() {
    return name.toString();
  }

  Bank.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    code = json['code'];
    ussd = json['ussd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['code'] = code;
    data['ussd'] = ussd;
    return data;
  }
}