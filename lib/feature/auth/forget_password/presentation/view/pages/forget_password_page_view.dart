import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';

import 'forget_password_page_view_body.dart';

class ForgetPasswordPageView extends StatelessWidget {
  const ForgetPasswordPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: const Scaffold(body: ForgetPasswordPageViewBody()),
    );
  }
}
