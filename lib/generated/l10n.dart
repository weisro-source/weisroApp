// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Choose what you want to create an account:`
  String get Selected_account {
    return Intl.message(
      'Choose what you want to create an account:',
      name: 'Selected_account',
      desc: '',
      args: [],
    );
  }

  /// `Worker`
  String get Worker {
    return Intl.message(
      'Worker',
      name: 'Worker',
      desc: '',
      args: [],
    );
  }

  /// `Client`
  String get Client {
    return Intl.message(
      'Client',
      name: 'Client',
      desc: '',
      args: [],
    );
  }

  /// `You can search for a job that suits you with flexible hours and an easy course of work`
  String get Search_job_flexible_hours {
    return Intl.message(
      'You can search for a job that suits you with flexible hours and an easy course of work',
      name: 'Search_job_flexible_hours',
      desc: '',
      args: [],
    );
  }

  /// `Rent your equipment and start earning money with weisro`
  String get Rent_equipment {
    return Intl.message(
      'Rent your equipment and start earning money with weisro',
      name: 'Rent_equipment',
      desc: '',
      args: [],
    );
  }

  /// `You can hire employees to carry out tasks starting from an hour and up to a whole day`
  String get Hire_employees {
    return Intl.message(
      'You can hire employees to carry out tasks starting from an hour and up to a whole day',
      name: 'Hire_employees',
      desc: '',
      args: [],
    );
  }

  /// `Create Client account`
  String get Create_Client_account {
    return Intl.message(
      'Create Client account',
      name: 'Create_Client_account',
      desc: '',
      args: [],
    );
  }

  /// `Create Worker account`
  String get Create_Worker_Account {
    return Intl.message(
      'Create Worker account',
      name: 'Create_Worker_Account',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get First_Name {
    return Intl.message(
      'First Name',
      name: 'First_Name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get Last_Name {
    return Intl.message(
      'Last Name',
      name: 'Last_Name',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get Country {
    return Intl.message(
      'Country',
      name: 'Country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get City {
    return Intl.message(
      'City',
      name: 'City',
      desc: '',
      args: [],
    );
  }

  /// `Postal code`
  String get Postal_Code {
    return Intl.message(
      'Postal code',
      name: 'Postal_Code',
      desc: '',
      args: [],
    );
  }

  /// `The street`
  String get Street {
    return Intl.message(
      'The street',
      name: 'Street',
      desc: '',
      args: [],
    );
  }

  /// `House Number`
  String get House_Number {
    return Intl.message(
      'House Number',
      name: 'House_Number',
      desc: '',
      args: [],
    );
  }

  /// `Next Step`
  String get Next_Step {
    return Intl.message(
      'Next Step',
      name: 'Next_Step',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get OR {
    return Intl.message(
      'OR',
      name: 'OR',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with Google`
  String get Sign_Up_with_Google {
    return Intl.message(
      'Sign Up with Google',
      name: 'Sign_Up_with_Google',
      desc: '',
      args: [],
    );
  }

  /// `Have an account?`
  String get Have_Account {
    return Intl.message(
      'Have an account?',
      name: 'Have_Account',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get Log_in {
    return Intl.message(
      'Log in',
      name: 'Log_in',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get Mobile_Number {
    return Intl.message(
      'Mobile Number',
      name: 'Mobile_Number',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get Confirm_Password {
    return Intl.message(
      'Confirm Password',
      name: 'Confirm_Password',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get Create_Account {
    return Intl.message(
      'Create Account',
      name: 'Create_Account',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the`
  String get I_agree_to_the {
    return Intl.message(
      'I agree to the',
      name: 'I_agree_to_the',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get Terms_of_Use {
    return Intl.message(
      'Terms of Use',
      name: 'Terms_of_Use',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get Privacy_Policy {
    return Intl.message(
      'Privacy Policy',
      name: 'Privacy_Policy',
      desc: '',
      args: [],
    );
  }

  /// `Get the Code`
  String get Get_the_Code {
    return Intl.message(
      'Get the Code',
      name: 'Get_the_Code',
      desc: '',
      args: [],
    );
  }

  /// `The code will be sent to the following Email`
  String get Code_sent_to_email {
    return Intl.message(
      'The code will be sent to the following Email',
      name: 'Code_sent_to_email',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get Verify_Code {
    return Intl.message(
      'Verify Code',
      name: 'Verify_Code',
      desc: '',
      args: [],
    );
  }

  /// `You haven't received a code yet?`
  String get Code_not_received {
    return Intl.message(
      'You haven\'t received a code yet?',
      name: 'Code_not_received',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get Resend {
    return Intl.message(
      'Resend',
      name: 'Resend',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations`
  String get Congratulations {
    return Intl.message(
      'Congratulations',
      name: 'Congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get Verify {
    return Intl.message(
      'Verify',
      name: 'Verify',
      desc: '',
      args: [],
    );
  }

  /// `The code has been`
  String get The_Code_Has_Been {
    return Intl.message(
      'The code has been',
      name: 'The_Code_Has_Been',
      desc: '',
      args: [],
    );
  }

  /// `successfully`
  String get Successfully {
    return Intl.message(
      'successfully',
      name: 'Successfully',
      desc: '',
      args: [],
    );
  }

  /// `verified`
  String get Verified {
    return Intl.message(
      'verified',
      name: 'Verified',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get Forget_Password {
    return Intl.message(
      'Forget Password?',
      name: 'Forget_Password',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get Send_Code {
    return Intl.message(
      'Send Code',
      name: 'Send_Code',
      desc: '',
      args: [],
    );
  }

  /// `Recover Password`
  String get Recover_Password {
    return Intl.message(
      'Recover Password',
      name: 'Recover_Password',
      desc: '',
      args: [],
    );
  }

  /// `How many days do you want to work during the week?`
  String get How_Many_Days {
    return Intl.message(
      'How many days do you want to work during the week?',
      name: 'How_Many_Days',
      desc: '',
      args: [],
    );
  }

  /// `What's your favorite time to work?`
  String get Favorite_Time {
    return Intl.message(
      'What\'s your favorite time to work?',
      name: 'Favorite_Time',
      desc: '',
      args: [],
    );
  }

  /// `Sa`
  String get Sa {
    return Intl.message(
      'Sa',
      name: 'Sa',
      desc: '',
      args: [],
    );
  }

  /// `Su`
  String get Su {
    return Intl.message(
      'Su',
      name: 'Su',
      desc: '',
      args: [],
    );
  }

  /// `Mo`
  String get Mo {
    return Intl.message(
      'Mo',
      name: 'Mo',
      desc: '',
      args: [],
    );
  }

  /// `Tu`
  String get Tu {
    return Intl.message(
      'Tu',
      name: 'Tu',
      desc: '',
      args: [],
    );
  }

  /// `We`
  String get We {
    return Intl.message(
      'We',
      name: 'We',
      desc: '',
      args: [],
    );
  }

  /// `Th`
  String get Th {
    return Intl.message(
      'Th',
      name: 'Th',
      desc: '',
      args: [],
    );
  }

  /// `Fr`
  String get Fr {
    return Intl.message(
      'Fr',
      name: 'Fr',
      desc: '',
      args: [],
    );
  }

  /// `Morning`
  String get Morning {
    return Intl.message(
      'Morning',
      name: 'Morning',
      desc: '',
      args: [],
    );
  }

  /// `Evening`
  String get Evening {
    return Intl.message(
      'Evening',
      name: 'Evening',
      desc: '',
      args: [],
    );
  }

  /// `Night`
  String get Night {
    return Intl.message(
      'Night',
      name: 'Night',
      desc: '',
      args: [],
    );
  }

  /// `Select the services you offer?`
  String get Select_Services {
    return Intl.message(
      'Select the services you offer?',
      name: 'Select_Services',
      desc: '',
      args: [],
    );
  }

  /// `Write here what your services include?`
  String get Describe_Services {
    return Intl.message(
      'Write here what your services include?',
      name: 'Describe_Services',
      desc: '',
      args: [],
    );
  }

  /// `* It is forbidden to publish any addresses or contact information`
  String get No_Addresses {
    return Intl.message(
      '* It is forbidden to publish any addresses or contact information',
      name: 'No_Addresses',
      desc: '',
      args: [],
    );
  }

  /// `My fare per hour?`
  String get Hourly_Rate {
    return Intl.message(
      'My fare per hour?',
      name: 'Hourly_Rate',
      desc: '',
      args: [],
    );
  }

  /// `* Your hourly wage for your services will be added to the value of the tax in your country`
  String get Hourly_Rate_Note {
    return Intl.message(
      '* Your hourly wage for your services will be added to the value of the tax in your country',
      name: 'Hourly_Rate_Note',
      desc: '',
      args: [],
    );
  }

  /// `We need a document to verify that your account is not a fake account`
  String get Document_Verification {
    return Intl.message(
      'We need a document to verify that your account is not a fake account',
      name: 'Document_Verification',
      desc: '',
      args: [],
    );
  }

  /// `* upon verification all documents will be deleted`
  String get Document_Note {
    return Intl.message(
      '* upon verification all documents will be deleted',
      name: 'Document_Note',
      desc: '',
      args: [],
    );
  }

  /// `Upload your real profile picture to your profile`
  String get Upload_Profile_Picture {
    return Intl.message(
      'Upload your real profile picture to your profile',
      name: 'Upload_Profile_Picture',
      desc: '',
      args: [],
    );
  }

  /// `Passport`
  String get Passport {
    return Intl.message(
      'Passport',
      name: 'Passport',
      desc: '',
      args: [],
    );
  }

  /// `Identity`
  String get Identity {
    return Intl.message(
      'Identity',
      name: 'Identity',
      desc: '',
      args: [],
    );
  }

  /// `Accommodation`
  String get Accommodation {
    return Intl.message(
      'Accommodation',
      name: 'Accommodation',
      desc: '',
      args: [],
    );
  }

  /// `Driver's license`
  String get Drivers_License {
    return Intl.message(
      'Driver\'s license',
      name: 'Drivers_License',
      desc: '',
      args: [],
    );
  }

  /// `Shaping your personal image`
  String get Profile_Image_Shaping {
    return Intl.message(
      'Shaping your personal image',
      name: 'Profile_Image_Shaping',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}