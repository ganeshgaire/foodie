class Address {
  int id;
  String deliveryArea;
  String completeAddress;
  dynamic contactNumber;
  String deliveryInstructions;
  double lat;
  double lng;
  String nickname;

  Address(
      {this.id,
      this.deliveryArea,
      this.completeAddress,
      this.contactNumber,
      this.deliveryInstructions,
      this.lat,
      this.lng,
      this.nickname});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      deliveryArea: json['delivery_area'],
      completeAddress: json['complete_address'],
      contactNumber: json['contact_number'],
      deliveryInstructions: json['delivery_instructions'],
      lat: json['latitude'],
      lng: json['longitude'],
      nickname: json['nickname'],
    );
  }
}
