import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/data/models/countries_model.dart';

part 'get_all_countries_state.dart';

class GetAllCountriesCubit extends Cubit<GetAllCountriesState> {
  GetAllCountriesCubit() : super(GetAllCountriesInitial());
  Country selectedCountry = Country(id: '', flag: '', name: '');
  static GetAllCountriesCubit get(context) => BlocProvider.of(context);
  String? countryId = CacheHelper.getData(key: CacheKeys.kCountryId);
  Future<void> getAllCountries() async {
    emit(GetAllCountriesLoading());
    var result = await getIt.get<AuthenticationRepository>().getAllCountries();
    result.fold(
      (errorInGetCountries) {
        emit(GetAllCountriesFailures());
      },
      (allCountries) {
        if (countryId != null) {
          selectedCountry = allCountries.countries.firstWhere(
            (country) => country.id == countryId,
            orElse: () => allCountries.countries.first,
          );
        } else {
          selectedCountry = allCountries.countries.firstWhere(
            (country) => country.name == 'Germany',
            orElse: () => allCountries.countries.first,
          );
        }

        emit(GetAllCountriesSuccess(countries: allCountries));
      },
    );
  }

  void selectCountry(Country countryName) {
    selectedCountry = countryName;
    if (state is GetAllCountriesSuccess) {
      final currentState = state as GetAllCountriesSuccess;
      emit(GetAllCountriesSuccess(countries: currentState.countries));
    }
  }
}
