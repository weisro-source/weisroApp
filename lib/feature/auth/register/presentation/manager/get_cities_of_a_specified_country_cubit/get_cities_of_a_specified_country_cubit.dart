import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/data/models/cities_model.dart';

part 'get_cities_of_a_specified_country_state.dart';

class GetCitiesOfASpecifiedCountryCubit
    extends Cubit<GetCitiesOfASpecifiedCountryState> {
  GetCitiesOfASpecifiedCountryCubit()
      : super(GetCitiesOfASpecifiedCountryInitial());

  String cityName = '';
  static GetCitiesOfASpecifiedCountryCubit get(context) =>
      BlocProvider.of(context);

  Future<void> checkIfCountrySelected() async {
    if (CacheHelper.getData(key: CacheKeys.kCountryId) != null) {
      await getAllCitiesOfASpecifiedCountry(
          CacheHelper.getData(key: CacheKeys.kCountryId));
    } else {
      await getAllCitiesOfASpecifiedCountry('678c1805937ae70e6cc0d335');
    }
  }

  void updateCitiesState(CityList updatedCities) {
    emit(GetCitiesOfASpecifiedCountrySuccess(cities: updatedCities));
  }

  Future<void> getAllCitiesOfASpecifiedCountry(String countryId) async {
    emit(GetCitiesOfASpecifiedCountryLoading());
    var result = await getIt
        .get<AuthenticationRepository>()
        .getCitiesOfASpecifiedCountry(countryId);
    result.fold(
      (errorGetAllCities) {
        emit(GetCitiesOfASpecifiedCountryFailures(error: errorGetAllCities));
      },
      (getAllCities) {
        cityName = getAllCities.states.first.name;
        emit(GetCitiesOfASpecifiedCountrySuccess(cities: getAllCities));
      },
    );
  }
}
