class City {
  final String name;

  City({required this.name});

  // Factory constructor to create a City from JSON
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
    );
  }

  // Method to convert a City object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  @override
  String toString() {
    return 'City(name: $name)';
  }
}

class CityList {
  final List<City> cities;

  CityList({required this.cities});

  // Factory constructor to create a CityList from JSON
  factory CityList.fromJson(List<dynamic> jsonList) {
    return CityList(
      cities: jsonList.map((json) => City.fromJson(json)).toList(),
    );
  }

  // Method to convert a CityList object to JSON
  List<Map<String, dynamic>> toJson() {
    return cities.map((city) => city.toJson()).toList();
  }

  @override
  String toString() {
    return cities.toString();
  }
}
