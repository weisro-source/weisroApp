import 'address_model.dart';

class UserClientModel {
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? password;
  final Address? address;
  final String? countryCode;
  final Role? role; // Add the role field

  const UserClientModel(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.password,
      this.countryCode,
      this.address,
      this.role});

  UserClientModel copyWith(
      {String? firstName,
      String? lastName,
      String? email,
      String? phone,
      String? password,
      Address? address,
      Role? role}) {
    return UserClientModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        address: address ?? this.address,
        role: role ?? this.role);
  }

  Map<String, dynamic> loginBody() {
    return {
      "email": email,
      "password": password,
    };
  }

  Map<String, Object?> toJson() {
    return {
      'userId': userId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'password': password,
      'address': address?.toJson(),
      'countryCode': countryCode,
      'role': role?.toJson(), // Include role in toJson
    };
  }

  static UserClientModel fromJson(Map<String, Object?> json) {
    return UserClientModel(
        userId: json['_id'] == null ? null : json['_id'] as String,
        firstName:
            json['first_name'] == null ? null : json['first_name'] as String,
        lastName:
            json['last_name'] == null ? null : json['last_name'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        phone: json['phone'] == null ? null : json['phone'] as String,
        password: json['password'] == null ? null : json['password'] as String,
        countryCode:
            json['countryCode'] == null ? null : json['countryCode'] as String,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, Object?>),
        role: json['role'] == null
            ? null
            : Role.fromJson(
                json['role'] as Map<String, Object?>)); // Parse role
  }

  @override
  String toString() {
    return '''UserClientModel(
                userId:$userId,
                firstName:$firstName,
                lastName:$lastName,
                email:$email,
                phone:$phone,
                password:$password,
                address:${address.toString()},
                role:${role.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UserClientModel &&
        other.runtimeType == runtimeType &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phone == phone &&
        other.password == password &&
        other.address == address &&
        other.role == role;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, firstName, lastName, email, phone, password,
        address, role);
  }
}

class Role {
  final String? id;
  final String? name;

  const Role({this.id, this.name});

  Role copyWith({String? id, String? name}) {
    return Role(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }

  static Role fromJson(Map<String, Object?> json) {
    return Role(
      id: json['_id'] == null ? null : json['_id'] as String,
      name: json['name'] == null ? null : json['name'] as String,
    );
  }
}
