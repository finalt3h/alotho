class AppConstants {
  AppConstants._();

  static const String appName = 'Alo Tho';
  static const String authCallbackScheme = 'com.itsonnm.alotho';
  static const String authCallbackHost = 'login-callback';
  static const String googleAuthRedirectUrl =
      '$authCallbackScheme://$authCallbackHost';
  static const Duration splashDuration = Duration(milliseconds: 1400);
  static const int minimumPhoneLength = 9;
  static const int minimumPasswordLength = 6;
}
