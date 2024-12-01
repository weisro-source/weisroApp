part of 'get_cities_of_a_specified_country_cubit.dart';

@immutable
sealed class GetCitiesOfASpecifiedCountryState {}

final class GetCitiesOfASpecifiedCountryInitial
    extends GetCitiesOfASpecifiedCountryState {}

final class GetCitiesOfASpecifiedCountryLoading
    extends GetCitiesOfASpecifiedCountryState {}

final class GetCitiesOfASpecifiedCountrySuccess
    extends GetCitiesOfASpecifiedCountryState {
  final CityList cities;

  GetCitiesOfASpecifiedCountrySuccess({required this.cities});
}

final class GetCitiesOfASpecifiedCountryFailures
    extends GetCitiesOfASpecifiedCountryState {
  final Failure error;

  GetCitiesOfASpecifiedCountryFailures({required this.error});
}
