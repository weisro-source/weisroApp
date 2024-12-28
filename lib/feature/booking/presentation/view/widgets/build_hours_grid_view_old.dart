// Widget _buildHoursGrid(List<String> timeSlots) {
//   return GridView.builder(
//     key: const ValueKey("hours"),
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       childAspectRatio: 123 / 28,
//       crossAxisSpacing: 8,
//       mainAxisSpacing: 8,
//     ),
//     itemCount: timeSlots.length,
//     itemBuilder: (context, index) {
//       final timeSlot = timeSlots[index];
//       final isSelected = selectedHours.contains(timeSlot);

//       return GestureDetector(
//         onTap: () {
//           setState(() {
//             if (isSelected) {
//               selectedHours.remove(timeSlot);
//             } else {
//               selectedHours.add(timeSlot);
//             }
//           });
//         },
//         child: Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: isSelected ? AppColors.orangeColor : AppColors.whiteColor,
//             border: Border.all(color: AppColors.orangeColor),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(IconsPath.iconsFavTime),
//               8.kw,
//               Text(
//                 timeSlot,
//                 style: TextStyle(
//                   color: isSelected
//                       ? AppColors.whiteColor
//                       : AppColors.orangeColor.withOpacity(0.7),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
