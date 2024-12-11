class FavoriteModel {
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
  const FavoriteModel(
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
  FavoriteModel copyWith(
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
    return FavoriteModel(
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

  static FavoriteModel fromJson(Map<String, Object?> json) {
    return FavoriteModel(
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
    return '''FavoriteModel(
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
    return other is FavoriteModel &&
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
  final Service? service;
  final String? type;
  const Docs({this.service, this.type});
  Docs copyWith({Service? service, String? type}) {
    return Docs(service: service ?? this.service, type: type ?? this.type);
  }

  Map<String, Object?> toJson() {
    return {'service': service?.toJson(), 'type': type};
  }

  static Docs fromJson(Map<String, Object?> json) {
    return Docs(
        service: json['service'] == null
            ? null
            : Service.fromJson(json['service'] as Map<String, Object?>),
        type: json['type'] == null ? null : json['type'] as String);
  }

  @override
  String toString() {
    return '''Docs(
                service:${service.toString()},
type:$type
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Docs &&
        other.runtimeType == runtimeType &&
        other.service == service &&
        other.type == type;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, service, type);
  }
}

class Service {
  final int? rate;
  final String? id;
  final String? name;
  final List<String>? images;
  final Location? location;
  final int? price;
  const Service(
      {this.rate, this.id, this.name, this.images, this.location, this.price});
  Service copyWith(
      {int? rate,
      String? id,
      String? name,
      List<String>? images,
      Location? location,
      int? price}) {
    return Service(
        rate: rate ?? this.rate,
        id: id ?? this.id,
        name: name ?? this.name,
        images: images ?? this.images,
        location: location ?? this.location,
        price: price ?? this.price);
  }

  Map<String, Object?> toJson() {
    return {
      'rate': rate,
      '_id': id,
      'name': name,
      'images': images,
      'location': location?.toJson(),
      'price': price
    };
  }

  static Service fromJson(Map<String, Object?> json) {
    return Service(
        rate: json['rate'] == null ? null : json['rate'] as int,
        id: json['_id'] == null ? null : json['_id'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        images: _parseImages(json['images']),
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, Object?>),
        price: json['price'] == null ? null : json['price'] as int);
  }

  static List<String>? _parseImages(dynamic imagesJson) {
    if (imagesJson is String) {
      // If `images` is a single string, wrap it in a list
      return [imagesJson];
    } else if (imagesJson is List) {
      // If `images` is already a list, cast elements to String
      return imagesJson.map((e) => e as String).toList();
    }
    return null; // Return null for unexpected cases
  }

  @override
  String toString() {
    return '''Service(
                rate:$rate,
id:$id,
name:$name,
images:$images,
location:${location.toString()},
price:$price
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Service &&
        other.runtimeType == runtimeType &&
        other.rate == rate &&
        other.id == id &&
        other.name == name &&
        other.images == images &&
        other.location == location &&
        other.price == price;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, rate, id, name, images, location, price);
  }
}

class Location {
  final int? latitude;
  final int? longitude;
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
        latitude: json['latitude'] == null ? null : json['latitude'] as int,
        longitude: json['longitude'] == null ? null : json['longitude'] as int);
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
