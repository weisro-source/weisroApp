import 'dart:developer' as dev;
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/service_locator.dart';

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
  String getEmail() => emailController.text;

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
  FocusNode serviceFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  FocusNode costPerHourFocusNode = FocusNode();

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
  TextEditingController serviceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController costPerHourController = TextEditingController();

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
    dev.log("Selected days updated: $selectedDay");
  }

  void updateFavoriteTimes(String time, bool isAdd) {
    if (isAdd) {
      favoriteTimes.add(time);
    } else {
      favoriteTimes.remove(time);
    }
    dev.log("Selected Favorite Times updated: $favoriteTimes");
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
      dev.log("Register Client Success ${successRegisterClient.toString()}");
      emit(RegisterSuccess(successRegister: successRegisterClient));
    });
  }

  void initializeTestData() {
    if (HelperFunctions.isDebugMode()) {
      // Create a random instance
      final random = Random();

      // Generate a random phone number with a 3-digit prefix and a 7-digit suffix
      String randomPhoneNumber =
          '+1${(random.nextInt(900) + 100)}${(random.nextInt(9000000) + 1000000)}';

      // Generate a random email address
      String randomEmail = 'user${random.nextInt(1000)}@example.com';

      // Populate fields with random values in debug mode
      emailController.text = randomEmail;
      passwordController.text = "TestPassword123";
      confirmationPasswordController.text = "TestPassword123";
      firstNameController.text = "John";
      lastNameController.text = "Doe";
      phoneController.text = randomPhoneNumber;
      cityController.text = "Berlin";
      postalCodeController.text = "10115";
      streetController.text = "Example Street";
      houseNumberController.text = "42";
    }
  }
}
