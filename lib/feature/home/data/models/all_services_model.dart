class AllServicesModel {
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

  const AllServicesModel({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  AllServicesModel copyWith({
    List<Docs>? docs,
    int? totalDocs,
    int? limit,
    int? totalPages,
    int? page,
    int? pagingCounter,
    bool? hasPrevPage,
    bool? hasNextPage,
    dynamic prevPage,
    dynamic nextPage,
  }) {
    return AllServicesModel(
      docs: docs ?? this.docs,
      totalDocs: totalDocs ?? this.totalDocs,
      limit: limit ?? this.limit,
      totalPages: totalPages ?? this.totalPages,
      page: page ?? this.page,
      pagingCounter: pagingCounter ?? this.pagingCounter,
      hasPrevPage: hasPrevPage ?? this.hasPrevPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      prevPage: prevPage ?? this.prevPage,
      nextPage: nextPage ?? this.nextPage,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'docs': docs?.map((data) => data.toJson()).toList(),
      'totalDocs': totalDocs,
      'limit': limit,
      'totalPages': totalPages,
      'page': page,
      'pagingCounter': pagingCounter,
      'hasPrevPage': hasPrevPage,
      'hasNextPage': hasNextPage,
      'prevPage': prevPage,
      'nextPage': nextPage,
    };
  }

  static AllServicesModel fromJson(Map<String, Object?> json) {
    return AllServicesModel(
      docs: json['docs'] == null
          ? null
          : (json['docs'] as List)
              .map((data) => Docs.fromJson(data as Map<String, Object?>))
              .toList(),
      totalDocs: json['totalDocs'] as int?,
      limit: json['limit'] as int?,
      totalPages: json['totalPages'] as int?,
      page: json['page'] as int?,
      pagingCounter: json['pagingCounter'] as int?,
      hasPrevPage: json['hasPrevPage'] as bool?,
      hasNextPage: json['hasNextPage'] as bool?,
      prevPage: json['prevPage'],
      nextPage: json['nextPage'],
    );
  }

  @override
  String toString() {
    return '''AllServicesModel(
      docs: $docs,
      totalDocs: $totalDocs,
      limit: $limit,
      totalPages: $totalPages,
      page: $page,
      pagingCounter: $pagingCounter,
      hasPrevPage: $hasPrevPage,
      hasNextPage: $hasNextPage,
      prevPage: $prevPage,
      nextPage: $nextPage
    )''';
  }

  @override
  bool operator ==(Object other) {
    return other is AllServicesModel &&
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
    return Object.hash(
      runtimeType,
      docs,
      totalDocs,
      limit,
      totalPages,
      page,
      pagingCounter,
      hasPrevPage,
      hasNextPage,
      prevPage,
      nextPage,
    );
  }
}

class Docs {
  final String? id;
  final String? name;
  final List<String>? images;
  final double? price;
  final bool? isFavorite;
  final Location? location;

  const Docs({
    this.id,
    this.name,
    this.images,
    this.price,
    this.isFavorite,
    this.location,
  });

  Docs copyWith({
    String? id,
    String? name,
    List<String>? images,
    double? price,
    bool? isFavorite,
    Location? location,
  }) {
    return Docs(
      id: id ?? this.id,
      name: name ?? this.name,
      images: images ?? this.images,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      location: location ?? this.location,
    );
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'name': name,
      'images': images,
      'price': price,
      'isFavorite': isFavorite,
      'location': location?.toJson(),
    };
  }

  static Docs fromJson(Map<String, Object?> json) {
    return Docs(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      images: _parseImages(json['images']),
      price: (json['price'] as num?)?.toDouble(),
      isFavorite: json['isFavorite'] as bool?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, Object?>),
    );
  }

  static List<String>? _parseImages(dynamic imagesJson) {
    if (imagesJson is String) {
      return [imagesJson];
    } else if (imagesJson is List) {
      return imagesJson.map((e) => e as String).toList();
    }
    return null;
  }

  @override
  String toString() {
    return '''Docs(
      id: $id,
      name: $name,
      images: $images,
      price: $price,
      isFavorite: $isFavorite,
      location: $location
    )''';
  }

  @override
  bool operator ==(Object other) {
    return other is Docs &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.images == images &&
        other.price == price &&
        other.isFavorite == isFavorite &&
        other.location == location;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, name, images, price, isFavorite, location);
  }
}

class Location {
  final String? type;
  final List<double>? coordinates;
  final String? city;
  final String? country;
  final String? address;

  const Location(
      {this.type, this.coordinates, this.city, this.country, this.address});

  Location copyWith({
    String? type,
    List<double>? coordinates,
    String? city,
    String? country,
    String? address,
  }) {
    return Location(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates,
      city: city ?? this.city,
      country: country ?? this.country,
      address: address ?? this.address,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
      'city': city,
      'country': country,
      'address': address,
    };
  }

  static Location fromJson(Map<String, Object?> json) {
    return Location(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      city: json['city'] as String?,
      country: json['country'] as String?,
      address: json['address'] as String?,
    );
  }

  @override
  String toString() {
    return '''Location(
      type: $type,
      coordinates: $coordinates,
      city: $city,
      country: $country,
      address: $address
    )''';
  }

  @override
  bool operator ==(Object other) {
    return other is Location &&
        other.runtimeType == runtimeType &&
        other.type == type &&
        other.coordinates == coordinates &&
        other.city == city &&
        other.country == country &&
        other.address == address;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, type, coordinates, city, country, address);
  }
}
