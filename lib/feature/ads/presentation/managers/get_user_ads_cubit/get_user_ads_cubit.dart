import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/ads/data/ads_repo/ads_repo.dart';
import 'package:weisro/feature/ads/data/models/ads_model.dart';

part 'get_user_ads_state.dart';

class GetUserAdsCubit extends Cubit<GetUserAdsState> {
  GetUserAdsCubit() : super(GetUserAdsInitial());

  Future<void> getUserAds({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(GetUserAdsLoading());
    } else {
      emit(GetUserAdsPaginationLoading());
    }
    var result = await getIt.get<AdsRepository>().getAdsForUserApi(pageNumber);
    result.fold((errorInGetUserAds) {
      if (pageNumber == 1) {
        emit(GetUserAdsFailures(error: errorInGetUserAds));
      } else {
        emit(GetUserAdsPaginationFailures(error: errorInGetUserAds));
      }
    }, (userAds) {
      emit(GetUserAdsSuccess(allAds: userAds));
    });
  }
}
