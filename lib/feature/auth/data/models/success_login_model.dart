class SuccessLoginModel {
  final String? name;
  final String? token;
  const SuccessLoginModel({this.name, this.token});
  SuccessLoginModel copyWith({String? name, String? token}) {
    return SuccessLoginModel(
        name: name ?? this.name, token: token ?? this.token);
  }

  Map<String, Object?> toJson() {
    return {'name': name, 'token': token};
  }

  static SuccessLoginModel fromJson(Map<String, Object?> json) {
    return SuccessLoginModel(
        name: json['name'] == null ? null : json['name'] as String,
        token: json['token'] == null ? null : json['token'] as String);
  }

  @override
  String toString() {
    return '''SuccessLoginModel(
                name:$name,
token:$token
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SuccessLoginModel &&
        other.runtimeType == runtimeType &&
        other.name == name &&
        other.token == token;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, token);
  }
}
