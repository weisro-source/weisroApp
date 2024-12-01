
class Country {
  final String id;
  final String flag;
  final String name;

  Country({
    required this.id,
    required this.flag,
    required this.name,
  });

  // Factory constructor to create a Country from JSON
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['_id'],
      flag: json['flag'],
      name: json['name'],
    );
  }

  // Method to convert a Country object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'flag': flag,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Country(id: $id, flag: $flag, name: $name)';
  }
}

class CountryList {
  final List<Country> countries;

  CountryList({required this.countries});

  // Accepts a list directly
  factory CountryList.fromJson(List<dynamic> jsonList) {
    return CountryList(
      countries: jsonList.map((json) => Country.fromJson(json)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return countries.map((country) => country.toJson()).toList();
  }

  @override
  String toString() {
    return countries.toString();
  }
}
