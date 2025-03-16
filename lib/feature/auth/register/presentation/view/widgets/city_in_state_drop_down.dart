import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/feature/auth/data/models/cities_model.dart';

class CityInStateDropdown extends StatefulWidget {
  final List<City> cityList; // The list of cities
  final City? selectedCity; // The currently selected city
  final ValueChanged<City?> onChanged; // Callback when a city is selected

  const CityInStateDropdown({
    Key? key,
    required this.cityList,
    required this.selectedCity,
    required this.onChanged,
  }) : super(key: key);

  @override
  CityInStateDropdownState createState() => CityInStateDropdownState();
}

class CityInStateDropdownState extends State<CityInStateDropdown> {
  late TextEditingController _searchController;
  late List<City> _filteredCities;
  City? _selectedCity;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredCities = widget.cityList;
    _selectedCity = widget.selectedCity;
  }

  void _filterCities(String query) {
    setState(() {
      _filteredCities = widget.cityList
          .where(
              (city) => city.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showCityPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensures content adjusts when keyboard appears
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6, // Default height
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search City',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: _filterCities,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController, // Enables smooth scrolling
                      itemCount: _filteredCities.length,
                      itemBuilder: (context, index) {
                        final city = _filteredCities[index];
                        return ListTile(
                          title: Text(city.name),
                          onTap: () {
                            setState(() {
                              _selectedCity = city;
                            });
                            widget.onChanged(city);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCityPicker(context),
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.orangeColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.orangeColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.orangeColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedCity?.name ?? 'Select City',
              style: TextStyle(
                  color: _selectedCity == null ? Colors.grey : Colors.black),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
