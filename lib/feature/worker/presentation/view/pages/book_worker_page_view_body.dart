import 'package:flutter/material.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/generated/l10n.dart';

class BookWorkerPageViewBody extends StatelessWidget {
  const BookWorkerPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: S.of(context).Book_Worker),
      ],
    );
  }
}
