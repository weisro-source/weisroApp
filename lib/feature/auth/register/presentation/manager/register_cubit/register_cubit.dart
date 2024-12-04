import 'dart:developer' as dev;
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/ansi_color.dart';

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
  CancelToken registerWorkerCancelToken = CancelToken();
  String hintTextX = "xxxxxx";
  String hintTextPassword = "********";
  String countryName = "Germany";
  String cityName = "";
  bool isTermsOk = false;
  bool isPrivacyOk = false;
  List<String> selectedDay = [];
  List<String> favoriteTimes = []; // store the hours fav time
  List<String> favoriteHours = []; // store the hours
  List<String> imagesPathsForId =
      []; // Store image paths for id and passport etc ....
  String imagePathForProfile = ''; // Store image paths for profile

  Address createAddress() {
    return Address(
      city: cityName,
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

  void updateFavoriteHoursTimes(String time, bool isAdd) {
    if (isAdd) {
      favoriteHours.add(time);
    } else {
      favoriteHours.remove(time);
    }
    dev.log("Selected Favorite *Hours* updated: $favoriteHours");
  }

  Future<FormData> prepareFormDataForWorkerRegister() async {
    List<String> formattedTimes = [];

    // Loop through each time and debug the processing
    for (String time in favoriteHours) {
      dev.log("Raw time: $time"); // Debug the raw time

      // Split the time range by dash ('-')
      List<String> timeParts = time.split('-');
      dev.log("Split time parts: $timeParts"); // Debug the split result

      if (timeParts.length == 2) {
        String startTime = timeParts[0].trim(); // Trim spaces
        String endTime = timeParts[1].trim(); // Trim spaces

        // Debug the individual start and end times
        dev.log("Start time: $startTime, End time: $endTime");

        // Format the time by removing unnecessary padding
        startTime = formatTimeForAPI(startTime); // Format start time
        endTime = formatTimeForAPI(endTime); // Format end time

        if (isValidTime(startTime) && isValidTime(endTime)) {
          formattedTimes.add('$startTime-$endTime');
          dev.log("Valid time range: $startTime-$endTime");
        } else {
          dev.log("Invalid time format: $startTime-$endTime");
        }
      } else {
        dev.log("Invalid time range format: $time");
      }
    }

    // Debug the formattedTimes list before returning
    dev.log("Formatted times: $formattedTimes");

    FormData formData = FormData.fromMap({
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'password': passwordController.text,
      'address[city]': cityController.text,
      'address[country]': countryName,
      'address[postal_code]': postalCodeController.text,
      'address[house_number]': houseNumberController.text,
      'address[street]': streetController.text,
      // Dynamically handle selected days
      for (int i = 0; i < selectedDay.length; i++) 'days[$i]': selectedDay[i],
      'services_description': descriptionController.text,
      'services[0]': serviceController.text,
      // Adding profile image if available
      'profile_image': imagePathForProfile.isNotEmpty
          ? await MultipartFile.fromFile(imagePathForProfile)
          : null,
      'validate_document': imagesPathsForId.isNotEmpty
          ? await MultipartFile.fromFile(imagesPathsForId.first)
          : null,
      // Dynamically handle formatted times
      for (int i = 0; i < formattedTimes.length; i++)
        'time[$i]': formattedTimes[i],
      'fare_per_hour': costPerHourController.text,
      'age': '30', // Adjust this logic as needed
    });

    return formData;
  }

// Helper function to validate the time format (H:mm) or just H
  bool isValidTime(String time) {
    final timePattern = RegExp(r'^(?:[0-9]|1[0-9]|2[0-3])(:[0-5][0-9])?$');
    return timePattern.hasMatch(time);
  }

// Helper function to format time to H (without leading zero for both hour and minute)
  String formatTimeForAPI(String time) {
    // Remove any spaces and make sure it follows H format
    time = time.replaceAll(' ', ''); // Remove spaces
    List<String> timeParts = time.split(':');

    if (timeParts.length == 2) {
      String hours = timeParts[0]; // Keep the hour as is (no padding)
      String minutes = timeParts[1]; // Only minutes part
      if (minutes == "00") {
        return hours; // Only return hour if minutes are '00'
      }
      return '$hours:$minutes'; // Format as hour:minute if minutes are non-zero
    }
    return time; // Return as is if it can't be formatted
  }

  // for (int i = 0; i < imagesPathsForId.length; i++)
  //     'validate_document[$i]': await MultipartFile.fromFile(imagesPathsForId[i]),
// 'validate_document': imagesPathsForId.isNotEmpty
//           ? await MultipartFile.fromFile(imagesPathsForId.first)
//           : null,
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

  Future<void> registerWorker() async {
    if (!HelperFunctions.validateForm(registerSecondFormKey)) {
      return;
    }
    FormData data = await prepareFormDataForWorkerRegister();
    dev.log(
        AnsiColor.colorize(
          " Data: ${data.fields}",
          AnsiColor.yellow,
        ),
        name: "register Worker");
    emit(RegisterLoading());
    var registerResult = await getIt
        .get<AuthenticationRepository>()
        .workerRegisterApi(data, registerWorkerCancelToken);
    registerResult.fold((errorInRegisterClient) {
      emit(RegisterFailures(errMessage: errorInRegisterClient.errMassage));
    }, (successRegisterClient) {
      dev.log("Register Worker Success ${successRegisterClient.toString()}");
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

  /// Clean up resources
  @override
  Future<void> close() {
    // Dispose of all FocusNodes
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmationPasswordFocusNode.dispose();
    checkBoxFocusNode.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    cityFocusNode.dispose();
    postalCodeFocusNode.dispose();
    streetFocusNode.dispose();
    houseNumberFocusNode.dispose();
    nextButtonFocusNode.dispose();
    privacyFocusNode.dispose();
    termsFocusNode.dispose();
    serviceFocusNode.dispose();
    descriptionFocusNode.dispose();
    costPerHourFocusNode.dispose();

    // Dispose of all TextEditingControllers
    emailController.dispose();
    passwordController.dispose();
    confirmationPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    streetController.dispose();
    houseNumberController.dispose();
    serviceController.dispose();
    descriptionController.dispose();
    costPerHourController.dispose();

    return super.close();
  }
}
