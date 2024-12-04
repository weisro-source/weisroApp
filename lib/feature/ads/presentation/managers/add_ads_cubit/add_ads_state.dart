part of 'add_ads_cubit.dart';

@immutable
sealed class AddAdsState {}

final class AddAdsInitial extends AddAdsState {}

final class AddAdsLoading extends AddAdsState {}

final class AddAdsSuccess extends AddAdsState {}

final class AddAdsFailures extends AddAdsState {
  final Failure error;

  AddAdsFailures({required this.error});
}
