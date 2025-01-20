import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:weisro/feature/auth/data/models/cities_model.dart';

class CityInStateDropdown extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return DropdownSearch<City>(
      popupProps: PopupProps.menu(
        showSearchBox: true, // Enable search box
        searchFieldProps: const TextFieldProps(
          decoration: InputDecoration(
            labelText: 'Search City',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
        itemBuilder: (BuildContext context, City city, bool isSelected,
            bool isHighlighted) {
          return Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).primaryColor.withOpacity(0.1)
                  : (isHighlighted
                      ? Theme.of(context).highlightColor.withOpacity(0.1)
                      : null),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              title: Text(city.name),
            ),
          );
        },
      ),
      items: (filter, loadProps) => cityList, // List of cities
      itemAsString: (City? city) =>
          city?.name ?? 'Unknown', // Display city name in the dropdown
      selectedItem: selectedCity, // Initially selected city
      onChanged: onChanged, // Callback to update selected city
      compareFn: (city, filter) {
        // Compare function to filter cities based on search input
        return city.name.toLowerCase().contains(filter.name);
      },

      // Show selected city in the dropdown's input field
    );
  }
}
