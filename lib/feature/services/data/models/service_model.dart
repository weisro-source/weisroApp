class ServiceModel {
  final Service? service;
  final bool? isFavorite;

  const ServiceModel({this.service, this.isFavorite});

  ServiceModel copyWith({Service? service, bool? isFavorite}) {
    return ServiceModel(
        service: service ?? this.service,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  Map<String, Object?> toJson() {
    return {'service': service?.toJson(), 'isFavorite': isFavorite};
  }

  static ServiceModel fromJson(Map<String, Object?> json) {
    return ServiceModel(
      service: json['name'] == null ? null : Service.fromJson(json),
      isFavorite:
          json['isFavorite'] == null ? null : json['isFavorite'] as bool,
    );
  }

  @override
  String toString() {
    return '''ServiceModel(
                service:${service.toString()},
                isFavorite:$isFavorite
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ServiceModel &&
        other.runtimeType == runtimeType &&
        other.service == service &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, service, isFavorite);
  }
}

class Service {
  final double? rate;
  final String? id;
  final String? name;
  final String? description;
  final List<Day>? days;
  final num? dailyPrice;
  final List<Time>? time;
  final num? hourlyPrice;
  final List<String>? images;
  final Location? location;
  final String? date;

  const Service({
    this.rate,
    this.id,
    this.name,
    this.description,
    this.days,
    this.dailyPrice,
    this.time,
    this.hourlyPrice,
    this.images,
    this.location,
    this.date,
  });

  Service copyWith({
    double? rate,
    String? id,
    String? name,
    String? description,
    List<Day>? days,
    num? dailyPrice,
    List<Time>? time,
    num? hourlyPrice,
    List<String>? images,
    Location? location,
    String? date,
  }) {
    return Service(
      rate: rate ?? this.rate,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      days: days ?? this.days,
      dailyPrice: dailyPrice ?? this.dailyPrice,
      time: time ?? this.time,
      hourlyPrice: hourlyPrice ?? this.hourlyPrice,
      images: images ?? this.images,
      location: location ?? this.location,
      date: date ?? this.date,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'rate': rate,
      '_id': id,
      'name': name,
      'description': description,
      'days': days?.map((day) => day.toJson()).toList(),
      'daily_price': dailyPrice,
      'time': time?.map((t) => t.toJson()).toList(),
      'hourly_price': hourlyPrice,
      'images': images,
      'location': location?.toJson(),
      'date': date,
    };
  }

  static Service fromJson(Map<String, Object?> json) {
    return Service(
      rate: json['rate'] == null
          ? null
          : (json['rate'] is int
              ? (json['rate'] as int).toDouble()
              : json['rate'] as double),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      days: json['days'] == null
          ? null
          : (json['days'] as List<dynamic>)
              .map((e) => Day.fromJson(e as Map<String, Object?>))
              .toList(),
      dailyPrice: json['daily_price'] == null
          ? null
          : (json['daily_price'] is int
              ? (json['daily_price'] as int).toDouble()
              : json['daily_price'] as double),
      time: json['time'] == null
          ? null
          : (json['time'] as List<dynamic>)
              .map((e) => Time.fromJson(e as Map<String, Object?>))
              .toList(),
      hourlyPrice: json['hourly_price'] == null
          ? null
          : (json['hourly_price'] is int
              ? (json['hourly_price'] as int).toDouble()
              : json['hourly_price'] as double),
      images: _parseImages(json['images']),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, Object?>),
      date: json['date'] as String?,
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
}

class Day {
  final String? day;
  final String? start;
  final String? end;
  final String? id;
  final bool? available;

  const Day({this.day, this.start, this.end, this.id, this.available});

  Day copyWith(
      {String? day, String? start, String? end, String? id, bool? available}) {
    return Day(
      day: day ?? this.day,
      start: start ?? this.start,
      end: end ?? this.end,
      id: id ?? this.id,
      available: available ?? this.available,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'day': day,
      'start': start,
      'end': end,
      '_id': id,
      'available': available
    };
  }

  static Day fromJson(Map<String, Object?> json) {
    return Day(
      day: json['day'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
      id: json['_id'] as String?,
      available: json['available'] as bool?,
    );
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
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => e as double)
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
    return Object.hash(
      runtimeType,
      type,
      coordinates,
      city,
      country,
      address,
    );
  }
}

class Time {
  final String? start;
  final String? end;
  final String? id;

  const Time({this.start, this.end, this.id});

  Time copyWith({String? start, String? end, String? id}) {
    return Time(
        start: start ?? this.start, end: end ?? this.end, id: id ?? this.id);
  }

  Map<String, Object?> toJson() {
    return {'start': start, 'end': end, '_id': id};
  }

  static Time fromJson(Map<String, Object?> json) {
    return Time(
        start: json['start'] == null ? null : json['start'] as String,
        end: json['end'] == null ? null : json['end'] as String,
        id: json['_id'] as String?);
  }

  @override
  String toString() {
    return '''Time(
                start:$start,
end:$end,
id:$id
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Time &&
        other.runtimeType == runtimeType &&
        other.start == start &&
        other.end == end &&
        other.id == id;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, start, end, id);
  }
}
