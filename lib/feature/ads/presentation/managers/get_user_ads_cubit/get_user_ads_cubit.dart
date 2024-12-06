import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/ads/data/ads_repo/ads_repo.dart';
import 'package:weisro/feature/ads/data/models/ads_model.dart';

part 'get_user_ads_state.dart';

class GetUserAdsCubit extends Cubit<GetUserAdsState> {
  GetUserAdsCubit() : super(GetUserAdsInitial());

  Future<void> getUserAds(CancelToken cancel) async {
    emit(GetUserAdsLoading());
    var result = await getIt.get<AdsRepository>().getAdsForUserApi(cancel);
    result.fold((errorInGetUserAds) {
      emit(GetUserAdsFailures(error: errorInGetUserAds));
    }, (userAds) {
      emit(GetUserAdsSuccess(allAds: userAds));
    });
  }
}
