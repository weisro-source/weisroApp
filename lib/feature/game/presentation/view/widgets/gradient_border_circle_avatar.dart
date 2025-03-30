import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';

class GradientBorderCircleAvatar extends StatelessWidget {
  final double radius;
  final Color backgroundColor;

  const GradientBorderCircleAvatar({
    super.key,
    required this.radius,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFF7226C7),
            Color(0xFF39147E),
            Color(0xFF5342C6),
            Color(0xFF5747CB),
            Color(0xFF6358DC),
            Color(0xFF7874F8),
            Color(0xFF7D7BFF),
          ],
        ),
      ),
      padding: const EdgeInsets.all(3), 
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(3),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundColor: backgroundColor,
              radius: radius,
            ),
            SizedBox(
              width: radius * 1.2,
              height: radius * 1.2,
              child: Image.asset(
                IconsPath.iconsGoldPerson,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
