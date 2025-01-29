// Handles the entire transaction of signing in with Google and sending the token to the API.
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/google_auth/google_auth_api.dart';
import 'package:weisro/feature/auth/google_auth/google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());
  static GoogleAuthCubit get(context) => BlocProvider.of(context);
  Future<void> authenticateWithGoogleAndSendToApi() async {
    emit(GoogleAuthLoading()); // Indicate loading at the start
    // First step: Sign in with Google
    final googleSignInResult = await GoogleAuth.signInWithGoogle();

    // Handle the result of Google sign-in
    await googleSignInResult.fold(
      (failure) {
        // If Google sign-in fails, emit the failure state and return
        emit(GoogleAuthFailure(failure.errMassage));
      },
      (googleSignResult) async {
        // Split the name into first name and last name
        List<String> nameParts = googleSignResult.name.split(' ');
        String firstName = nameParts.isNotEmpty ? nameParts[0] : '';
        String lastName = nameParts.length > 1
            ? nameParts.sublist(1).join(' ') // Join the rest as last name
            : '';

        // Store first name and last name separately in cache
        // await CacheHelper.setData(key: CacheKeys.kFirstName, value: firstName);
        // await CacheHelper.setData(key: CacheKeys.kLastName, value: lastName);

        // Also store the email
        await CacheHelper.setData(
            key: CacheKeys.kUserEmail, value: googleSignResult.email);

        // Send the token to the API
        await _sendGoogleTokenToApi(googleSignResult.accessToken);
      },
    );
  }

  /// Handles signing out from Google.
  Future<void> signOut() async {
    emit(GoogleAuthLoading());

    final result = await GoogleAuth.signOutGoogle();

    result.fold(
      (failure) => emit(GoogleAuthFailure(failure.errMassage)),
      (_) => emit(GoogleAuthSignedOut()),
    );
  }

  Future<void> _sendGoogleTokenToApi(String accessToken) async {
    try {
      var response = await getIt.get<ApiService>().post(
          endPoint: ApiEndPoints.loginWithGoogleEndPoint,
          needToken: false,
          data: {"accessToken": accessToken});
      if (response['token'] != null && response['token'] is String) {
        CacheHelper.setData(key: CacheKeys.kToken, value: response['token']);
      }

      emit(GoogleAuthTransactionSuccess(response['data']));
    } catch (e) {
      log("Error sending token to API: $e");

      emit(GoogleAuthFailure(ErrorHandler.handleError(e).errMassage));
    }
  }
}
