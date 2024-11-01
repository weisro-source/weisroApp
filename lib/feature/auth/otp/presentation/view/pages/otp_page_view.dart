import 'package:flutter/material.dart';
import 'package:weisro/feature/auth/otp/presentation/view/pages/otp_page_view_body.dart';

class OtpPageView extends StatelessWidget {
  const OtpPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: OtpPageViewBody());
  }
}
