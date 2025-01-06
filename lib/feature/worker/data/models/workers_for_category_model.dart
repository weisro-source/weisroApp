class WorkersForCategory {
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
  const WorkersForCategory(
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
  WorkersForCategory copyWith(
      {List<Docs>? docs,
      int? totalDocs,
      int? limit,
      int? totalPages,
      int? page,
      int? pagingCounter,
      bool? hasPrevPage,
      bool? hasNextPage,
      dynamic? prevPage,
      dynamic? nextPage}) {
    return WorkersForCategory(
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

  static WorkersForCategory fromJson(Map<String, Object?> json) {
    return WorkersForCategory(
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
    return '''WorkersForCategory(
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
    return other is WorkersForCategory &&
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
  final List<Days>? days;
  final List<String>? validateDocuments;
  final List<String>? images;
  final String? profileImage;
  final int? age;
  final int? rate;
  final String? servicesDescription;
  final int? farePerHour;
  final List<Tag>? tags; // Updated type from List<String> to List<Tag>
  final User? user;

  const Docs({
    this.id,
    this.days,
    this.validateDocuments,
    this.images,
    this.profileImage,
    this.age,
    this.rate,
    this.servicesDescription,
    this.farePerHour,
    this.tags,
    this.user,
  });

  Docs copyWith({
    String? id,
    List<Days>? days,
    List<String>? validateDocuments,
    List<String>? images,
    String? profileImage,
    int? age,
    int? rate,
    String? servicesDescription,
    int? farePerHour,
    List<Tag>? tags,
    User? user,
  }) {
    return Docs(
      id: id ?? this.id,
      days: days ?? this.days,
      validateDocuments: validateDocuments ?? this.validateDocuments,
      images: images ?? this.images,
      profileImage: profileImage ?? this.profileImage,
      age: age ?? this.age,
      rate: rate ?? this.rate,
      servicesDescription: servicesDescription ?? this.servicesDescription,
      farePerHour: farePerHour ?? this.farePerHour,
      tags: tags ?? this.tags,
      user: user ?? this.user,
    );
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'days': days?.map((data) => data.toJson()).toList(),
      'validate_documents': validateDocuments,
      'images': images,
      'profile_image': profileImage,
      'age': age,
      'rate': rate,
      'services_description': servicesDescription,
      'fare_per_hour': farePerHour,
      'tags': tags?.map((tag) => tag.toJson()).toList(), // Serialize tags
      'user': user?.toJson(),
    };
  }

  static Docs fromJson(Map<String, Object?> json) {
    return Docs(
      id: json['_id'] as String?,
      days: (json['days'] as List<dynamic>?)
          ?.map((data) => Days.fromJson(data as Map<String, Object?>))
          .toList(),
      validateDocuments: (json['validate_documents'] as List<dynamic>?)
          ?.cast<String>(),
      images: (json['images'] as List<dynamic>?)?.cast<String>(),
      profileImage: json['profile_image'] as String?,
      age: json['age'] as int?,
      rate: json['rate'] as int?,
      servicesDescription: json['services_description'] as String?,
      farePerHour: json['fare_per_hour'] as int?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((data) => Tag.fromJson(data as Map<String, Object?>))
          .toList(),
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, Object?>)
          : null,
    );
  }

  @override
  String toString() {
    return '''Docs(
      id: $id,
      days: $days,
      validateDocuments: $validateDocuments,
      images: $images,
      profileImage: $profileImage,
      age: $age,
      rate: $rate,
      servicesDescription: $servicesDescription,
      farePerHour: $farePerHour,
      tags: $tags,
      user: $user,
    )''';
  }

  @override
  bool operator ==(Object other) {
    return other is Docs &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.days == days &&
        other.validateDocuments == validateDocuments &&
        other.images == images &&
        other.profileImage == profileImage &&
        other.age == age &&
        other.rate == rate &&
        other.servicesDescription == servicesDescription &&
        other.farePerHour == farePerHour &&
        other.tags == tags &&
        other.user == user;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      id,
      days,
      validateDocuments,
      images,
      profileImage,
      age,
      rate,
      servicesDescription,
      farePerHour,
      tags,
      user,
    );
  }
}

class Tag {
  final String? id;
  final String? name;

  const Tag({this.id, this.name});

  Tag copyWith({String? id, String? name}) {
    return Tag(
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

  static Tag fromJson(Map<String, Object?> json) {
    return Tag(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );
  }

  @override
  String toString() {
    return 'Tag(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return other is Tag &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name);
  }
}


class User {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? countryCode;
  final String? phone;
  final Address? address;
  const User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.countryCode,
      this.phone,
      this.address});
  User copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      String? email,
      String? countryCode,
      String? phone,
      Address? address}) {
    return User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        countryCode: countryCode ?? this.countryCode,
        phone: phone ?? this.phone,
        address: address ?? this.address);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'countryCode': countryCode,
      'phone': phone,
      'address': address?.toJson()
    };
  }

  static User fromJson(Map<String, Object?> json) {
    return User(
        id: json['_id'] == null ? null : json['_id'] as String,
        firstName:
            json['first_name'] == null ? null : json['first_name'] as String,
        lastName:
            json['last_name'] == null ? null : json['last_name'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        countryCode:
            json['countryCode'] == null ? null : json['countryCode'] as String,
        phone: json['phone'] == null ? null : json['phone'] as String,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''User(
                id:$id,
firstName:$firstName,
lastName:$lastName,
email:$email,
countryCode:$countryCode,
phone:$phone,
address:${address.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is User &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.countryCode == countryCode &&
        other.phone == phone &&
        other.address == address;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, firstName, lastName, email, countryCode,
        phone, address);
  }
}

class Address {
  final String? city;
  final String? country;
  final String? postalCode;
  final String? street;
  final String? houseNumber;
  const Address(
      {this.city,
      this.country,
      this.postalCode,
      this.street,
      this.houseNumber});
  Address copyWith(
      {String? city,
      String? country,
      String? postalCode,
      String? street,
      String? houseNumber}) {
    return Address(
        city: city ?? this.city,
        country: country ?? this.country,
        postalCode: postalCode ?? this.postalCode,
        street: street ?? this.street,
        houseNumber: houseNumber ?? this.houseNumber);
  }

  Map<String, Object?> toJson() {
    return {
      'city': city,
      'country': country,
      'postal_code': postalCode,
      'street': street,
      'house_number': houseNumber
    };
  }

  static Address fromJson(Map<String, Object?> json) {
    return Address(
        city: json['city'] == null ? null : json['city'] as String,
        country: json['country'] == null ? null : json['country'] as String,
        postalCode:
            json['postal_code'] == null ? null : json['postal_code'] as String,
        street: json['street'] == null ? null : json['street'] as String,
        houseNumber: json['house_number'] == null
            ? null
            : json['house_number'] as String);
  }

  @override
  String toString() {
    return '''Address(
                city:$city,
country:$country,
postalCode:$postalCode,
street:$street,
houseNumber:$houseNumber
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Address &&
        other.runtimeType == runtimeType &&
        other.city == city &&
        other.country == country &&
        other.postalCode == postalCode &&
        other.street == street &&
        other.houseNumber == houseNumber;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, city, country, postalCode, street, houseNumber);
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
