import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/favorite/presentation/view/pages/favorite_page_view_body.dart';
import 'package:weisro/feature/home/presentation/view/pages/home_page_view_body.dart';
import 'package:weisro/feature/orders/presentation/view/orders_page_view_body.dart';
import 'package:weisro/feature/profile/presentation/view/pages/profile_page_view_body.dart';
import 'package:weisro/feature/search/presentation/view/pages/search_page_view_body.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(2); // Default index (e.g., Home)

  void changeIndex(int index) => emit(index);

  List<Widget> appScreens = [
    //0
    const FavoritePageViewBody(),
    // 1
    const OrdersPageViewBody(),
    // 2
    const HomePageViewBody(),
    // 3
    const SearchPageBody(),
    // 4
    const ProfilePageViewBody()
  ];
}
