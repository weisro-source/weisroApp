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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
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

  /// `Take Photo`
  String get Take_Photo {
    return Intl.message(
      'Take Photo',
      name: 'Take_Photo',
      desc: '',
      args: [],
    );
  }

  /// `Pick from Gallery`
  String get Pick_From_Gallery {
    return Intl.message(
      'Pick from Gallery',
      name: 'Pick_From_Gallery',
      desc: '',
      args: [],
    );
  }

  /// `Favorite page`
  String get Favorite_page {
    return Intl.message(
      'Favorite page',
      name: 'Favorite_page',
      desc: '',
      args: [],
    );
  }

  /// `NO Favorite Yet`
  String get NO_Favorite_Yet {
    return Intl.message(
      'NO Favorite Yet',
      name: 'NO_Favorite_Yet',
      desc: '',
      args: [],
    );
  }

  /// `You haven't marked any favorite`
  String get You_havent_marked_any_favorite {
    return Intl.message(
      'You haven\'t marked any favorite',
      name: 'You_havent_marked_any_favorite',
      desc: '',
      args: [],
    );
  }

  /// `Search page`
  String get Search_page {
    return Intl.message(
      'Search page',
      name: 'Search_page',
      desc: '',
      args: [],
    );
  }

  /// `The search page is empty, go and explore what's new`
  String get Search_page_empty_message {
    return Intl.message(
      'The search page is empty, go and explore what\'s new',
      name: 'Search_page_empty_message',
      desc: '',
      args: [],
    );
  }

  /// `Search is empty`
  String get Search_empty {
    return Intl.message(
      'Search is empty',
      name: 'Search_empty',
      desc: '',
      args: [],
    );
  }

  /// `NO Result Found`
  String get No_result_found {
    return Intl.message(
      'NO Result Found',
      name: 'No_result_found',
      desc: '',
      args: [],
    );
  }

  /// `Check what you are looking for again, please`
  String get Check_search_again {
    return Intl.message(
      'Check what you are looking for again, please',
      name: 'Check_search_again',
      desc: '',
      args: [],
    );
  }

  /// `NO Location Found`
  String get No_location_found {
    return Intl.message(
      'NO Location Found',
      name: 'No_location_found',
      desc: '',
      args: [],
    );
  }

  /// `Please check for location permission`
  String get Check_location_permission {
    return Intl.message(
      'Please check for location permission',
      name: 'Check_location_permission',
      desc: '',
      args: [],
    );
  }

  /// `Latest rental services`
  String get Latest_rental_services {
    return Intl.message(
      'Latest rental services',
      name: 'Latest_rental_services',
      desc: '',
      args: [],
    );
  }

  /// `Our Categories`
  String get Our_Categories {
    return Intl.message(
      'Our Categories',
      name: 'Our_Categories',
      desc: '',
      args: [],
    );
  }

  /// `Rental Workers`
  String get Rental_Workers {
    return Intl.message(
      'Rental Workers',
      name: 'Rental_Workers',
      desc: '',
      args: [],
    );
  }

  /// `Rental services`
  String get Rental_Services {
    return Intl.message(
      'Rental services',
      name: 'Rental_Services',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get Favorites {
    return Intl.message(
      'Favorite',
      name: 'Favorites',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get Orders {
    return Intl.message(
      'Orders',
      name: 'Orders',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `services Details`
  String get Services_Details {
    return Intl.message(
      'services Details',
      name: 'Services_Details',
      desc: '',
      args: [],
    );
  }

  /// `Available rental hours`
  String get Available_Rental_Hours {
    return Intl.message(
      'Available rental hours',
      name: 'Available_Rental_Hours',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get To {
    return Intl.message(
      'To',
      name: 'To',
      desc: '',
      args: [],
    );
  }

  /// `Available rental days`
  String get Available_Rental_Days {
    return Intl.message(
      'Available rental days',
      name: 'Available_Rental_Days',
      desc: '',
      args: [],
    );
  }

  /// `Description and terms of Service rental`
  String get Description_Service {
    return Intl.message(
      'Description and terms of Service rental',
      name: 'Description_Service',
      desc: '',
      args: [],
    );
  }

  /// `Publish`
  String get Publish {
    return Intl.message(
      'Publish',
      name: 'Publish',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Search Page`
  String get Search_Page {
    return Intl.message(
      'Search Page',
      name: 'Search_Page',
      desc: '',
      args: [],
    );
  }

  /// `Recent search`
  String get Recent_search {
    return Intl.message(
      'Recent search',
      name: 'Recent_search',
      desc: '',
      args: [],
    );
  }

  /// `Recommended near you`
  String get Recommended_Near_You {
    return Intl.message(
      'Recommended near you',
      name: 'Recommended_Near_You',
      desc: '',
      args: [],
    );
  }

  /// `Result Found`
  String get Result_Found {
    return Intl.message(
      'Result Found',
      name: 'Result_Found',
      desc: '',
      args: [],
    );
  }

  /// `Search In`
  String get Search_In {
    return Intl.message(
      'Search In',
      name: 'Search_In',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get All {
    return Intl.message(
      'All',
      name: 'All',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get Complete {
    return Intl.message(
      'Complete',
      name: 'Complete',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get Reject {
    return Intl.message(
      'Reject',
      name: 'Reject',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get Pending {
    return Intl.message(
      'Pending',
      name: 'Pending',
      desc: '',
      args: [],
    );
  }

  /// `Filtering by`
  String get Filtering_By {
    return Intl.message(
      'Filtering by',
      name: 'Filtering_By',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message(
      'Location',
      name: 'Location',
      desc: '',
      args: [],
    );
  }

  /// `price`
  String get Price {
    return Intl.message(
      'price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `rate`
  String get Rate {
    return Intl.message(
      'rate',
      name: 'Rate',
      desc: '',
      args: [],
    );
  }

  /// `date`
  String get date {
    return Intl.message(
      'date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Type Services`
  String get Type_Services {
    return Intl.message(
      'Type Services',
      name: 'Type_Services',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get Book_Now {
    return Intl.message(
      'Book Now',
      name: 'Book_Now',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get Personal_Information {
    return Intl.message(
      'Personal Information',
      name: 'Personal_Information',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get Full_Name {
    return Intl.message(
      'Full Name',
      name: 'Full_Name',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Postal Code' key

  /// `Log Out`
  String get LogOut {
    return Intl.message(
      'Log Out',
      name: 'LogOut',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get PrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'PrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Condition`
  String get TermsCondition {
    return Intl.message(
      'Terms & Condition',
      name: 'TermsCondition',
      desc: '',
      args: [],
    );
  }

  /// `Your Posts`
  String get YourPosts {
    return Intl.message(
      'Your Posts',
      name: 'YourPosts',
      desc: '',
      args: [],
    );
  }

  /// `Your Order`
  String get YourOrder {
    return Intl.message(
      'Your Order',
      name: 'YourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Your Favorite`
  String get YourFavorite {
    return Intl.message(
      'Your Favorite',
      name: 'YourFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get ChangeEmail {
    return Intl.message(
      'Change Email',
      name: 'ChangeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change mobile number`
  String get ChangeMobileNumber {
    return Intl.message(
      'Change mobile number',
      name: 'ChangeMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Edit Personal Information`
  String get EditPersonalInformation {
    return Intl.message(
      'Edit Personal Information',
      name: 'EditPersonalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Profile Option`
  String get ProfileOption {
    return Intl.message(
      'Profile Option',
      name: 'ProfileOption',
      desc: '',
      args: [],
    );
  }

  /// `Worker Details`
  String get Worker_Details {
    return Intl.message(
      'Worker Details',
      name: 'Worker_Details',
      desc: '',
      args: [],
    );
  }

  /// `Description :`
  String get Description {
    return Intl.message(
      'Description :',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Services provided :`
  String get Services_provided {
    return Intl.message(
      'Services provided :',
      name: 'Services_provided',
      desc: '',
      args: [],
    );
  }

  /// `Book Worker`
  String get Book_Worker {
    return Intl.message(
      'Book Worker',
      name: 'Book_Worker',
      desc: '',
      args: [],
    );
  }

  /// `Create a product`
  String get Create_A_Product {
    return Intl.message(
      'Create a product',
      name: 'Create_A_Product',
      desc: '',
      args: [],
    );
  }

  /// `Create an ad`
  String get Create_An_Ad {
    return Intl.message(
      'Create an ad',
      name: 'Create_An_Ad',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get Ok {
    return Intl.message(
      'Ok',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `How do you want to rent your services ? `
  String get How_Do_You_Want_Your_Services {
    return Intl.message(
      'How do you want to rent your services ? ',
      name: 'How_Do_You_Want_Your_Services',
      desc: '',
      args: [],
    );
  }

  /// `Both`
  String get Both {
    return Intl.message(
      'Both',
      name: 'Both',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get Hours {
    return Intl.message(
      'Hours',
      name: 'Hours',
      desc: '',
      args: [],
    );
  }

  /// `Daily`
  String get Daily {
    return Intl.message(
      'Daily',
      name: 'Daily',
      desc: '',
      args: [],
    );
  }

  /// `Rent per hour`
  String get Rent_per_hour {
    return Intl.message(
      'Rent per hour',
      name: 'Rent_per_hour',
      desc: '',
      args: [],
    );
  }

  /// `Rent per day`
  String get Rent_per_day {
    return Intl.message(
      'Rent per day',
      name: 'Rent_per_day',
      desc: '',
      args: [],
    );
  }

  /// `Write a description of the service and the terms of renting your services ?`
  String get Write_Description_Service {
    return Intl.message(
      'Write a description of the service and the terms of renting your services ?',
      name: 'Write_Description_Service',
      desc: '',
      args: [],
    );
  }

  /// `Conformation`
  String get Conformation {
    return Intl.message(
      'Conformation',
      name: 'Conformation',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to work for hours or days`
  String get Work_for_hours_or_days {
    return Intl.message(
      'Do you want to work for hours or days',
      name: 'Work_for_hours_or_days',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get Days {
    return Intl.message(
      'Days',
      name: 'Days',
      desc: '',
      args: [],
    );
  }

  /// `What details of the service do you want from the worker?`
  String get Service_Details_Request {
    return Intl.message(
      'What details of the service do you want from the worker?',
      name: 'Service_Details_Request',
      desc: '',
      args: [],
    );
  }

  /// `It is forbidden to write addresses and contact information. Violating accounts are blocked.`
  String get Forbidden_Write_Addresses {
    return Intl.message(
      'It is forbidden to write addresses and contact information. Violating accounts are blocked.',
      name: 'Forbidden_Write_Addresses',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get Payment_Method {
    return Intl.message(
      'Payment method',
      name: 'Payment_Method',
      desc: '',
      args: [],
    );
  }

  /// `The total cost`
  String get Total_Cost {
    return Intl.message(
      'The total cost',
      name: 'Total_Cost',
      desc: '',
      args: [],
    );
  }

  /// `Rental period`
  String get Rental_Period {
    return Intl.message(
      'Rental period',
      name: 'Rental_Period',
      desc: '',
      args: [],
    );
  }

  /// `Rental history`
  String get Rental_History {
    return Intl.message(
      'Rental history',
      name: 'Rental_History',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid daily price.`
  String get daily_price_invalid {
    return Intl.message(
      'Please enter a valid daily price.',
      name: 'daily_price_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid hourly price.`
  String get hourly_price_invalid {
    return Intl.message(
      'Please enter a valid hourly price.',
      name: 'hourly_price_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Please provide a description.`
  String get description_missing {
    return Intl.message(
      'Please provide a description.',
      name: 'description_missing',
      desc: '',
      args: [],
    );
  }

  /// `Please provide a service name.`
  String get service_name_missing {
    return Intl.message(
      'Please provide a service name.',
      name: 'service_name_missing',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least one day.`
  String get days_missing {
    return Intl.message(
      'Please select at least one day.',
      name: 'days_missing',
      desc: '',
      args: [],
    );
  }

  /// `Please upload at least one image.`
  String get images_missing {
    return Intl.message(
      'Please upload at least one image.',
      name: 'images_missing',
      desc: '',
      args: [],
    );
  }

  /// `Service Name`
  String get Service_Name {
    return Intl.message(
      'Service Name',
      name: 'Service_Name',
      desc: '',
      args: [],
    );
  }

  /// `Selected Location`
  String get selected_location {
    return Intl.message(
      'Selected Location',
      name: 'selected_location',
      desc: '',
      args: [],
    );
  }

  /// `Publish`
  String get publish {
    return Intl.message(
      'Publish',
      name: 'publish',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait, Your Service is Being Published`
  String get please_wait_publishing {
    return Intl.message(
      'Please Wait, Your Service is Being Published',
      name: 'please_wait_publishing',
      desc: '',
      args: [],
    );
  }

  /// `Change your phone number`
  String get change_phone_number {
    return Intl.message(
      'Change your phone number',
      name: 'change_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Change your email address`
  String get change_email_address {
    return Intl.message(
      'Change your email address',
      name: 'change_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Change your password`
  String get change_password {
    return Intl.message(
      'Change your password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Add Text here`
  String get add_text_here {
    return Intl.message(
      'Add Text here',
      name: 'add_text_here',
      desc: '',
      args: [],
    );
  }

  /// `Create the ad you want ?`
  String get create_ad_you_want {
    return Intl.message(
      'Create the ad you want ?',
      name: 'create_ad_you_want',
      desc: '',
      args: [],
    );
  }

  /// `Send and wait`
  String get Send_And_Wait {
    return Intl.message(
      'Send and wait',
      name: 'Send_And_Wait',
      desc: '',
      args: [],
    );
  }

  /// `Book service`
  String get Book_Service {
    return Intl.message(
      'Book service',
      name: 'Book_Service',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get End {
    return Intl.message(
      'End',
      name: 'End',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get Start {
    return Intl.message(
      'Start',
      name: 'Start',
      desc: '',
      args: [],
    );
  }

  /// `Select location`
  String get Select_Location {
    return Intl.message(
      'Select location',
      name: 'Select_Location',
      desc: '',
      args: [],
    );
  }

  /// `Please complete the information`
  String get Complete_Information {
    return Intl.message(
      'Please complete the information',
      name: 'Complete_Information',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get Dont_Have_Account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'Dont_Have_Account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get Sign_Up {
    return Intl.message(
      'Sign up',
      name: 'Sign_Up',
      desc: '',
      args: [],
    );
  }

  /// `Ad Deleted!`
  String get Ad_Deleted {
    return Intl.message(
      'Ad Deleted!',
      name: 'Ad_Deleted',
      desc: '',
      args: [],
    );
  }

  /// `The ad has been successfully deleted.`
  String get Ad_Deleted_Success {
    return Intl.message(
      'The ad has been successfully deleted.',
      name: 'Ad_Deleted_Success',
      desc: '',
      args: [],
    );
  }

  /// `Deletion Failed!`
  String get Ad_Deletion_Failed {
    return Intl.message(
      'Deletion Failed!',
      name: 'Ad_Deletion_Failed',
      desc: '',
      args: [],
    );
  }

  /// `Could not delete the ad.`
  String get Ad_Deletion_Error {
    return Intl.message(
      'Could not delete the ad.',
      name: 'Ad_Deletion_Error',
      desc: '',
      args: [],
    );
  }

  /// `Delete Confirmation`
  String get Delete_Confirmation_Title {
    return Intl.message(
      'Delete Confirmation',
      name: 'Delete_Confirmation_Title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this ad?`
  String get Delete_Confirmation_Message {
    return Intl.message(
      'Are you sure you want to delete this ad?',
      name: 'Delete_Confirmation_Message',
      desc: '',
      args: [],
    );
  }

  /// `There are no services available in this area`
  String get No_Services_Available {
    return Intl.message(
      'There are no services available in this area',
      name: 'No_Services_Available',
      desc: '',
      args: [],
    );
  }

  /// `There are no services available in Category`
  String get No_Services_Available_Cat {
    return Intl.message(
      'There are no services available in Category',
      name: 'No_Services_Available_Cat',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least one day`
  String get Select_At_Least_One_Day {
    return Intl.message(
      'Please select at least one day',
      name: 'Select_At_Least_One_Day',
      desc: '',
      args: [],
    );
  }

  /// `Incomplete Information`
  String get Incomplete_Information {
    return Intl.message(
      'Incomplete Information',
      name: 'Incomplete_Information',
      desc: '',
      args: [],
    );
  }

  /// `Booking Failed`
  String get Booking_Failed {
    return Intl.message(
      'Booking Failed',
      name: 'Booking_Failed',
      desc: '',
      args: [],
    );
  }

  /// `Booking Successful`
  String get Booking_Successful {
    return Intl.message(
      'Booking Successful',
      name: 'Booking_Successful',
      desc: '',
      args: [],
    );
  }

  /// `Your booking has been confirmed. Thank you!`
  String get Booking_Confirmed {
    return Intl.message(
      'Your booking has been confirmed. Thank you!',
      name: 'Booking_Confirmed',
      desc: '',
      args: [],
    );
  }

  /// `cash`
  String get cash {
    return Intl.message(
      'cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get Change_Email {
    return Intl.message(
      'Change Email',
      name: 'Change_Email',
      desc: '',
      args: [],
    );
  }

  /// `Update Successful`
  String get Update_Successful {
    return Intl.message(
      'Update Successful',
      name: 'Update_Successful',
      desc: '',
      args: [],
    );
  }

  /// `Your information has been updated successfully.`
  String get Information_Updated_Successfully {
    return Intl.message(
      'Your information has been updated successfully.',
      name: 'Information_Updated_Successfully',
      desc: '',
      args: [],
    );
  }

  /// `Update Failed`
  String get Update_Failed {
    return Intl.message(
      'Update Failed',
      name: 'Update_Failed',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while updating your information. Please try again.`
  String get Error_Updating_Information {
    return Intl.message(
      'An error occurred while updating your information. Please try again.',
      name: 'Error_Updating_Information',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get Old_Password {
    return Intl.message(
      'Old Password',
      name: 'Old_Password',
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
