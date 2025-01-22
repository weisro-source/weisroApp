class Address {
  final String? city;
  final String? country;
  final String? postalCode;
  final String? houseNumber;
  final String? street;
  final String? state;
  const Address(
      {this.city,
      this.country,
      this.postalCode,
      this.houseNumber,
      this.state,
      this.street});
  Address copyWith(
      {String? city,
      String? country,
      String? postalCode,
      String? houseNumber,
      String? street}) {
    return Address(
        city: city ?? this.city,
        country: country ?? this.country,
        postalCode: postalCode ?? this.postalCode,
        houseNumber: houseNumber ?? this.houseNumber,
        street: street ?? this.street);
  }

  Map<String, Object?> toJson() {
    return {
      'city': city,
      'country': country,
      'postal_code': postalCode,
      'house_number': houseNumber,
      'street': street,
      "state": state
    };
  }

  static Address fromJson(Map<String, Object?> json) {
    return Address(
        city: json['city'] == null ? null : json['city'] as String,
        country: json['country'] == null ? null : json['country'] as String,
        postalCode:
            json['postal_code'] == null ? null : json['postal_code'] as String,
        houseNumber: json['house_number'] == null
            ? null
            : json['house_number'] as String,
        street: json['street'] == null ? null : json['street'] as String);
  }

  @override
  String toString() {
    return '''Address(
                city:$city,
country:$country,
postalCode:$postalCode,
houseNumber:$houseNumber,
street:$street
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Address &&
        other.runtimeType == runtimeType &&
        other.city == city &&
        other.country == country &&
        other.postalCode == postalCode &&
        other.houseNumber == houseNumber &&
        other.street == street;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, city, country, postalCode, houseNumber, street);
  }
}
