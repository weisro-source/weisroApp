import 'package:flutter/material.dart';

class CustomScrollController {
  static void scrollListener(ScrollController scrollController, bool isLoading,
      bool hasNext, Future<void> function,
      [int nextPage = 2]) async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.5 * maxScrollLength) {
      if (!isLoading && hasNext) {
        isLoading = true;
        await function;
        isLoading = false;
      }
    }
  }
}
