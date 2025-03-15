import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/google_auth/google_auth.dart';
import 'package:weisro/feature/auth/login/presentation/managers/login_cubit.dart/login_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';

import 'login_page_view_body.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key, this.role}) : super(key: key);
  final String? role;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => GoogleAuthCubit(),
        ),
      ],
      child: Scaffold(
          body: LoginPageViewBody(
        role: role,
      )),
    );
  }
}
