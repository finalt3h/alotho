class AppRoutes {
  const AppRoutes._();

  static const splashName = 'splash';
  static const splashPath = '/splash';

  static const loginName = 'login';
  static const loginPath = '/login';

  static const registerName = 'register';
  static const registerPath = '/register';

  static const verifyOtpName = 'verify-otp';
  static const verifyOtpPath = '/verify-otp';

  static const workersName = 'worker-search';
  static const workersPath = '/workers';

  static const workerDetailName = 'worker-detail';

  static const messagesName = 'messages';
  static const messagesPath = '/messages';

  static const myWorkName = 'my-work';
  static const myWorkPath = '/my-work';

  static const profileName = 'profile';
  static const profilePath = '/profile';

  static String workerDetailPath(String workerId) => '$workersPath/$workerId';

  static bool isAuthPath(String location) {
    return location == splashPath ||
        location == loginPath ||
        location == registerPath ||
        location == verifyOtpPath;
  }

  static bool isProtectedPath(String location) {
    return [
      workersPath,
      messagesPath,
      myWorkPath,
      profilePath,
    ].any(location.startsWith);
  }
}
