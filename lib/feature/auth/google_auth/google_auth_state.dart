abstract class GoogleAuthState {}

class GoogleAuthInitial extends GoogleAuthState {}

class GoogleAuthLoading extends GoogleAuthState {}

class GoogleAuthTransactionSuccess extends GoogleAuthState {
  final String apiResponse;
  GoogleAuthTransactionSuccess(this.apiResponse);
}

class GoogleAuthFailure extends GoogleAuthState {
  final String error;
  GoogleAuthFailure(this.error);
}

class GoogleAuthSignedOut extends GoogleAuthState {}
