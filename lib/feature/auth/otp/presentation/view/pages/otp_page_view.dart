import 'package:flutter/material.dart';
import 'package:weisro/feature/auth/otp/presentation/view/pages/otp_page_view_body.dart';

class OtpPageView extends StatelessWidget {
  const OtpPageView({Key? key, required this.isForgetPassword})
      : super(key: key);
  final bool isForgetPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OtpPageViewBody(
      isForgetPassword: isForgetPassword,
    ));
  }
}
