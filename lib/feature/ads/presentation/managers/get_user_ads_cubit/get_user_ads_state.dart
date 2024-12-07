part of 'get_user_ads_cubit.dart';

@immutable
sealed class GetUserAdsState {}

final class GetUserAdsInitial extends GetUserAdsState {}

final class GetUserAdsLoading extends GetUserAdsState {}

final class GetUserAdsPaginationLoading extends GetUserAdsState {}

final class GetUserAdsSuccess extends GetUserAdsState {
  final AdsModel allAds;

  GetUserAdsSuccess({required this.allAds});
}

final class GetUserAdsFailures extends GetUserAdsState {
  final Failure error;

  GetUserAdsFailures({required this.error});
}

final class GetUserAdsPaginationFailures extends GetUserAdsState {
  final Failure error;

  GetUserAdsPaginationFailures({required this.error});
}
