import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/models/countries_model.dart';
import 'package:weisro/feature/profile/data/account_repo/account_repo.dart';

part 'edit_user_info_state.dart';

class EditUserInfoCubit extends Cubit<EditUserInfoState> {
  EditUserInfoCubit() : super(EditUserInfoInitial());
  static EditUserInfoCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> editAccountFormKey = GlobalKey<FormState>();

  // TextEditingController fullNameController = TextEditingController(
  //     text:
  //         "${CacheHelper.getData(key: CacheKeys.kUserFirstName)} ${CacheHelper.getData(key: CacheKeys.kUserLastName)} ");
  TextEditingController firstNameController = TextEditingController(
      text: CacheHelper.getData(key: CacheKeys.kUserFirstName));
  TextEditingController lastNameController = TextEditingController(
      text: CacheHelper.getData(key: CacheKeys.kUserLastName));
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
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  FocusNode postalCodeFocusNode = FocusNode();
  FocusNode streetFocusNode = FocusNode();
  FocusNode houseNumberFocusNode = FocusNode();

  void initControllers() {
    firstNameController.text =
        CacheHelper.getData(key: CacheKeys.kUserFirstName);
    lastNameController.text = CacheHelper.getData(key: CacheKeys.kUserLastName);
    postalCodeController.text =
        CacheHelper.getData(key: CacheKeys.kUserZipCode);
    streetController.text = CacheHelper.getData(key: CacheKeys.kUserStreet);
    houseNumberController.text =
        CacheHelper.getData(key: CacheKeys.kHouseNumber);
  }

  Future<void> updateCacheData(
      String cityName,
      Country country,
      String firstName,
      String lastName,
      String street,
      String zip,
      String houseNumber) async {
    await CacheHelper.setData(key: CacheKeys.kCityName, value: cityName);
    await CacheHelper.setData(key: CacheKeys.kCountryName, value: country.name);
    await CacheHelper.setData(key: CacheKeys.kCountryId, value: country.id);
    await CacheHelper.setData(key: CacheKeys.kUserFirstName, value: firstName);
    await CacheHelper.setData(key: CacheKeys.kUserLastName, value: lastName);
    await CacheHelper.setData(key: CacheKeys.kUserStreet, value: street);
    await CacheHelper.setData(key: CacheKeys.kUserZipCode, value: zip);
    await CacheHelper.setData(key: CacheKeys.kHouseNumber, value: houseNumber);
  }

  Map<String, dynamic> prepareUserData({
    required String firstName,
    required String lastName,
    required String city,
    required String country,
    required String postalCode,
    required String houseNumber,
    required String street,
  }) {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "address": {
        "city": city,
        "country": country,
        "postal_code": postalCode,
        "house_number": houseNumber,
        "street": street,
      }
    };
  }

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
