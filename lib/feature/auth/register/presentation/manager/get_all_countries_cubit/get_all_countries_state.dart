part of 'get_all_countries_cubit.dart';

@immutable
sealed class GetAllCountriesState {}

final class GetAllCountriesInitial extends GetAllCountriesState {}

final class GetAllCountriesLoading extends GetAllCountriesState {}

final class GetAllCountriesSuccess extends GetAllCountriesState {
  final CountryList countries;

  GetAllCountriesSuccess({required this.countries});
}

final class GetAllCountriesFailures extends GetAllCountriesState {


}
