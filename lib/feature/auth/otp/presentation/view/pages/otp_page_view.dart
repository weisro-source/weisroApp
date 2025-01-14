import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:weisro/feature/auth/otp/presentation/manager/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:weisro/feature/auth/otp/presentation/view/pages/otp_page_view_body.dart';

class OtpPageView extends StatelessWidget {
  const OtpPageView(
      {Key? key,
      required this.isForgetPassword,
      this.email,
      this.isChangeEmail = false})
      : super(key: key);
  final bool isForgetPassword;
  final bool isChangeEmail;
  final String? email;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VerifyOtpCubit(),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordCubit()..initState(),
        ),
      ],
      child: Scaffold(
          body: OtpPageViewBody(
        isForgetPassword: isForgetPassword,
        isChangeEmail: isChangeEmail,
        email: email,
      )),
    );
  }
}
