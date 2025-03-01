part of 'view_type_in_home_page_cubit.dart';

@immutable
sealed class ViewTypeInHomePageState {}

final class ViewHomePageInitial extends ViewTypeInHomePageState {}

final class ChangeView extends ViewTypeInHomePageState {}
