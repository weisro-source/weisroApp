import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';

class TextLanWidget extends StatelessWidget {
  const TextLanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 29,
        ),
        Text(
          'Choose your language',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            fontFamily: AppStyles.getFontFamily(context),
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        Text(
          'Please choose your language!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: AppStyles.getFontFamily(context),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ],
    );
  }
}
