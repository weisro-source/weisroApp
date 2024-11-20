// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/forget_password/presentation/manager/reset_password_cubit/reset_password_cubit.dart';

import 'new_password_page_view_body.dart';

class NewPasswordPageView extends StatelessWidget {
  const NewPasswordPageView({Key? key, required this.code}) : super(key: key);
  final String code;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Scaffold(body: NewPasswordPageViewBody(code:code)),
    );
  }
}
