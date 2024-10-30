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