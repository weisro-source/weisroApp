import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/data/models/success_login_model.dart';
import 'package:weisro/feature/auth/data/models/user_client_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    if (HelperFunctions.isDebugMode()) {
      initializeTestLoginData();
    }
  }
  static LoginCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode loginButtonFocusNode = FocusNode();
  String hintTextPassword = "********";
  CancelToken cancelToken = CancelToken();
  UserClientModel userToLogin() {
    return UserClientModel(
        email: emailController.text, password: passwordController.text);
  }

  void initializeTestLoginData() {
    passwordController.text = '513409409';
    emailController.text = 'nassimtok9@gmail.com';
  }

  Future<void> login(BuildContext context) async {
    if (!HelperFunctions.validateForm(loginFormKey)) {
      return;
    }
    emit(LoginLoading());
    var result = await getIt
        .get<AuthenticationRepository>()
        .loginApi(userToLogin(), cancelToken);
    result.fold((errorInLogin) {
      emit(LoginFailures(errMessage: errorInLogin.errMassage));
    }, (loginSuccess) {
      emit(LoginSuccess(successLoginModel: loginSuccess));
    });
  }
}