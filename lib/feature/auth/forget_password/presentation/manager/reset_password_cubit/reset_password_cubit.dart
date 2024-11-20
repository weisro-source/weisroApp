import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPasswordController =
      TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmationPasswordFocusNode = FocusNode();
  FocusNode recoverPasswordButton = FocusNode();
  CancelToken cancelToken = CancelToken();

  Map<String, dynamic> dataToResetPassword(String code) {
    return {'otp': code, 'password': passwordController.text};
  }

  Future<void> resetPassword(String code) async {
    if (!HelperFunctions.validateForm(resetPasswordFormKey)) {
      return;
    }
    emit(ResetPasswordLoading());
    var resetPasswordApiResult = await getIt
        .get<AuthenticationRepository>()
        .resetPassword(dataToResetPassword(code), cancelToken);
    resetPasswordApiResult.fold((errorInResetPassword) {
      emit(ResetPasswordFailures(errMessage: errorInResetPassword.errMassage));
    }, (resetPasswordSuccess) {
      emit(ResetPasswordSuccess(successMessage: resetPasswordSuccess));
    });
  }
}
