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
  final List<CityState> states;

  CityList({required this.states});

  // Factory constructor to create a CityList from JSON
  factory CityList.fromJson(List<dynamic> jsonList) {
    return CityList(
      states: jsonList.map((json) => CityState.fromJson(json)).toList(),
    );
  }

  // Method to convert a CityList object to JSON
  List<Map<String, dynamic>> toJson() {
    return states.map((state) => state.toJson()).toList();
  }

  @override
  String toString() {
    return states.toString();
  }
}

class CityState {
  final String name;
  final List<City> cities;

  CityState({required this.name, required this.cities});

  // Factory constructor to create a CityState from JSON
  factory CityState.fromJson(Map<String, dynamic> json) {
    return CityState(
      name: json['name'],
      cities: (json['cities'] as List<dynamic>)
          .map((cityJson) => City.fromJson(cityJson))
          .toList(),
    );
  }

  // Method to convert a CityState object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cities': cities.map((city) => city.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'CityState(name: $name, cities: $cities)';
  }
}
