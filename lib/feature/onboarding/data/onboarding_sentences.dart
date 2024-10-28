import 'package:flutter/material.dart';
import 'package:weisro/generated/l10n.dart';

abstract class OnboardingSentences {
  static List<String> onboardingSentences(BuildContext context) {
    return [
      S.of(context).Search_job_flexible_hours,
      S.of(context).Rent_equipment,
      S.of(context).Hire_employees
    ];
  }
}
