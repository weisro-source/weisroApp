class ApiEndPoints {
  ApiEndPoints._();
  // "https://api.weisro.com/api/v0" this Base Url
  static const String clientRegisterEndPoint = '/auth/register';
  static const String loginEndPoint = '/auth/login';
  static const String verifyAccountEndPoint = '/auth/verify-otp';
  static const String resendOtpEndPoint = '/auth/resend-otp';
  static const String resetPasswordEndPoint = '/auth/reset-password';
  //get category by type end point
  /// add type for this [service,worker]
  static const String getCategoryByType = '/category?type=';
  static const String getServicesById = '/service/?category_id=';
  static const String getServiceById = '/service/';
  static const String addService = '/service';

  // user Rotes
  static const String getInfoEndPoint = '/user/info';

  // favorite Rotes
  static const String getFavorite = '/user-favorites';
  static const String addServiceToFavorite = '/user-favorites';
}
