class ApiEndPoints {
  ApiEndPoints._();
  // "https://api.weisro.com/api/v0" this Base Url
  static const String clientRegisterEndPoint = '/auth/register';
  static const String workerRegisterEndPoint = '/auth/register/worker';
  static const String loginEndPoint = '/auth/login';
  static const String verifyAccountEndPoint = '/auth/verify-otp';
  static const String resendOtpEndPoint = '/auth/resend-otp';
  static const String resetPasswordEndPoint = '/auth/reset-password';
  static const String countries = '/country';
  static const String cites =
      'https://countriesnow.space/api/v0.1/countries/cities';

  //get category by type end point
  /// add type for this [service,worker]
  static const String getCategoryByType = '/category?type=';
  static const String getLastService = '/service/?';
  static const String getServicesById = '/service/?category_id=';
  static const String getServiceById = '/service/';
  static const String addService = '/service';

  // user Rotes
  static const String getInfoEndPoint = '/user/info';

  // favorite Rotes
  static const String getFavorite = '/user-favorites';
  static const String addServiceToFavorite = '/user-favorites';
  // ads Route
  static const String addAds = '/advers';
  // booking Route
  static const String addServiceBooking = '/booking/service';
  static const String addWorkerBooking = '/worker-booking';
  static const String getUserBooking = '/booking/?type=user';
  static const String getYourBooking = '/booking/?type=user';
  // worker tags
  static const String getWorkerTags = '/category?type=workers&all=true';
}
