  class CategoryModel {
    final List<Docs>? docs;
    final int? totalDocs;
    final int? limit;
    final int? totalPages;
    final int? page;
    final int? pagingCounter;
    final bool? hasPrevPage;
    final bool? hasNextPage;
    final dynamic prevPage;
    final dynamic nextPage;
    const CategoryModel(
        {this.docs,
        this.totalDocs,
        this.limit,
        this.totalPages,
        this.page,
        this.pagingCounter,
        this.hasPrevPage,
        this.hasNextPage,
        this.prevPage,
        this.nextPage});
    CategoryModel copyWith(
        {List<Docs>? docs,
        int? totalDocs,
        int? limit,
        int? totalPages,
        int? page,
        int? pagingCounter,
        bool? hasPrevPage,
        bool? hasNextPage,
        dynamic prevPage,
        dynamic nextPage}) {
      return CategoryModel(
          docs: docs ?? this.docs,
          totalDocs: totalDocs ?? this.totalDocs,
          limit: limit ?? this.limit,
          totalPages: totalPages ?? this.totalPages,
          page: page ?? this.page,
          pagingCounter: pagingCounter ?? this.pagingCounter,
          hasPrevPage: hasPrevPage ?? this.hasPrevPage,
          hasNextPage: hasNextPage ?? this.hasNextPage,
          prevPage: prevPage ?? this.prevPage,
          nextPage: nextPage ?? this.nextPage);
    }
  
    Map<String, Object?> toJson() {
      return {
        'docs': docs?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
        'totalDocs': totalDocs,
        'limit': limit,
        'totalPages': totalPages,
        'page': page,
        'pagingCounter': pagingCounter,
        'hasPrevPage': hasPrevPage,
        'hasNextPage': hasNextPage,
        'prevPage': prevPage,
        'nextPage': nextPage
      };
    }
  
    static CategoryModel fromJson(Map<String, Object?> json) {
      return CategoryModel(
          docs: json['docs'] == null
              ? null
              : (json['docs'] as List)
                  .map<Docs>(
                      (data) => Docs.fromJson(data as Map<String, Object?>))
                  .toList(),
          totalDocs: json['totalDocs'] == null ? null : json['totalDocs'] as int,
          limit: json['limit'] == null ? null : json['limit'] as int,
          totalPages:
              json['totalPages'] == null ? null : json['totalPages'] as int,
          page: json['page'] == null ? null : json['page'] as int,
          pagingCounter:
              json['pagingCounter'] == null ? null : json['pagingCounter'] as int,
          hasPrevPage:
              json['hasPrevPage'] == null ? null : json['hasPrevPage'] as bool,
          hasNextPage:
              json['hasNextPage'] == null ? null : json['hasNextPage'] as bool,
          prevPage: json['prevPage'] as dynamic,
          nextPage: json['nextPage'] as dynamic);
    }
  
    @override
    String toString() {
      return '''CategoryModel(
                  docs:${docs.toString()},
  totalDocs:$totalDocs,
  limit:$limit,
  totalPages:$totalPages,
  page:$page,
  pagingCounter:$pagingCounter,
  hasPrevPage:$hasPrevPage,
  hasNextPage:$hasNextPage,
  prevPage:$prevPage,
  nextPage:$nextPage
      ) ''';
    }
  
    @override
    bool operator ==(Object other) {
      return other is CategoryModel &&
          other.runtimeType == runtimeType &&
          other.docs == docs &&
          other.totalDocs == totalDocs &&
          other.limit == limit &&
          other.totalPages == totalPages &&
          other.page == page &&
          other.pagingCounter == pagingCounter &&
          other.hasPrevPage == hasPrevPage &&
          other.hasNextPage == hasNextPage &&
          other.prevPage == prevPage &&
          other.nextPage == nextPage;
    }
  
    @override
    int get hashCode {
      return Object.hash(runtimeType, docs, totalDocs, limit, totalPages, page,
          pagingCounter, hasPrevPage, hasNextPage, prevPage, nextPage);
    }
  }
  
  class Docs {
    final String? id;
    final String? name;
    final String? image;
    final String? type;
    const Docs({this.id, this.name, this.image, this.type});
    Docs copyWith({String? id, String? name, String? image, String? type}) {
      return Docs(
          id: id ?? this.id,
          name: name ?? this.name,
          image: image ?? this.image,
          type: type ?? this.type);
    }
  
    Map<String, Object?> toJson() {
      return {'_id': id, 'name': name, 'image': image, 'type': type};
    }
  
    static Docs fromJson(Map<String, Object?> json) {
      return Docs(
          id: json['_id'] == null ? null : json['_id'] as String,
          name: json['name'] == null ? null : json['name'] as String,
          image: json['image'] == null ? null : json['image'] as String,
          type: json['type'] == null ? null : json['type'] as String);
    }
  
    @override
    String toString() {
      return '''Docs(
                  id:$id,
  name:$name,
  image:$image,
  type:$type
      ) ''';
    }

  @override
  bool operator ==(Object other) {
    return other is Docs &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.type == type;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, image, type);
  }
}
