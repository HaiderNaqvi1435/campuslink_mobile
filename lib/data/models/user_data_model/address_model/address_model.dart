class Address {
  String? street;
  String? city;
  String? state;
  String? zipcode;

  Address({this.street, this.city, this.state, this.zipcode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['city'] = city;
    data['state'] = state;
    data['zipcode'] = zipcode;
    return data;
  }
}