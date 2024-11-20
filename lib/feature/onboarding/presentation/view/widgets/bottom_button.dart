import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/skip_button.dart';

import 'circle_indicator_painter.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({
    super.key,
    required this.currentIndexNotifier,
    this.onPressedOnSkip,
    this.onTapOnArrow,
  });

  final ValueNotifier<int> currentIndexNotifier;
  final void Function()? onPressedOnSkip;
  final void Function()? onTapOnArrow;

  @override
  BottomButtonState createState() => BottomButtonState();
}

class BottomButtonState extends State<BottomButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0.0, end: 0.0).animate(_controller);

    widget.currentIndexNotifier.addListener(_onIndexChanged);

    _onIndexChanged();
  }

  void _onIndexChanged() {
    double newProgress = (widget.currentIndexNotifier.value + 1) / 3;

    _animation = Tween<double>(
      begin: _animation.value,
      end: newProgress,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.currentIndexNotifier.removeListener(_onIndexChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BottomButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndexNotifier != widget.currentIndexNotifier) {
      oldWidget.currentIndexNotifier.removeListener(_onIndexChanged);
      widget.currentIndexNotifier.addListener(_onIndexChanged);
      _onIndexChanged();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SkipButton(onPressedOnSkip: widget.onPressedOnSkip),
        SizedBox(
          width: 45,
          height: 45,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: CircleIndicatorPainter(_animation.value),
                child: GestureDetector(
                  onTap: widget.onTapOnArrow,
                  child: Center(
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(),
                        color: AppColors.orangeColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset(IconsPath.iconsArrowLeft),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
