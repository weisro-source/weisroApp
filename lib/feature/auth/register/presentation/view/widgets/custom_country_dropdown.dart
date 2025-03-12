import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/widgets/shimmer_app_button.dart';
import 'package:weisro/feature/auth/data/models/countries_model.dart';

class CountryDropdown extends StatefulWidget {
  final CountryList countries;
  final Country? selectedCountry;
  final ValueChanged<Country?> onChanged;

  const CountryDropdown({
    Key? key,
    required this.countries,
    required this.selectedCountry,
    required this.onChanged,
  }) : super(key: key);

  @override
  CountryDropdownState createState() => CountryDropdownState();
}

class CountryDropdownState extends State<CountryDropdown> {
  late TextEditingController _searchController;
  late List<Country> _filteredCountries;
  Country? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredCountries = widget.countries.countries;
    _selectedCountry = widget.selectedCountry;
  }

  // ignore: unused_element
  void _filterCountries(String query) {
    setState(() {
      _filteredCountries = widget.countries.countries
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensures keyboard doesn't cover content
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6, // Adjustable height
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
                      labelText: 'Search Country',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.orangeColor, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _filteredCountries = widget.countries.countries
                            .where((country) => country.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: _filteredCountries.length,
                      itemBuilder: (context, index) {
                        final country = _filteredCountries[index];
                        return ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: country.flag,
                            width: 24,
                            height: 16,
                            placeholder: (context, url) =>
                                const ShimmerAppButton.rectangular(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          title: Text(country.name),
                          onTap: () {
                            setState(() {
                              _selectedCountry = country;
                            });
                            widget.onChanged(country);
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
      onTap: () => _showCountryPicker(context),
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
            if (_selectedCountry != null)
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: _selectedCountry!.flag,
                    width: 24,
                    height: 16,
                    placeholder: (context, url) =>
                        const ShimmerAppButton.rectangular(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const SizedBox(width: 10),
                  Text(_selectedCountry!.name),
                ],
              )
            else
              const Text(
                'Select Country',
                style: TextStyle(color: Colors.grey),
              ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
