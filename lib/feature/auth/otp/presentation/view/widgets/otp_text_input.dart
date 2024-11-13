import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/validate.dart';
import 'package:weisro/feature/auth/otp/presentation/manager/verify_otp_cubit/verify_otp_cubit.dart';

class OtpTextInput extends StatelessWidget {
  const OtpTextInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: Constants.otpLength,
      controller: VerifyOtpCubit.get(context).otpController,
      validator: (value) =>
          Validate.validateOtp(value, context, Constants.otpLength),
      defaultPinTheme: PinTheme(
        width: 48,
        height: 57,
        textStyle: AppStyles.style12w400Grey(context),
        decoration: BoxDecoration(
          color: AppColors.second1Color,
          border: Border.all(color: AppColors.second1Color),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      // focusedPinTheme: focusedPinTheme,
      // submittedPinTheme: submittedPinTheme,
      animationCurve: Curves.easeInCirc,
      animationDuration: const Duration(milliseconds: 20),
      autofocus: true,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,

      showCursor: true,
    );
  }
}
