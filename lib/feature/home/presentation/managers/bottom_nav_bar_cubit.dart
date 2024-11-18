import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/favorite/presentation/view/pages/favorite_page_view_body.dart';
import 'package:weisro/feature/home/presentation/view/pages/home_page_view_body.dart';
import 'package:weisro/feature/serach/presentation/view/pages/search_page_view_body.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(2); // Default index (e.g., Home)

  void changeIndex(int index) => emit(index);

  List<Widget> appScreens = [
    const FavoritePageViewBody(),
    const Center(
      child: Text("Order"),
    ),
    const HomePageViewBody(),
    const SearchPageBody(),
    const Center(
      child: Text("Search"),
    ),
  ];
}