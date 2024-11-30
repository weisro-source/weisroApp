class UserClientModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final Address? address;
  const UserClientModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.address});
  UserClientModel copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      String? email,
      String? phone,
      Address? address}) {
    return UserClientModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'address': address?.toJson()
    };
  }

  static UserClientModel fromJson(Map<String, Object?> json) {
    return UserClientModel(
        id: json['_id'] == null ? null : json['_id'] as String,
        firstName:
            json['first_name'] == null ? null : json['first_name'] as String,
        lastName:
            json['last_name'] == null ? null : json['last_name'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        phone: json['phone'] == null ? null : json['phone'] as String,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''UserClientModel(
                id:$id,
firstName:$firstName,
lastName:$lastName,
email:$email,
phone:$phone,
address:${address.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UserClientModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phone == phone &&
        other.address == address;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, firstName, lastName, email, phone, address);
  }
}

class Address {
  final String? city;
  final String? country;
  final String? postalCode;
  final String? street;
  final String? houseNumber;
  const Address(
      {this.city,
      this.country,
      this.postalCode,
      this.street,
      this.houseNumber});
  Address copyWith(
      {String? city,
      String? country,
      String? postalCode,
      String? street,
      String? houseNumber}) {
    return Address(
        city: city ?? this.city,
        country: country ?? this.country,
        postalCode: postalCode ?? this.postalCode,
        street: street ?? this.street,
        houseNumber: houseNumber ?? this.houseNumber);
  }

  Map<String, Object?> toJson() {
    return {
      'city': city,
      'country': country,
      'postal_code': postalCode,
      'street': street,
      'house_number': houseNumber
    };
  }

  static Address fromJson(Map<String, Object?> json) {
    return Address(
        city: json['city'] == null ? null : json['city'] as String,
        country: json['country'] == null ? null : json['country'] as String,
        postalCode:
            json['postal_code'] == null ? null : json['postal_code'] as String,
        street: json['street'] == null ? null : json['street'] as String,
        houseNumber: json['house_number'] == null
            ? null
            : json['house_number'] as String);
  }

  @override
  String toString() {
    return '''Address(
                city:$city,
country:$country,
postalCode:$postalCode,
street:$street,
houseNumber:$houseNumber
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Address &&
        other.runtimeType == runtimeType &&
        other.city == city &&
        other.country == country &&
        other.postalCode == postalCode &&
        other.street == street &&
        other.houseNumber == houseNumber;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, city, country, postalCode, street, houseNumber);
  }
}
