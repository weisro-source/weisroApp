import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.note,
  });
  final String note;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        note,
        style: AppStyles.style10w500Red(context),
      ),
    );
  }
}
