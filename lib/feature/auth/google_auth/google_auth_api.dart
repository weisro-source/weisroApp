import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weisro/core/api/api_error_handler.dart';

class GoogleSignInResult {
  final String accessToken;
  final String name;
  final String email;

  GoogleSignInResult({
    required this.accessToken,
    required this.name,
    required this.email,
  });
}

class GoogleAuth {
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  static Future<Either<Failure, GoogleSignInResult>> signInWithGoogle() async {
    try {
      log("signInWithGoogle");

      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        log("Sign in canceled by user");
        return left(ErrorHandler.handleError("Sign in canceled by user"));
      }

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final accessToken = googleSignInAuthentication.accessToken;
      if (accessToken == null) {
        log('Failed to retrieve access token');
        return left(
            ErrorHandler.handleError("Failed to retrieve access token"));
      }

      // Fetch user's name and email
      final name = googleSignInAccount.displayName ?? 'Unknown';
      final email = googleSignInAccount.email;

      log("Access Token: $accessToken", level: 2);
      log("User Name: $name", level: 2);
      log("User Email: $email", level: 2);

      // Return the access token, name, and email
      return right(GoogleSignInResult(
        accessToken: accessToken,
        name: name,
        email: email,
      ));
    } catch (e) {
      log("Error in Google auth: $e");
      return left(ErrorHandler.handleError(
          "Error during Google Sign In: ${e.toString()}"));
    }
  }

  /// Sign out from Google
  static Future<Either<Failure, Unit>> signOutGoogle() async {
    try {
      await googleSignIn.signOut();
      return right(unit);
    } catch (e) {
      log("Error in Google sign-out: $e");
      return left(ErrorHandler.handleError(
          "Error during Google Sign Out: ${e.toString()}"));
    }
  }
}
