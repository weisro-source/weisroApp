
//   Widget _buildDaysList() {
//     final daysKeys = WorkerTime.daysSelected(context)
//         .keys
//         .toList(); // Convert keys to a list such Saturday , Sunday
//     final daysValues = WorkerTime.daysSelected(context)
//         .values
//         .toList(); // Convert values to a list such sa , su
//     return ListView.separated(
//       key: const ValueKey("days"),
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: daysKeys.length,
//       separatorBuilder: (context, index) => 10.kh,
//       itemBuilder: (context, index) {
//         String dayKey = daysKeys[index];
//         String dayValue = daysValues[index];
//         bool isContained =
//             widget.days?.any((day) => day.day == dayKey) ?? false;

//         String dayDate = HelperFunctions.getDateForDay(dayKey);
//         String dayId = widget.days
//                 ?.firstWhere((day) => day.day == dayKey,
//                     orElse: () =>
//                         const Day(day: "", start: "", end: "", id: ""))
//                 .id ??
//             "";
//         bool isDaySelected = selectedDayModels.contains(dayId);
//         return Column(
//           children: [
//             GestureDetector(
//               onTap: isContained &&
//                       (widget.days
//                               ?.firstWhere(
//                                 (day) => day.day == dayKey,
//                                 orElse: () => const Day(
//                                     day: "",
//                                     start: "",
//                                     end: "",
//                                     id: "",
//                                     available: false),
//                               )
//                               .available ??
//                           false)
//                   ? () {
//                       setState(() {
//                         String dayId = widget.days
//                                 ?.firstWhere((day) => day.day == dayKey)
//                                 .id ??
//                             "";
//                         if (selectedDayModels.contains(dayId)) {
//                           selectedDayModels.remove(dayId); // Unselect the day
//                         } else {
//                           selectedDayModels.add(dayId); // Select the day
//                         }
//                       });
//                       totalDayPrice = BookServiceCubit.get(context)
//                           .totalDayPrice(
//                               selectedDayModels.length, widget.dayPrice);
//                     }
//                   : null,
//               child: Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: isDaySelected
//                       ? AppColors.orangeColor
//                       : (!isContained ||
//                               !(widget.days
//                                       ?.firstWhere(
//                                         (day) => day.day == dayKey,
//                                         orElse: () => const Day(
//                                             day: "",
//                                             start: "",
//                                             end: "",
//                                             id: "",
//                                             available: false),
//                                       )
//                                       .available ??
//                                   false))
//                           ? AppColors.redColor
//                           : AppColors.whiteColor,
//                   border: Border.all(color: AppColors.orangeColor),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     20.kw,
//                     SvgPicture.asset(IconsPath.iconsFavTime),
//                     8.kw,
//                     Text(dayValue,
//                         style: AppStyles.style12w500Orange(context).copyWith(
//                             color: (isContained &&
//                                     (widget.days
//                                             ?.firstWhere(
//                                               (day) => day.day == dayKey,
//                                               orElse: () => const Day(
//                                                   day: "",
//                                                   start: "",
//                                                   end: "",
//                                                   id: "",
//                                                   available: false),
//                                             )
//                                             .available ??
//                                         false))
//                                 ? isDaySelected
//                                     ? AppColors.whiteColor
//                                     : AppColors.orangeColor
//                                 : AppColors.whiteColor)),
//                     8.kw,
//                     Text(dayDate,
//                         style: AppStyles.style12w500Orange(context).copyWith(
//                             color: (isContained &&
//                                     (widget.days
//                                             ?.firstWhere(
//                                               (day) => day.day == dayKey,
//                                               orElse: () => const Day(
//                                                   day: "",
//                                                   start: "",
//                                                   end: "",
//                                                   id: "",
//                                                   available: false),
//                                             )
//                                             .available ??
//                                         false))
//                                 ? isDaySelected
//                                     ? AppColors.whiteColor
//                                     : AppColors.orangeColor
//                                 : AppColors.whiteColor)),
//                     const Spacer(),
//                     Text(
//                       isContained
//                           ? "${widget.days?.firstWhere((day) => day.day == dayKey).start} - ${widget.days?.firstWhere((day) => day.day == dayKey).end}"
//                           : "",
//                       style: AppStyles.style10w400Second2(context).copyWith(
//                         color: (isContained &&
//                                 (widget.days
//                                         ?.firstWhere(
//                                           (day) => day.day == dayKey,
//                                           orElse: () => const Day(
//                                               day: "",
//                                               start: "",
//                                               end: "",
//                                               id: "",
//                                               available: false),
//                                         )
//                                         .available ??
//                                     false))
//                             ? isDaySelected
//                                 ? AppColors.whiteColor
//                                 : AppColors.orangeColor
//                             : AppColors.whiteColor,
//                       ),
//                     ),
//                     const Spacer(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
