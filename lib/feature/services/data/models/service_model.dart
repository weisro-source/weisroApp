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
        service: json['service'] == null
            ? null
            : Service.fromJson(json['service'] as Map<String, Object?>),
        isFavorite:
            json['isFavorite'] == null ? null : json['isFavorite'] as bool);
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
  final Time? time;
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
    Time? time,
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
      'time': time?.toJson(),
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
          : Time.fromJson(json['time'] as Map<String, Object?>),
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

  const Day({this.day, this.start, this.end, this.id});

  Day copyWith({String? day, String? start, String? end, String? id}) {
    return Day(
      day: day ?? this.day,
      start: start ?? this.start,
      end: end ?? this.end,
      id: id ?? this.id,
    );
  }

  Map<String, Object?> toJson() {
    return {'day': day, 'start': start, 'end': end, '_id': id};
  }

  static Day fromJson(Map<String, Object?> json) {
    return Day(
      day: json['day'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
      id: json['_id'] as String?,
    );
  }
}

class Location {
  final num? latitude;
  final num? longitude;
  const Location({this.latitude, this.longitude});
  Location copyWith({double? latitude, double? longitude}) {
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
