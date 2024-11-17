import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/generated/l10n.dart';

class FavoriteTimeModel {
  final String icon;
  final String hours;
  final String? time;
  bool isSelected;
  FavoriteTimeModel(
      {required this.icon,
      required this.hours,
      this.time,
      this.isSelected = false});
}

abstract class WorkerTime {
  static Map<String, String> daysSelected(BuildContext context) {
    return {
      "Sunday": S.of(context).Su,
      "Saturday": S.of(context).Sa,
      "Friday": S.of(context).Fr,
      "Thursday": S.of(context).Th,
      "Wednesday": S.of(context).We,
      "Tuesday": S.of(context).Tu,
      "Monday": S.of(context).Mo
    };
  }

  static List<FavoriteTimeModel> favoriteTimesList(BuildContext context) {
    return [
      FavoriteTimeModel(
          icon: IconsPath.iconsSun, hours: "6-14", time: S.of(context).Morning),
      FavoriteTimeModel(
          icon: IconsPath.iconsMoon,
          hours: "14-22",
          time: S.of(context).Evening),
      FavoriteTimeModel(
          icon: IconsPath.iconsMoon, hours: "22-6", time: S.of(context).Night),
    ];
  }

  static List<FavoriteTimeModel> favoriteTimesList2(BuildContext context) {
    List<FavoriteTimeModel> times = [];

    for (int i = 6; i < 23; i++) {
      // Generate ranges from "6-7" to "22-23"
      String hoursRange = "$i :00 - ${i + 1} :00";
      times.add(FavoriteTimeModel(
        icon: IconsPath.iconsFavTime,
        hours: hoursRange,
        time: null,
      ));
    }

    return times;
  }
}