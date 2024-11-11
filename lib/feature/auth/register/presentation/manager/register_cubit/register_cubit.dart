import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/data/models/address_model.dart';
import 'package:weisro/feature/auth/data/models/success_register_model.dart';
import 'package:weisro/feature/auth/data/models/user_client_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial()) {
    if (HelperFunctions.isDebugMode()) {
      initializeTestData();
    }
  }
  static RegisterCubit get(context) => BlocProvider.of(context);
  // Form key
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerSecondFormKey = GlobalKey<FormState>();

  // Focus nodes for the fields
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmationPasswordFocusNode = FocusNode();
  FocusNode checkBoxFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();
  FocusNode postalCodeFocusNode = FocusNode();
  FocusNode streetFocusNode = FocusNode();
  FocusNode houseNumberFocusNode = FocusNode();
  FocusNode nextButtonFocusNode = FocusNode();
  FocusNode privacyFocusNode = FocusNode();
  FocusNode termsFocusNode = FocusNode();

  // Controllers for fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPasswordController =
      TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();

  CancelToken registerClientCancelToken = CancelToken();
  String hintTextX = "xxxxxx";
  String hintTextPassword = "********";
  String countryName = "Germany";
  bool isTermsOk = false;
  bool isPrivacyOk = false;
  List<String> selectedDay = [];
  List<String> favoriteTimes = [];

  Address createAddress() {
    return Address(
      city: cityController.text,
      country: countryName,
      houseNumber: houseNumberController.text,
      postalCode: postalCodeController.text,
      street: streetController.text,
    );
  }

  UserClientModel createClient() {
    return UserClientModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        address: createAddress());
  }

  void updateSelectedDays(List<String> days) {
    selectedDay = days;
    log("Selected days updated: $selectedDay");
  }

  void updateFavoriteTimes(String time, bool isAdd) {
    if (isAdd) {
      favoriteTimes.add(time);
    } else {
      favoriteTimes.remove(time);
    }
    log("Selected Favorite Times updated: $favoriteTimes");
  }

  Future<void> registerClient() async {
    if (!HelperFunctions.validateForm(registerSecondFormKey)) {
      return;
    }
    emit(RegisterLoading());
    var registerResult = await getIt
        .get<AuthenticationRepository>()
        .clientRegisterApi(createClient(), registerClientCancelToken);
    registerResult.fold((errorInRegisterClient) {
      emit(RegisterFailures(errMessage: errorInRegisterClient.errMassage));
    }, (successRegisterClient) {
      log("Register Client Success ${successRegisterClient.toString()}");
      emit(RegisterSuccess(successRegister: successRegisterClient));
    });
  }

  void showAgreementDialog(
      BuildContext context, String dialogTitle, String dialogContent) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Image.asset(ImagePath.imagesLogo),
                        5.kh,
                        Text(
                          dialogTitle,
                          style: AppStyles.style20w500White(context).copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 15),
                  Text(
                    dialogContent,
                    style: AppStyles.style16w500Black(context),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        height: 45,
                        width: 130,
                        borderColor: Colors.transparent,
                        buttonColor: AppColors.greenColor,
                        text: "Ok",
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void initializeTestData() {
    if (HelperFunctions.isDebugMode()) {
      // Only populate fields in debug mode
      emailController.text = "testuser@example.com";
      passwordController.text = "TestPassword123";
      confirmationPasswordController.text = "TestPassword123";
      firstNameController.text = "John";
      lastNameController.text = "Doe";
      phoneController.text = "+1234567890";
      cityController.text = "Berlin";
      postalCodeController.text = "10115";
      streetController.text = "Example Street";
      houseNumberController.text = "42";
    }
  }
}
