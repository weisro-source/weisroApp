class YourBookingModel {
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
  const YourBookingModel(
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
  YourBookingModel copyWith(
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
    return YourBookingModel(
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

  static YourBookingModel fromJson(Map<String, Object?> json) {
    return YourBookingModel(
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
    return '''YourBookingModel(
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
    return other is YourBookingModel &&
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
  final Service? service;
  final List<Dates>? dates;
  final String? status;
  final num? totalPrice;
  final String? notes;
  final String? paymentMethod;
  final Address? address;
  final String? createdAt;
  const Docs(
      {this.id,
      this.service,
      this.dates,
      this.status,
      this.totalPrice,
      this.notes,
      this.paymentMethod,
      this.address,
      this.createdAt});
  Docs copyWith(
      {String? id,
      Service? service,
      List<Dates>? dates,
      String? status,
      num? totalPrice,
      String? notes,
      String? paymentMethod,
      Address? address,
      String? createdAt}) {
    return Docs(
        id: id ?? this.id,
        service: service ?? this.service,
        dates: dates ?? this.dates,
        status: status ?? this.status,
        totalPrice: totalPrice ?? this.totalPrice,
        notes: notes ?? this.notes,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        address: address ?? this.address,
        createdAt: createdAt ?? this.createdAt);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'service': service?.toJson(),
      'dates':
          dates?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'status': status,
      'total_price': totalPrice,
      'notes': notes,
      'payment_method': paymentMethod,
      'address': address?.toJson(),
      'createdAt': createdAt
    };
  }

  static Docs fromJson(Map<String, Object?> json) {
    return Docs(
        id: json['_id'] == null ? null : json['_id'] as String,
        service: json['service'] == null
            ? null
            : Service.fromJson(json['service'] as Map<String, Object?>),
        dates: json['dates'] == null
            ? null
            : (json['dates'] as List)
                .map<Dates>(
                    (data) => Dates.fromJson(data as Map<String, Object?>))
                .toList(),
        status: json['status'] == null ? null : json['status'] as String,
        totalPrice:
            json['total_price'] == null ? null : json['total_price'] as num,
        notes: json['notes'] == null ? null : json['notes'] as String,
        paymentMethod: json['payment_method'] == null
            ? null
            : json['payment_method'] as String,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, Object?>),
        createdAt:
            json['createdAt'] == null ? null : json['createdAt'] as String);
  }

  @override
  String toString() {
    return '''Docs(
                id:$id,
service:${service.toString()},
dates:${dates.toString()},
status:$status,
totalPrice:$totalPrice,
notes:$notes,
paymentMethod:$paymentMethod,
address:${address.toString()},
createdAt:$createdAt
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Docs &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.service == service &&
        other.dates == dates &&
        other.status == status &&
        other.totalPrice == totalPrice &&
        other.notes == notes &&
        other.paymentMethod == paymentMethod &&
        other.address == address &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, service, dates, status, totalPrice,
        notes, paymentMethod, address, createdAt);
  }
}

class Address {
  final String? id;
  const Address({this.id});
  Address copyWith({String? id}) {
    return Address(id: id ?? this.id);
  }

  Map<String, Object?> toJson() {
    return {'_id': id};
  }

  static Address fromJson(Map<String, Object?> json) {
    return Address(id: json['_id'] == null ? null : json['_id'] as String);
  }

  @override
  String toString() {
    return '''Address(
                id:$id
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Address &&
        other.runtimeType == runtimeType &&
        other.id == id;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id);
  }
}

class Dates {
  final String? date;
  final String? id;
  const Dates({this.date, this.id});
  Dates copyWith({String? date, String? id}) {
    return Dates(date: date ?? this.date, id: id ?? this.id);
  }

  Map<String, Object?> toJson() {
    return {'date': date, '_id': id};
  }

  static Dates fromJson(Map<String, Object?> json) {
    return Dates(
        date: json['date'] == null ? null : json['date'] as String,
        id: json['_id'] == null ? null : json['_id'] as String);
  }

  @override
  String toString() {
    return '''Dates(
                date:$date,
id:$id
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Dates &&
        other.runtimeType == runtimeType &&
        other.date == date &&
        other.id == id;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, date, id);
  }
}

class Service {
  final Location? location;
  final int? rateCount;
  final List<dynamic>? ratedBy;
  final String? id;
  final String? name;
  final String? description;
  final List<Days>? days;
  final int? dailyPrice;
  final int? hourlyPrice;
  final int? rate;
  final List<String>? images;
  final String? categoryId;
  final dynamic user;
  final String? date;
  final List<dynamic>? time;
  const Service(
      {this.location,
      this.rateCount,
      this.ratedBy,
      this.id,
      this.name,
      this.description,
      this.days,
      this.dailyPrice,
      this.hourlyPrice,
      this.rate,
      this.images,
      this.categoryId,
      this.user,
      this.date,
      this.time});
  Service copyWith(
      {Location? location,
      int? rateCount,
      List<dynamic>? ratedBy,
      String? id,
      String? name,
      String? description,
      List<Days>? days,
      int? dailyPrice,
      int? hourlyPrice,
      int? rate,
      List<String>? images,
      String? categoryId,
      dynamic user,
      String? date,
      List<dynamic>? time}) {
    return Service(
        location: location ?? this.location,
        rateCount: rateCount ?? this.rateCount,
        ratedBy: ratedBy ?? this.ratedBy,
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        days: days ?? this.days,
        dailyPrice: dailyPrice ?? this.dailyPrice,
        hourlyPrice: hourlyPrice ?? this.hourlyPrice,
        rate: rate ?? this.rate,
        images: images ?? this.images,
        categoryId: categoryId ?? this.categoryId,
        user: user ?? this.user,
        date: date ?? this.date,
        time: time ?? this.time);
  }

  Map<String, Object?> toJson() {
    return {
      'location': location?.toJson(),
      'rate_count': rateCount,
      'ratedBy': ratedBy,
      '_id': id,
      'name': name,
      'description': description,
      'days': days?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'daily_price': dailyPrice,
      'hourly_price': hourlyPrice,
      'rate': rate,
      'images': images,
      'category_id': categoryId,
      'user': user,
      'date': date,
      'time': time
    };
  }

  static Service fromJson(Map<String, Object?> json) {
    return Service(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, Object?>),
        rateCount:
            json['rate_count'] == null ? null : json['rate_count'] as int,
        ratedBy:
            json['ratedBy'] == null ? null : json['ratedBy'] as List<dynamic>,
        id: json['_id'] == null ? null : json['_id'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        days: json['days'] == null
            ? null
            : (json['days'] as List)
                .map<Days>(
                    (data) => Days.fromJson(data as Map<String, Object?>))
                .toList(),
        dailyPrice:
            json['daily_price'] == null ? null : json['daily_price'] as int,
        hourlyPrice:
            json['hourly_price'] == null ? null : json['hourly_price'] as int,
        rate: json['rate'] == null ? null : json['rate'] as int,
        images: json['images'] == null ? null : json['images'] as List<String>,
        categoryId:
            json['category_id'] == null ? null : json['category_id'] as String,
        user: json['user'] as dynamic,
        date: json['date'] == null ? null : json['date'] as String,
        time: json['time'] == null ? null : json['time'] as List<dynamic>);
  }

  @override
  String toString() {
    return '''Service(
                location:${location.toString()},
rateCount:$rateCount,
ratedBy:$ratedBy,
id:$id,
name:$name,
description:$description,
days:${days.toString()},
dailyPrice:$dailyPrice,
hourlyPrice:$hourlyPrice,
rate:$rate,
images:$images,
categoryId:$categoryId,
user:$user,
date:$date,
time:$time
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Service &&
        other.runtimeType == runtimeType &&
        other.location == location &&
        other.rateCount == rateCount &&
        other.ratedBy == ratedBy &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.days == days &&
        other.dailyPrice == dailyPrice &&
        other.hourlyPrice == hourlyPrice &&
        other.rate == rate &&
        other.images == images &&
        other.categoryId == categoryId &&
        other.user == user &&
        other.date == date &&
        other.time == time;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        location,
        rateCount,
        ratedBy,
        id,
        name,
        description,
        days,
        dailyPrice,
        hourlyPrice,
        rate,
        images,
        categoryId,
        user,
        date,
        time);
  }
}

class Days {
  final String? day;
  final String? start;
  final String? end;
  final String? id;
  const Days({this.day, this.start, this.end, this.id});
  Days copyWith({String? day, String? start, String? end, String? id}) {
    return Days(
        day: day ?? this.day,
        start: start ?? this.start,
        end: end ?? this.end,
        id: id ?? this.id);
  }

  Map<String, Object?> toJson() {
    return {'day': day, 'start': start, 'end': end, '_id': id};
  }

  static Days fromJson(Map<String, Object?> json) {
    return Days(
        day: json['day'] == null ? null : json['day'] as String,
        start: json['start'] == null ? null : json['start'] as String,
        end: json['end'] == null ? null : json['end'] as String,
        id: json['_id'] == null ? null : json['_id'] as String);
  }

  @override
  String toString() {
    return '''Days(
                day:$day,
start:$start,
end:$end,
id:$id
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Days &&
        other.runtimeType == runtimeType &&
        other.day == day &&
        other.start == start &&
        other.end == end &&
        other.id == id;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, day, start, end, id);
  }
}

class Location {
  final String? type;
  final List<double>? coordinates;
  final String? city;
  final String? country;
  final String? address;

  const Location({
    this.type,
    this.coordinates,
    this.city,
    this.country,
    this.address,
  });

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
      type: json['type'] == null ? null : json['type'] as String,
      coordinates: json['coordinates'] == null
          ? null
          : (json['coordinates'] as List<dynamic>)
              .map((e) => e as double)
              .toList(),
      city: json['city'] == null ? null : json['city'] as String,
      country: json['country'] == null ? null : json['country'] as String,
      address: json['address'] == null ? null : json['address'] as String,
    );
  }

  @override
  String toString() {
    return '''Location(
      type: $type,
      coordinates: $coordinates,
      city: $city,
      country: $country,
      address: $address,
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
