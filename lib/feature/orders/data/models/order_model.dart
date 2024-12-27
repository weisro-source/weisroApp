class Order {
  final String? id;
  final Service? service;
  final List<OrderDate>? dates;
  final bool? confirmed;
  final int? totalPrice;
  final String? notes;
  final String? paymentMethod;
  final String? createdAt;
  final Address? address;

  Order({
    this.id,
    this.service,
    this.dates,
    this.confirmed,
    this.totalPrice,
    this.notes,
    this.paymentMethod,
    this.createdAt,
    this.address,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'] as String?,
      service:
          json['service'] != null ? Service.fromJson(json['service']) : null,
      dates: (json['dates'] as List?)
          ?.map((dateJson) => OrderDate.fromJson(dateJson))
          .toList(),
      confirmed: json['confirmed'] as bool?,
      totalPrice: json['total_price'] as int?,
      notes: json['notes'] as String?,
      paymentMethod: json['payment_method'] as String?,
      createdAt: json['createdAt'] as String?,
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'service': service?.toJson(),
      'dates': dates?.map((date) => date.toJson()).toList(),
      'confirmed': confirmed,
      'total_price': totalPrice,
      'notes': notes,
      'payment_method': paymentMethod,
      'createdAt': createdAt,
      'address': address?.toJson(),
    };
  }
}

class Service {
  final Location? location;
  final String? id;
  final String? name;
  final String? description;
  final List<ServiceDay>? days;
  final int? dailyPrice;
  final int? hourlyPrice;
  final int? rate;
  final List<String>? images;
  final String? categoryId;
  final String? date;

  Service({
    this.location,
    this.id,
    this.name,
    this.description,
    this.days,
    this.dailyPrice,
    this.hourlyPrice,
    this.rate,
    this.images,
    this.categoryId,
    this.date,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      days: (json['days'] as List?)
          ?.map((dayJson) => ServiceDay.fromJson(dayJson))
          .toList(),
      dailyPrice: json['daily_price'] as int?,
      hourlyPrice: json['hourly_price'] as int?,
      rate: json['rate'] as int?,
      images: (json['images'] as List?)?.cast<String>(),
      categoryId: json['category_id'] as String?,
      date: json['date'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location?.toJson(),
      '_id': id,
      'name': name,
      'description': description,
      'days': days?.map((day) => day.toJson()).toList(),
      'daily_price': dailyPrice,
      'hourly_price': hourlyPrice,
      'rate': rate,
      'images': images,
      'category_id': categoryId,
      'date': date,
    };
  }
}

class Location {
  final String? type;
  final List<double>? coordinates;
  final String? city;
  final String? country;
  final String? address;

  Location({
    this.type,
    this.coordinates,
    this.city,
    this.country,
    this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'] as String?,
      coordinates:
          (json['coordinates'] as List?)?.map((e) => e as double).toList(),
      city: json['city'] as String?,
      country: json['country'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
      'city': city,
      'country': country,
      'address': address,
    };
  }
}

class ServiceDay {
  final String? day;
  final String? start;
  final String? end;
  final String? id;

  ServiceDay({
    this.day,
    this.start,
    this.end,
    this.id,
  });

  factory ServiceDay.fromJson(Map<String, dynamic> json) {
    return ServiceDay(
      day: json['day'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'start': start,
      'end': end,
      '_id': id,
    };
  }
}

class OrderDate {
  final String? date;
  final String? id;

  OrderDate({
    this.date,
    this.id,
  });

  factory OrderDate.fromJson(Map<String, dynamic> json) {
    return OrderDate(
      date: json['date'] as String?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      '_id': id,
    };
  }
}

class Address {
  final String? id;

  Address({
    this.id,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
    };
  }
}

class Orders {
  List<Order>? orders;

  Orders({
    this.orders,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      orders:
          (json['docs'] as List?)?.map((item) => Order.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docs': orders?.map((order) => order.toJson()).toList(),
    };
  }
}
