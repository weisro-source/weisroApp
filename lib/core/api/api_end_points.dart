class ApiEndPoints {
  ApiEndPoints._();
  // "https://api.weisro.com/api/v0" this Base Url
  static const String clientRegisterEndPoint = '/auth/register';
  static const String loginEndPoint = '/auth/login';
  static const String verifyAccountEndPoint = '/auth/verify-otp';
  static const String resendOtpEndPoint = '/auth/resend-otp';
  static const String resetPasswordEndPoint = '/auth/reset-password';
}
