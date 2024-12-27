class Order {
  final String? id;
  final String? service;
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
      service: json['service'] as String?,
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
      'service': service,
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

class OrderDate {
  final String? date;
  final String? start;
  final String? end;
  final String? id;

  OrderDate({
    this.date,
    this.start,
    this.end,
    this.id,
  });

  factory OrderDate.fromJson(Map<String, dynamic> json) {
    return OrderDate(
      date: json['date'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'start': start,
      'end': end,
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

  factory Orders.fromJson(List<dynamic> jsonList) {
    return Orders(
      orders: jsonList.map((item) => Order.fromJson(item)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return orders?.map((order) => order.toJson()).toList() ?? [];
  }
}
