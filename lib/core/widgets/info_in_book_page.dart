import 'package:flutter/material.dart';

class InfoInBookPage extends StatelessWidget {
  const InfoInBookPage({
    super.key,
    this.info,
    this.child,
    required this.borderedColor,
    required this.color,
    this.style,
  });

  final String? info;
  final Widget? child;
  final Color borderedColor, color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderedColor),
        color: color,
      ),
      child: Center(
        child: child ??
            (info != null ? Text(info!, style: style) : const SizedBox()),
      ),
    );
  }
}
