import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/home/data/home_repo/home_repo.dart';
import 'package:weisro/feature/home/data/models/last_service_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  void initSearch() {
    emit(SearchInitial());
  }

  ///get
  static SearchCubit get(context) => BlocProvider.of(context);

  /// controller for the search filed
  TextEditingController searchController = TextEditingController();
  Future<void> search(BuildContext context, {int pageNumber = 1}) async {
    emit(SearchLoading());

    /// You can use this api to search
    Either<Failure, LastServicesModel> result = await getIt
        .get<HomeRepository>()
        .getLastServiceApi(context, searchController.text, pageNumber);
    result.fold(
      (errorInSearch) {
        emit(SearchFailures(error: errorInSearch));
      },
      (searchResultForOnePage) {
        emit(SearchSuccess(searchResult: searchResultForOnePage));
      },
    );
  }
}
