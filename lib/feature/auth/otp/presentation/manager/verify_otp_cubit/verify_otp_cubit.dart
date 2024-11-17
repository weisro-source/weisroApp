import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit() : super(VerifyOtpInitial());
  static VerifyOtpCubit get(context) => BlocProvider.of(context);
  TextEditingController otpController = TextEditingController();
  CancelToken cancelToken = CancelToken();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  Map<String, dynamic> verifyOtpData(BuildContext context, [String? email]) {
    return {
      "email": email ?? RegisterCubit.get(context).getEmail(),
      "otp": otpController.text
    };
  }

  Future<void> verifyOtp(BuildContext context, [String? email]) async {
    if (!HelperFunctions.validateForm(otpFormKey)) {
      return;
    }

    emit(VerifyOtpLoading());
    var result = await getIt.get<AuthenticationRepository>().verifyOtpApi(
        email != null ? verifyOtpData(context, email) : verifyOtpData(context),
        cancelToken);
    result.fold((errorInVerifyOtp) {
      emit(VerifyOtpFailure(errMessage: errorInVerifyOtp.errMassage));
    }, (verifySuccess) {
      emit(VerifyOtpSuccess());
    });
  }
}
