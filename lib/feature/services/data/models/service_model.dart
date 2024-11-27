class ServiceModel {
  final String? id;
  final String? name;
  final String? description;
  final List<String>? days;
  final int? dailyPrice;
  final Time? time;
  final int? hourlyPrice;
  final List<String>? images;
  final Location? location;
  const ServiceModel(
      {this.id,
      this.name,
      this.description,
      this.days,
      this.dailyPrice,
      this.time,
      this.hourlyPrice,
      this.images,
      this.location});
  ServiceModel copyWith(
      {String? id,
      String? name,
      String? description,
      List<String>? days,
      int? dailyPrice,
      Time? time,
      int? hourlyPrice,
      List<String>? images,
      Location? location}) {
    return ServiceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        days: days ?? this.days,
        dailyPrice: dailyPrice ?? this.dailyPrice,
        time: time ?? this.time,
        hourlyPrice: hourlyPrice ?? this.hourlyPrice,
        images: images ?? this.images,
        location: location ?? this.location);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'days': days,
      'daily_price': dailyPrice,
      'time': time?.toJson(),
      'hourly_price': hourlyPrice,
      'images': images,
      'location': location?.toJson()
    };
  }

  static ServiceModel fromJson(Map<String, Object?> json) {
    return ServiceModel(
        id: json['_id'] == null ? null : json['_id'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        days: json['days'] == null
            ? null
            : (json['days'] as List).map((e) => e as String).toList(),
        dailyPrice:
            json['daily_price'] == null ? null : json['daily_price'] as int,
        time: json['time'] == null
            ? null
            : Time.fromJson(json['time'] as Map<String, Object?>),
        hourlyPrice:
            json['hourly_price'] == null ? null : json['hourly_price'] as int,
        images: json['images'] == null
            ? null
            : (json['images'] as List).map((e) => e as String).toList(),
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''ServiceModel(
                id:$id,
name:$name,
description:$description,
days:$days,
dailyPrice:$dailyPrice,
time:${time.toString()},
hourlyPrice:$hourlyPrice,
images:$images,
location:${location.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ServiceModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.days == days &&
        other.dailyPrice == dailyPrice &&
        other.time == time &&
        other.hourlyPrice == hourlyPrice &&
        other.images == images &&
        other.location == location;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, description, days, dailyPrice,
        time, hourlyPrice, images, location);
  }
}

class Location {
  final num? latitude;
  final num? longitude;
  const Location({this.latitude, this.longitude});
  Location copyWith({num? latitude, num? longitude}) {
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
