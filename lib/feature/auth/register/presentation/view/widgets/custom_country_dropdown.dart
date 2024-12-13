import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/widgets/shimmer_app_button.dart';
import 'package:weisro/feature/auth/data/models/countries_model.dart';

class CountryDropdown extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return DropdownSearch<Country>(
      popupProps: PopupProps.menu(
        showSearchBox: true,
        searchFieldProps: const TextFieldProps(
          decoration: InputDecoration(
            labelText: 'Search Country',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
        itemBuilder: (BuildContext context, Country country, bool isSelected,
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
              leading: CachedNetworkImage(
                imageUrl: country.flag,
                width: 24,
                height: 16,
                placeholder: (context, url) =>
                    const ShimmerAppButton.rectangular(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              title: Text(country.name),
            ),
          );
        },
      ),
      items: (filter, loadProps) => countries.countries, // List of countries,
      itemAsString: (Country? country) => country?.name ?? 'Unknown',
      selectedItem: selectedCountry,
      dropdownBuilder: (context, selectedItem) {
        return ListTile(
          leading: CachedNetworkImage(
            imageUrl: selectedItem?.flag ?? "",
            width: 24,
            height: 16,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          title: Text(selectedItem?.name ?? ""),
        );
      },
      onChanged: onChanged,

      compareFn: (country, filter) {
        return country.name.toLowerCase().contains(filter.name);
      },
    );
  }
}
