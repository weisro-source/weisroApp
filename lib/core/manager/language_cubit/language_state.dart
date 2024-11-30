part of 'language_cubit.dart';

@immutable
sealed class LanguageState {}

final class LanguageInitial extends LanguageState {}

final class EnglishLanguage extends LanguageState {}

final class DeutschLanguage extends LanguageState {}
