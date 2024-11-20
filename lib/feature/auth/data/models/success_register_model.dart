class SuccessRegisterModel {
  final String? id;
  final String? message;
  const SuccessRegisterModel({this.id, this.message});
  SuccessRegisterModel copyWith({String? id, String? message}) {
    return SuccessRegisterModel(
        id: id ?? this.id, message: message ?? this.message);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'message': message};
  }

  static SuccessRegisterModel fromJson(Map<String, Object?> json) {
    return SuccessRegisterModel(
        id: json['id'] == null ? null : json['id'] as String,
        message: json['message'] == null ? null : json['message'] as String);
  }

  @override
  String toString() {
    return '''SuccessRegisterModel(
                id:$id,
message:$message
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SuccessRegisterModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.message == message;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, message);
  }
}
