import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  static LanguageCubit get(context) => BlocProvider.of(context);
  String? localLang = CacheHelper.getData(key: CacheKeys.kLanguage);
  void initLanguage() {
    if (localLang == null) {
      emit(EnglishLanguage());
    }
  }

  Future<void> changeLocalLang(context, {required String selectedLang}) async {
    if (selectedLang != localLang) {
      if (selectedLang == "en") {
        emit(EnglishLanguage());
      } else {
        emit(DeutschLanguage());
      }
      localLang = selectedLang;
      await CacheHelper.setData(key: CacheKeys.kLanguage, value: selectedLang);
    }
  }
}
