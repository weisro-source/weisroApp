class LastServicesModel {
  final List<Docs>? docs;
  final int? totalDocs;
  final int? limit;
  final int? totalPages;
  final int? page;
  final int? pagingCounter;
  final bool? hasPrevPage;
  final bool? hasNextPage;
  final dynamic prevPage;
  final int? nextPage;
  const LastServicesModel(
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
  LastServicesModel copyWith(
      {List<Docs>? docs,
      int? totalDocs,
      int? limit,
      int? totalPages,
      int? page,
      int? pagingCounter,
      bool? hasPrevPage,
      bool? hasNextPage,
      dynamic prevPage,
      int? nextPage}) {
    return LastServicesModel(
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

  static LastServicesModel fromJson(Map<String, Object?> json) {
    return LastServicesModel(
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
        nextPage: json['nextPage'] == null ? null : json['nextPage'] as int);
  }

  @override
  String toString() {
    return '''LastServicesModel(
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
    return other is LastServicesModel &&
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
  final List<String>? images; // Keep as a List<String>
  final CategoryId? categoryId;
  final Location? location;
  final int? price;

  const Docs({
    this.id,
    this.name,
    this.images,
    this.categoryId,
    this.location,
    this.price,
  });

  Docs copyWith({
    String? id,
    String? name,
    List<String>? images,
    CategoryId? categoryId,
    Location? location,
    int? price,
  }) {
    return Docs(
      id: id ?? this.id,
      name: name ?? this.name,
      images: images ?? this.images,
      categoryId: categoryId ?? this.categoryId,
      location: location ?? this.location,
      price: price ?? this.price,
    );
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'name': name,
      'images': images,
      'category_id': categoryId?.toJson(),
      'location': location?.toJson(),
      'price': price,
    };
  }

  static Docs fromJson(Map<String, Object?> json) {
    return Docs(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      images: _parseImages(json['images']), // Use the helper function
      categoryId: json['category_id'] == null
          ? null
          : CategoryId.fromJson(json['category_id'] as Map<String, Object?>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, Object?>),
      price: json['price'] as int?,
    );
  }

  static List<String>? _parseImages(dynamic imagesJson) {
    // Handle both String and List<String> cases
    if (imagesJson is String) {
      return [imagesJson]; // Wrap string in a list
    } else if (imagesJson is List) {
      return imagesJson.map((e) => e as String).toList();
    }
    return null; // Default case if neither
  }

  @override
  String toString() {
    return '''Docs(
      id: $id,
      name: $name,
      images: $images,
      categoryId: ${categoryId.toString()},
      location: ${location.toString()},
      price: $price
    )''';
  }

  @override
  bool operator ==(Object other) {
    return other is Docs &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.images == images &&
        other.categoryId == categoryId &&
        other.location == location &&
        other.price == price;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      id,
      name,
      images,
      categoryId,
      location,
      price,
    );
  }
}

class Location {
  final num? latitude;
  final num? longitude;
  const Location({this.latitude, this.longitude});
  Location copyWith({int? latitude, int? longitude}) {
    return Location(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude);
  }

  Map<String, Object?> toJson() {
    return {'latitude': latitude, 'longitude': longitude};
  }

  static Location fromJson(Map<String, Object?> json) {
    return Location(
        latitude: json['latitude'] == null ? null : json['latitude'] as num,
        longitude: json['longitude'] == null ? null : json['longitude'] as num);
  }

  @override
  String toString() {
    return '''Location(
                latitude:$latitude,
longitude:$longitude
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Location &&
        other.runtimeType == runtimeType &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, latitude, longitude);
  }
}

class CategoryId {
  final String? name;
  final String? image;
  final String? type;
  const CategoryId({this.name, this.image, this.type});
  CategoryId copyWith({String? name, String? image, String? type}) {
    return CategoryId(
        name: name ?? this.name,
        image: image ?? this.image,
        type: type ?? this.type);
  }

  Map<String, Object?> toJson() {
    return {'name': name, 'image': image, 'type': type};
  }

  static CategoryId fromJson(Map<String, Object?> json) {
    return CategoryId(
        name: json['name'] == null ? null : json['name'] as String,
        image: json['image'] == null ? null : json['image'] as String,
        type: json['type'] == null ? null : json['type'] as String);
  }

  @override
  String toString() {
    return '''CategoryId(
                name:$name,
image:$image,
type:$type
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryId &&
        other.runtimeType == runtimeType &&
        other.name == name &&
        other.image == image &&
        other.type == type;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, image, type);
  }
}
