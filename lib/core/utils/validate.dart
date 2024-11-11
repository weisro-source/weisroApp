import 'package:flutter/material.dart';

class Validate {
  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    // Regular expression for email validation
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return "Email must be a valid email address";
    }

    return null;
  }

  // static String? validatePhoneNumberCountry(
  //     String? value, BuildContext context) {
  //   if (value == null || value.isEmpty) {
  //     return 'Phone number is required';
  //   }

  //   final countryCode = context.read<DropdownCubit>().state;
  //   final phoneNumber = value.replaceFirst(countryCode, '');

  //   if (phoneNumber.isEmpty || phoneNumber.length < 7) {
  //     return 'Enter a valid phone number';
  //   }

  //   return null;
  // }

  static String? validatePhoneNumber(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    return null;
  }

  static String? validateOtp(String? value, BuildContext context, int length) {
    if (value == null || value.isEmpty) {
      return "OTP code is required";
    } else if (value.length < length) {
      return "OTP code must be exactly $length characters";
    }
    return null;
  }

  static String? validateFullName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "Full name is required";
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? validateField(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static String? validateFieldWithTitle(
      String? value, String title, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "%s is required".replaceFirst('%s', title);
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value, String? password, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "Confirm password is required";
    } else if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }
}
