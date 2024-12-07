import 'package:weisro/feature/auth/data/models/user_client_model.dart';

class SuccessLoginModel {
  final UserClientModel? user;
  final String? token;
  const SuccessLoginModel({this.user, this.token});
  SuccessLoginModel copyWith({UserClientModel? user, String? token}) {
    return SuccessLoginModel(
        user: user ?? this.user, token: token ?? this.token);
  }

  Map<String, Object?> toJson() {
    return {'user': user?.toJson(), 'token': token};
  }

  static SuccessLoginModel fromJson(Map<String, Object?> json) {
    return SuccessLoginModel(
        user: json['user'] == null
            ? null
            : UserClientModel.fromJson(json['user'] as Map<String, Object?>),
        token: json['token'] == null ? null : json['token'] as String);
  }

  @override
  String toString() {
    return '''SuccessLoginModel(
                user:${user.toString()},
token:$token
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SuccessLoginModel &&
        other.runtimeType == runtimeType &&
        other.user == user &&
        other.token == token;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, user, token);
  }
}
