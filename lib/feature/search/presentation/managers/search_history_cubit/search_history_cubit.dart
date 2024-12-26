import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';

class SearchHistoryCubit extends Cubit<List<String>> {
  SearchHistoryCubit() : super([]);

  // Load search history from CacheHelper
  Future<void> loadSearchHistory() async {
    final history = CacheHelper.getData(key: CacheKeys.kSearchHistory) ?? [];
    emit(List<String>.from(history)); // Emit history as a list of strings
  }

  Future<void> addSearchQuery(String query) async {
    // Retrieve the current history and ensure it's a List<String>
    final List<String> currentHistory = List<String>.from(
      CacheHelper.getData(key: CacheKeys.kSearchHistory) ?? [],
    );

    // Remove the query if it already exists to avoid duplication
    currentHistory.remove(query);

    // Add the new query to the top
    currentHistory.insert(0, query);

    // Limit the search history to the last 10 items
    if (currentHistory.length > 10) {
      currentHistory.removeRange(10, currentHistory.length);
    }

    // Save the updated history back to CacheHelper
    await CacheHelper.setData(
      key: CacheKeys.kSearchHistory,
      value: currentHistory,
    );

    // Emit the updated list to update the UI
    emit(currentHistory);
  }
   Future<void> deleteSearchQuery(String query) async {
    final currentHistory = List<String>.from(
      CacheHelper.getData(key: CacheKeys.kSearchHistory) ?? [],
    );

    currentHistory.remove(query);

    await CacheHelper.setData(
      key: CacheKeys.kSearchHistory,
      value: currentHistory,
    );
    emit(currentHistory);
  }
}
