import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import '../widgets/code_send_success_text_widget.dart';
import '../widgets/congratulations_widget.dart';
import '../widgets/three_quarters_circle_painter.dart';

class SuccessScreenPageViewBody extends StatefulWidget {
  const SuccessScreenPageViewBody({super.key});

  @override
  SuccessScreenPageViewBodyState createState() =>
      SuccessScreenPageViewBodyState();
}

class SuccessScreenPageViewBodyState extends State<SuccessScreenPageViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circle1Opacity;
  late Animation<double> _circle2Opacity;
  late Animation<double> _circle3Opacity;
  late Animation<double> _circle4Opacity;
  late Animation<double> _iconOpacity;
  late Animation<double> _rowOpacity;

  @override
  void initState() {
    super.initState();
    _initAnimationController();
    _initAnimations();
    _controller.forward();
  }

  void _initAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  void _initAnimations() {
    _circle1Opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeIn),
      ),
    );
    _circle2Opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
      ),
    );
    _circle3Opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
      ),
    );
    _circle4Opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
      ),
    );
    _iconOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeIn),
      ),
    );
    _rowOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(1.0, 1.2, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = HelperFunctions.getScreenWidth(context);
    final scaleFactor = screenWidth / 375;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            children: [
              FadeTransition(
                opacity: _circle1Opacity,
                child: Container(
                  width: 261 * scaleFactor,
                  height: 261 * scaleFactor,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.second1Color,
                  ),
                ),
              ),
              FadeTransition(
                opacity: _circle2Opacity,
                child: Container(
                  width: 213 * scaleFactor,
                  height: 213 * scaleFactor,
                  margin: EdgeInsetsDirectional.all(24 * scaleFactor),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.second1Color,
                  ),
                ),
              ),
              FadeTransition(
                opacity: _circle3Opacity,
                child: Container(
                  width: 154 * scaleFactor,
                  height: 154 * scaleFactor,
                  margin: EdgeInsetsDirectional.all(54 * scaleFactor),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.second1Color,
                  ),
                ),
              ),
              FadeTransition(
                opacity: _circle4Opacity,
                child: Container(
                  width: 79.16 * scaleFactor,
                  height: 79.16 * scaleFactor,
                  margin: EdgeInsetsDirectional.all(90 * scaleFactor),
                  child: CustomPaint(
                    painter: ThreeQuartersCirclePainter(),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              FadeTransition(
                opacity: _iconOpacity,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 120 * scaleFactor,
                    start: 109 * scaleFactor,
                  ),
                  child: SvgPicture.asset(
                    IconsPath.iconsSuccess,
                    width: 30 * scaleFactor,
                    height: 30 * scaleFactor,
                  ),
                ),
              ),
            ],
          ),
        ),
        57.kh,
        FadeTransition(
          opacity: _rowOpacity,
          child: const CongratulationsWidget(),
        ),
        5.kh,
        const CodeSendSuccessTextWidget(),
      ],
    );
  }
}
