import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode sendOtpButtonFocusNode = FocusNode();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  CancelToken cancelToken = CancelToken();

  // this to call api to resend Otp To Forget Password
  Future<void> resendOtp() async {
    if (!HelperFunctions.validateForm(forgetPasswordFormKey)) {
      return;
    }
    emit(ForgetPasswordLoading());
    var result = await getIt
        .get<AuthenticationRepository>()
        .forgetPassword(emailController.text, cancelToken);
    result.fold((errorInSendOtpToForgetPassword) {
      emit(ForgetPasswordFailures(
          errMessage: errorInSendOtpToForgetPassword.errMassage));
    }, (successSendOtpToForgetPassword) {
      emit(ForgetPasswordSuccess());
    });
  }
}
