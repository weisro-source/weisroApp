import 'package:flutter/material.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/generated/l10n.dart';

class FavoriteTimeQuestionWidget extends StatelessWidget {
  const FavoriteTimeQuestionWidget({
    super.key,
    required this.icon,
  });
  final String icon;
  @override
  Widget build(BuildContext context) {
    return QuestionWidget(
        icon: icon, questionText: S.of(context).Favorite_Time);
  }
}
