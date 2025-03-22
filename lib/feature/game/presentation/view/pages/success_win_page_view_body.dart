import 'dart:async'; // For Timer
import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/game/presentation/game_text_style.dart';

class SuccessWinPageViewBody extends StatefulWidget {
  const SuccessWinPageViewBody({super.key});

  @override
  State<SuccessWinPageViewBody> createState() => _SuccessWinPageViewBodyState();
}

class _SuccessWinPageViewBodyState extends State<SuccessWinPageViewBody> {
  Duration duration = const Duration(
      hours: 6, minutes: 12, seconds: 65); // Initial countdown time
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer(); // Start countdown on widget initialization
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (duration > Duration.zero) {
          duration -= const Duration(seconds: 1); // Decrement timer by 1 second
        } else {
          timer.cancel(); // Stop the timer when it reaches zero
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer to avoid memory leaks
    super.dispose();
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(d.inHours);
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds"; // Format as HH:MM:SS
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          50.kh,
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 60),
            child: Center(
              child: Text(
                "Your choice has been registered. You can view your choice from the registration.",
                style: AppStyles.style24w400Orange(context).copyWith(
                    color: AppColors.whiteColor, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          15.kh,
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 43),
            child: Center(
              child: Image.asset(
                ImagePath.imagesSuccessImage,
                width: HelperFunctions.getScreenWidth(context) * 0.86,
              ),
            ),
          ),
          15.kh,
          Text(
            "You can guess again for free after:",
            style: AppStyles.style20w500Grey(context).copyWith(
                color: AppColors.whiteColor, fontWeight: FontWeight.w700),
          ),
          15.kh,

          // Countdown Timer Container
          Container(
            height: 70,
            alignment: Alignment.center,
            width: HelperFunctions.getScreenWidth(context) * 0.7,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: AppColors.red2Color,
            ),
            child: Center(
              child: Text(
                formatTime(duration),
                style: GameAppStyles.gameTextStyle50w700(
                    context), 
              ),
            ),
          ),

          15.kh,
          Center(
            child: Text(
              "Watch an ad and get a reward Save time",
              style: AppStyles.style20w500White(context)
                  .copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          15.kh,
          Text(
            "1 ad = 30 minutes of time saving",
            style: AppStyles.style20w500White(context)
                .copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          15.kh,
        ],
      ),
    );
  }
}
