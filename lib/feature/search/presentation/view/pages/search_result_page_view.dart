import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/search/presentation/managers/cubit/search_cubit.dart';

import 'search_result_page_view_body.dart';

class SearchResultPageView extends StatefulWidget {
  const SearchResultPageView({Key? key, required this.cityName})
      : super(key: key);
  final String cityName;

  @override
  State<SearchResultPageView> createState() => _SearchResultPageViewState();
}

class _SearchResultPageViewState extends State<SearchResultPageView> {
  @override
  void initState() {
    BlocProvider.of<SearchCubit>(context).search(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SearchResultPageViewBody(
      cityName: widget.cityName,
    ));
  }
}
