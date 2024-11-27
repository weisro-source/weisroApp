part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesPaginationLoading extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  final CategoryModel categoryModel;

  CategoriesSuccess({required this.categoryModel});
}

final class CategoriesFailures extends CategoriesState {
  final Failure getCategoryError;

  CategoriesFailures({required this.getCategoryError});
}

final class CategoriesPaginationFailures extends CategoriesState {
  final Failure getCategoryError;

  CategoriesPaginationFailures({required this.getCategoryError});
}
