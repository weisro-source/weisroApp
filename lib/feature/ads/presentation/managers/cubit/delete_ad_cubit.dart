import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/ads/data/ads_repo/ads_repo.dart';

part 'delete_ad_state.dart';

class DeleteAdCubit extends Cubit<DeleteAdState> {
  DeleteAdCubit() : super(DeleteAdInitial());
  Future<void> deleteAd(int adId) async {
    emit(DeleteAdLoading());
    var result = await getIt.get<AdsRepository>().deleteAd(adId);
    result.fold(
      (errorInDeleteAd) {
        emit(DeleteAdFailures(error: errorInDeleteAd));
      },
      (adDeleted) {
        emit(DeleteAdSuccess(successMessage: adDeleted));
      },
    );
  }
}
