class WorkerTags {
  final List<Doc>? docs;

  const WorkerTags({this.docs});

  WorkerTags copyWith({List<Doc>? docs}) {
    return WorkerTags(docs: docs ?? this.docs);
  }

  Map<String, Object?> toJson() {
    return {
      'docs': docs?.map((doc) => doc.toJson()).toList(),
    };
  }

  static WorkerTags fromJson(List<dynamic> json) {
    return WorkerTags(
      docs: json
          .map<Doc>((data) => Doc.fromJson(data as Map<String, Object?>))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'WorkerTags(docs: $docs)';
  }

  @override
  bool operator ==(Object other) {
    return other is WorkerTags &&
        other.runtimeType == runtimeType &&
        other.docs == docs;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, docs);
  }
}

class Doc {
  final String? id;
  final String? name;

  const Doc({this.id, this.name});

  Doc copyWith({String? id, String? name}) {
    return Doc(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }

  static Doc fromJson(Map<String, Object?> json) {
    return Doc(
      id: json['_id'] == null ? null : json['_id'] as String,
      name: json['name'] == null ? null : json['name'] as String,
    );
  }

  @override
  String toString() {
    return 'Doc(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return other is Doc &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name);
  }
}
