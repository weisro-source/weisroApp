import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/profile/data/account_repo/account_repo.dart';

part 'edit_user_info_state.dart';

class EditUserInfoCubit extends Cubit<EditUserInfoState> {
  EditUserInfoCubit() : super(EditUserInfoInitial());
  static EditUserInfoCubit get(context) => BlocProvider.of(context);
  TextEditingController fullNameController = TextEditingController(
      text:
          "${CacheHelper.getData(key: CacheKeys.kUserFirstName)} ${CacheHelper.getData(key: CacheKeys.kUserLastName)} ");

  TextEditingController emailController = TextEditingController(
      text: CacheHelper.getData(key: CacheKeys.kUserEmail));
  TextEditingController phoneController = TextEditingController(
      text: CacheHelper.getData(key: CacheKeys.kUserPhone));
  TextEditingController postalCodeController = TextEditingController(
      text: CacheHelper.getData(key: CacheKeys.kUserZipCode));
  TextEditingController streetController = TextEditingController(
      text: CacheHelper.getData(key: CacheKeys.kUserStreet));
  TextEditingController houseNumberController = TextEditingController(
      text: CacheHelper.getData(key: CacheKeys.kHouseNumber));

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  FocusNode postalCodeFocusNode = FocusNode();
  FocusNode streetFocusNode = FocusNode();
  FocusNode houseNumberFocusNode = FocusNode();
  Future<void> initTextController() async {}
  Future<void> editUser(Map<String, dynamic> data) async {
    emit(EditUserInfoLoading());
    var result = await getIt.get<AccountRepository>().editUserAccount(data);
    result.fold((errorInEditAccount) {
      emit(EditUserInfoFailures(error: errorInEditAccount));
    }, (editUsers) {
      emit(EditUserInfoSuccess(message: editUsers));
    });
  }
}
