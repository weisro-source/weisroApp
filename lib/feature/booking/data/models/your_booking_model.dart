class YourBookingModel {
  final List<Docs>? docs;
  const YourBookingModel({this.docs});
  YourBookingModel copyWith({List<Docs>? docs}) {
    return YourBookingModel(docs: docs ?? this.docs);
  }

  Map<String, Object?> toJson() {
    return {
      'docs': docs?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static YourBookingModel fromJson(Map<String, Object?> json) {
    return YourBookingModel(
        docs: json['docs'] == null
            ? null
            : (json['docs'] as List)
                .map<Docs>(
                    (data) => Docs.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''YourBookingModel(
                docs:${docs.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is YourBookingModel &&
        other.runtimeType == runtimeType &&
        other.docs == docs;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, docs);
  }
}

class Docs {
  final String? id;
  final Service? service;
  final List<Dates>? dates;
  final bool? confirmed;
  final int? totalPrice;
  final String? notes;
  final String? paymentMethod;
  final String? createdAt;
  final Address? address;
  const Docs(
      {this.id,
      this.service,
      this.dates,
      this.confirmed,
      this.totalPrice,
      this.notes,
      this.paymentMethod,
      this.createdAt,
      this.address});
  Docs copyWith(
      {String? id,
      Service? service,
      List<Dates>? dates,
      bool? confirmed,
      int? totalPrice,
      String? notes,
      String? paymentMethod,
      String? createdAt,
      Address? address}) {
    return Docs(
        id: id ?? this.id,
        service: service ?? this.service,
        dates: dates ?? this.dates,
        confirmed: confirmed ?? this.confirmed,
        totalPrice: totalPrice ?? this.totalPrice,
        notes: notes ?? this.notes,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        createdAt: createdAt ?? this.createdAt,
        address: address ?? this.address);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'service': service?.toJson(),
      'dates':
          dates?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'confirmed': confirmed,
      'total_price': totalPrice,
      'notes': notes,
      'payment_method': paymentMethod,
      'createdAt': createdAt,
      'address': address?.toJson()
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
        confirmed: json['confirmed'] == null ? null : json['confirmed'] as bool,
        totalPrice:
            json['total_price'] == null ? null : json['total_price'] as int,
        notes: json['notes'] == null ? null : json['notes'] as String,
        paymentMethod: json['payment_method'] == null
            ? null
            : json['payment_method'] as String,
        createdAt:
            json['createdAt'] == null ? null : json['createdAt'] as String,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''Docs(
                id:$id,
service:${service.toString()},
dates:${dates.toString()},
confirmed:$confirmed,
totalPrice:$totalPrice,
notes:$notes,
paymentMethod:$paymentMethod,
createdAt:$createdAt,
address:${address.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Docs &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.service == service &&
        other.dates == dates &&
        other.confirmed == confirmed &&
        other.totalPrice == totalPrice &&
        other.notes == notes &&
        other.paymentMethod == paymentMethod &&
        other.createdAt == createdAt &&
        other.address == address;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, service, dates, confirmed, totalPrice,
        notes, paymentMethod, createdAt, address);
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
  final String? start;
  final String? end;
  final String? id;
  const Dates({this.date, this.start, this.end, this.id});
  Dates copyWith({String? date, String? start, String? end, String? id}) {
    return Dates(
        date: date ?? this.date,
        start: start ?? this.start,
        end: end ?? this.end,
        id: id ?? this.id);
  }

  Map<String, Object?> toJson() {
    return {'date': date, 'start': start, 'end': end, '_id': id};
  }

  static Dates fromJson(Map<String, Object?> json) {
    return Dates(
        date: json['date'] == null ? null : json['date'] as String,
        start: json['start'] == null ? null : json['start'] as String,
        end: json['end'] == null ? null : json['end'] as String,
        id: json['_id'] == null ? null : json['_id'] as String);
  }

  @override
  String toString() {
    return '''Dates(
                date:$date,
start:$start,
end:$end,
id:$id
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Dates &&
        other.runtimeType == runtimeType &&
        other.date == date &&
        other.start == start &&
        other.end == end &&
        other.id == id;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, date, start, end, id);
  }
}

class Service {
  final Location? location;
  final String? id;
  final String? name;
  final String? description;
  final List<String>? days;
  final int? dailyPrice;
  final Time? time;
  final int? hourlyPrice;
  final int? rate;
  final List<dynamic>? images;
  final String? categoryId;
  final String? date;
  const Service(
      {this.location,
      this.id,
      this.name,
      this.description,
      this.days,
      this.dailyPrice,
      this.time,
      this.hourlyPrice,
      this.rate,
      this.images,
      this.categoryId,
      this.date});
  Service copyWith(
      {Location? location,
      String? id,
      String? name,
      String? description,
      List<String>? days,
      int? dailyPrice,
      Time? time,
      int? hourlyPrice,
      int? rate,
      List<dynamic>? images,
      String? categoryId,
      String? date}) {
    return Service(
        location: location ?? this.location,
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        days: days ?? this.days,
        dailyPrice: dailyPrice ?? this.dailyPrice,
        time: time ?? this.time,
        hourlyPrice: hourlyPrice ?? this.hourlyPrice,
        rate: rate ?? this.rate,
        images: images ?? this.images,
        categoryId: categoryId ?? this.categoryId,
        date: date ?? this.date);
  }

  Map<String, Object?> toJson() {
    return {
      'location': location?.toJson(),
      '_id': id,
      'name': name,
      'description': description,
      'days': days,
      'daily_price': dailyPrice,
      'time': time?.toJson(),
      'hourly_price': hourlyPrice,
      'rate': rate,
      'images': images,
      'category_id': categoryId,
      'date': date
    };
  }

  static Service fromJson(Map<String, Object?> json) {
    return Service(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, Object?>),
        id: json['_id'] == null ? null : json['_id'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        days: json['days'] == null ? null : json['days'] as List<String>,
        dailyPrice:
            json['daily_price'] == null ? null : json['daily_price'] as int,
        time: json['time'] == null
            ? null
            : Time.fromJson(json['time'] as Map<String, Object?>),
        hourlyPrice:
            json['hourly_price'] == null ? null : json['hourly_price'] as int,
        rate: json['rate'] == null ? null : json['rate'] as int,
        images: json['images'] == null ? null : json['images'] as List<dynamic>,
        categoryId:
            json['category_id'] == null ? null : json['category_id'] as String,
        date: json['date'] == null ? null : json['date'] as String);
  }

  @override
  String toString() {
    return '''Service(
                location:${location.toString()},
id:$id,
name:$name,
description:$description,
days:$days,
dailyPrice:$dailyPrice,
time:${time.toString()},
hourlyPrice:$hourlyPrice,
rate:$rate,
images:$images,
categoryId:$categoryId,
date:$date
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Service &&
        other.runtimeType == runtimeType &&
        other.location == location &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.days == days &&
        other.dailyPrice == dailyPrice &&
        other.time == time &&
        other.hourlyPrice == hourlyPrice &&
        other.rate == rate &&
        other.images == images &&
        other.categoryId == categoryId &&
        other.date == date;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, location, id, name, description, days,
        dailyPrice, time, hourlyPrice, rate, images, categoryId, date);
  }
}

class Time {
  final String? start;
  final String? end;
  const Time({this.start, this.end});
  Time copyWith({String? start, String? end}) {
    return Time(start: start ?? this.start, end: end ?? this.end);
  }

  Map<String, Object?> toJson() {
    return {'start': start, 'end': end};
  }

  static Time fromJson(Map<String, Object?> json) {
    return Time(
        start: json['start'] == null ? null : json['start'] as String,
        end: json['end'] == null ? null : json['end'] as String);
  }

  @override
  String toString() {
    return '''Time(
                start:$start,
end:$end
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Time &&
        other.runtimeType == runtimeType &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, start, end);
  }
}

class Location {
  final List<double>? coordinates;
  final String? type;
  const Location({this.coordinates, this.type});
  Location copyWith({List<double>? coordinates, String? type}) {
    return Location(
        coordinates: coordinates ?? this.coordinates, type: type ?? this.type);
  }

  Map<String, Object?> toJson() {
    return {'coordinates': coordinates, 'type': type};
  }

  static Location fromJson(Map<String, Object?> json) {
    return Location(
        coordinates: json['coordinates'] == null
            ? null
            : json['coordinates'] as List<double>,
        type: json['type'] == null ? null : json['type'] as String);
  }

  @override
  String toString() {
    return '''Location(
                coordinates:$coordinates,
type:$type
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Location &&
        other.runtimeType == runtimeType &&
        other.coordinates == coordinates &&
        other.type == type;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, coordinates, type);
  }
}
