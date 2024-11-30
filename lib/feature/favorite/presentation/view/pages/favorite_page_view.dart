import 'package:flutter/material.dart';
import 'package:weisro/feature/favorite/presentation/view/pages/favorite_page_view_body.dart';

class FavoritePageView extends StatelessWidget {
  const FavoritePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child:  FavoritePageViewBody());
  }
}
