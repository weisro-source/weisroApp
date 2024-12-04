import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/ads/data/ads_repo/ads_repo.dart';

part 'add_ads_state.dart';

class AddAdsCubit extends Cubit<AddAdsState> {
  AddAdsCubit() : super(AddAdsInitial());

  /// Creates FormData for API requests with text and image.
  ///
  /// - [text]: The text input for the form.
  /// - [imageFile]: The image file to be uploaded (optional).
  ///
  /// Returns: FormData object containing the text and image.
  Future<FormData> createFormData(String text, File? imageFile) async {
    // Map to hold the form fields
    final Map<String, dynamic> formFields = {
      'text': text,
    };

    // Add the image file if it exists
    if (imageFile != null) {
      formFields['image'] = await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last, // Extract filename
      );
    }

    // Return the FormData object
    return FormData.fromMap(formFields);
  }

  Future<void> addAd(String text, File? imageFile, CancelToken? cancel) async {
    FormData data = await createFormData(text, imageFile);

    emit(AddAdsLoading());
    var result = await getIt.get<AdsRepository>().addAds(data, cancel);
    result.fold(
      (errorInAddAds) {
        emit(AddAdsFailures(error: errorInAddAds));
      },
      (addAddsSuccess) {
        emit(AddAdsSuccess());
      },
    );
  }
}
