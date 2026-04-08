import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'generated_app_localizations_en.dart';
import 'generated_app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/generated_app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In vi, this message translates to:
  /// **'Alo Tho'**
  String get appTitle;

  /// No description provided for @appWordmark.
  ///
  /// In vi, this message translates to:
  /// **'ALO THỢ'**
  String get appWordmark;

  /// No description provided for @splashTagline.
  ///
  /// In vi, this message translates to:
  /// **'Kết nối thợ nhanh chóng'**
  String get splashTagline;

  /// No description provided for @splashLoadingLabel.
  ///
  /// In vi, this message translates to:
  /// **'Đang khởi động...'**
  String get splashLoadingLabel;

  /// No description provided for @splashFooterLabel.
  ///
  /// In vi, this message translates to:
  /// **'Premium Service Marketplace'**
  String get splashFooterLabel;

  /// No description provided for @dialogTitleSuccess.
  ///
  /// In vi, this message translates to:
  /// **'Thành công'**
  String get dialogTitleSuccess;

  /// No description provided for @dialogTitleError.
  ///
  /// In vi, this message translates to:
  /// **'Lỗi'**
  String get dialogTitleError;

  /// No description provided for @dialogTitleConfirm.
  ///
  /// In vi, this message translates to:
  /// **'Xác nhận'**
  String get dialogTitleConfirm;

  /// No description provided for @dialogTitleNotice.
  ///
  /// In vi, this message translates to:
  /// **'Thông báo'**
  String get dialogTitleNotice;

  /// No description provided for @dialogPreviewTitle.
  ///
  /// In vi, this message translates to:
  /// **'Xác nhận thao tác'**
  String get dialogPreviewTitle;

  /// No description provided for @dialogPreviewMessage.
  ///
  /// In vi, this message translates to:
  /// **'Bạn có chắc muốn tiếp tục hành động này không?'**
  String get dialogPreviewMessage;

  /// No description provided for @loginTitle.
  ///
  /// In vi, this message translates to:
  /// **'Chào mừng trở lại'**
  String get loginTitle;

  /// No description provided for @loginDescription.
  ///
  /// In vi, this message translates to:
  /// **'Kết nối với những thợ giỏi nhất'**
  String get loginDescription;

  /// No description provided for @loginIdentifierLabel.
  ///
  /// In vi, this message translates to:
  /// **'Số điện thoại hoặc email'**
  String get loginIdentifierLabel;

  /// No description provided for @loginIdentifierHint.
  ///
  /// In vi, this message translates to:
  /// **'Nhập thông tin của bạn'**
  String get loginIdentifierHint;

  /// No description provided for @passwordLabel.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In vi, this message translates to:
  /// **'••••••••'**
  String get passwordHint;

  /// No description provided for @processing.
  ///
  /// In vi, this message translates to:
  /// **'Đang xử lý...'**
  String get processing;

  /// No description provided for @signInWithCredentials.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập'**
  String get signInWithCredentials;

  /// No description provided for @orLabel.
  ///
  /// In vi, this message translates to:
  /// **'Hoặc đăng nhập qua'**
  String get orLabel;

  /// No description provided for @signInWithGoogle.
  ///
  /// In vi, this message translates to:
  /// **'Google'**
  String get signInWithGoogle;

  /// No description provided for @continueWithFacebook.
  ///
  /// In vi, this message translates to:
  /// **'Facebook'**
  String get continueWithFacebook;

  /// No description provided for @forgotPassword.
  ///
  /// In vi, this message translates to:
  /// **'Quên mật khẩu?'**
  String get forgotPassword;

  /// No description provided for @forgotPasswordPlaceholder.
  ///
  /// In vi, this message translates to:
  /// **'Tạm thời đây là nút placeholder cho flow quên mật khẩu.'**
  String get forgotPasswordPlaceholder;

  /// No description provided for @authActionPlaceholder.
  ///
  /// In vi, this message translates to:
  /// **'Tính năng này sẽ được nối backend ở bước sau.'**
  String get authActionPlaceholder;

  /// No description provided for @noAccountPrompt.
  ///
  /// In vi, this message translates to:
  /// **'Bạn chưa có tài khoản?'**
  String get noAccountPrompt;

  /// No description provided for @registerNow.
  ///
  /// In vi, this message translates to:
  /// **'Đăng ký ngay'**
  String get registerNow;

  /// No description provided for @loginHelpTooltip.
  ///
  /// In vi, this message translates to:
  /// **'Trợ giúp'**
  String get loginHelpTooltip;

  /// No description provided for @registerTitle.
  ///
  /// In vi, this message translates to:
  /// **'Tạo tài khoản mới'**
  String get registerTitle;

  /// No description provided for @registerDescription.
  ///
  /// In vi, this message translates to:
  /// **'Gia nhập cộng đồng thợ tay nghề cao hoặc tìm kiếm dịch vụ chất lượng ngay.'**
  String get registerDescription;

  /// No description provided for @registerRoleLabel.
  ///
  /// In vi, this message translates to:
  /// **'Bạn là ai?'**
  String get registerRoleLabel;

  /// No description provided for @registerRoleDescription.
  ///
  /// In vi, this message translates to:
  /// **'Chọn vai trò để Alo Thợ cá nhân hóa trải nghiệm đăng ký cho bạn.'**
  String get registerRoleDescription;

  /// No description provided for @registerRoleCustomerTitle.
  ///
  /// In vi, this message translates to:
  /// **'Khách hàng'**
  String get registerRoleCustomerTitle;

  /// No description provided for @registerRoleCustomerDescription.
  ///
  /// In vi, this message translates to:
  /// **'Tìm thợ uy tín gần bạn để xử lý việc sửa chữa nhanh hơn.'**
  String get registerRoleCustomerDescription;

  /// No description provided for @registerRoleCustomerBadge.
  ///
  /// In vi, this message translates to:
  /// **'Đặt dịch vụ'**
  String get registerRoleCustomerBadge;

  /// No description provided for @registerRoleWorkerTitle.
  ///
  /// In vi, this message translates to:
  /// **'Thợ'**
  String get registerRoleWorkerTitle;

  /// No description provided for @registerRoleWorkerDescription.
  ///
  /// In vi, this message translates to:
  /// **'Nhận yêu cầu mới, xây dựng uy tín và phát triển công việc của bạn.'**
  String get registerRoleWorkerDescription;

  /// No description provided for @registerRoleWorkerBadge.
  ///
  /// In vi, this message translates to:
  /// **'Nhận việc'**
  String get registerRoleWorkerBadge;

  /// No description provided for @verifyOtpTitle.
  ///
  /// In vi, this message translates to:
  /// **'Xác thực OTP'**
  String get verifyOtpTitle;

  /// No description provided for @verifyOtpHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Kích hoạt tài khoản'**
  String get verifyOtpHeadline;

  /// No description provided for @verifyOtpDescriptionEmail.
  ///
  /// In vi, this message translates to:
  /// **'Nhập mã OTP đã được gửi tới email của bạn để hoàn tất kích hoạt tài khoản.'**
  String get verifyOtpDescriptionEmail;

  /// No description provided for @verifyOtpDescriptionPhone.
  ///
  /// In vi, this message translates to:
  /// **'Nhập mã OTP đã được gửi tới số điện thoại của bạn để hoàn tất kích hoạt tài khoản.'**
  String get verifyOtpDescriptionPhone;

  /// No description provided for @otpLabel.
  ///
  /// In vi, this message translates to:
  /// **'Mã OTP'**
  String get otpLabel;

  /// No description provided for @otpHint.
  ///
  /// In vi, this message translates to:
  /// **'Nhập mã gồm 6 số'**
  String get otpHint;

  /// No description provided for @verifyOtpButton.
  ///
  /// In vi, this message translates to:
  /// **'Xác thực OTP'**
  String get verifyOtpButton;

  /// No description provided for @resendOtpButton.
  ///
  /// In vi, this message translates to:
  /// **'Gửi lại mã'**
  String get resendOtpButton;

  /// No description provided for @registerEmailLabel.
  ///
  /// In vi, this message translates to:
  /// **'Email'**
  String get registerEmailLabel;

  /// No description provided for @registerEmailHint.
  ///
  /// In vi, this message translates to:
  /// **'example@gmail.com'**
  String get registerEmailHint;

  /// No description provided for @registerPhoneLabel.
  ///
  /// In vi, this message translates to:
  /// **'Số điện thoại'**
  String get registerPhoneLabel;

  /// No description provided for @registerPhoneHint.
  ///
  /// In vi, this message translates to:
  /// **'090 123 4567'**
  String get registerPhoneHint;

  /// No description provided for @registerFullNameLabel.
  ///
  /// In vi, this message translates to:
  /// **'Họ và tên'**
  String get registerFullNameLabel;

  /// No description provided for @registerFullNameHint.
  ///
  /// In vi, this message translates to:
  /// **'Nguyễn Văn A'**
  String get registerFullNameHint;

  /// No description provided for @registerConfirmPasswordLabel.
  ///
  /// In vi, this message translates to:
  /// **'Nhập lại mật khẩu'**
  String get registerConfirmPasswordLabel;

  /// No description provided for @registerConfirmPasswordHint.
  ///
  /// In vi, this message translates to:
  /// **'••••••••'**
  String get registerConfirmPasswordHint;

  /// No description provided for @createAccount.
  ///
  /// In vi, this message translates to:
  /// **'Đăng ký'**
  String get createAccount;

  /// No description provided for @registerAgreementPrefix.
  ///
  /// In vi, this message translates to:
  /// **'Bằng cách nhấn Đăng ký, bạn đồng ý với '**
  String get registerAgreementPrefix;

  /// No description provided for @registerAgreementHighlight.
  ///
  /// In vi, this message translates to:
  /// **'Điều khoản & Chính sách bảo mật'**
  String get registerAgreementHighlight;

  /// No description provided for @registerAgreementSuffix.
  ///
  /// In vi, this message translates to:
  /// **' của Alo Thợ.'**
  String get registerAgreementSuffix;

  /// No description provided for @registerExistingAccountPrompt.
  ///
  /// In vi, this message translates to:
  /// **'Đã có tài khoản?'**
  String get registerExistingAccountPrompt;

  /// No description provided for @registerBackToLoginCta.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập ngay'**
  String get registerBackToLoginCta;

  /// No description provided for @alreadyHaveAccountPrompt.
  ///
  /// In vi, this message translates to:
  /// **'Bạn đã có tài khoản?'**
  String get alreadyHaveAccountPrompt;

  /// No description provided for @backToLogin.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập'**
  String get backToLogin;

  /// No description provided for @registerPlaceholder.
  ///
  /// In vi, this message translates to:
  /// **'Đây là placeholder UI cho quy trình đăng ký.'**
  String get registerPlaceholder;

  /// No description provided for @loginBenefitTitle.
  ///
  /// In vi, this message translates to:
  /// **'Bạn xem được gì sau khi đăng nhập?'**
  String get loginBenefitTitle;

  /// No description provided for @loginBenefitDescription.
  ///
  /// In vi, this message translates to:
  /// **'Tìm thợ theo nghề và khu vực, xem hội thoại gần đây, quản lý bài đăng về công việc của bạn và cập nhật hồ sơ thợ.'**
  String get loginBenefitDescription;

  /// No description provided for @registerSuccessSignedIn.
  ///
  /// In vi, this message translates to:
  /// **'Tạo tài khoản thành công.'**
  String get registerSuccessSignedIn;

  /// No description provided for @registerSuccessVerifyEmail.
  ///
  /// In vi, this message translates to:
  /// **'Tài khoản đã được tạo. Vui lòng kiểm tra email để xác minh trước khi đăng nhập.'**
  String get registerSuccessVerifyEmail;

  /// No description provided for @registerSuccessVerifyPhone.
  ///
  /// In vi, this message translates to:
  /// **'Tài khoản đã được tạo. Vui lòng kiểm tra tin nhắn để xác minh trước khi đăng nhập.'**
  String get registerSuccessVerifyPhone;

  /// No description provided for @invalidLoginIdentifier.
  ///
  /// In vi, this message translates to:
  /// **'Số điện thoại hoặc email chưa hợp lệ.'**
  String get invalidLoginIdentifier;

  /// No description provided for @invalidRegisterEmail.
  ///
  /// In vi, this message translates to:
  /// **'Email chưa hợp lệ.'**
  String get invalidRegisterEmail;

  /// No description provided for @invalidRegisterPhone.
  ///
  /// In vi, this message translates to:
  /// **'Số điện thoại chưa hợp lệ.'**
  String get invalidRegisterPhone;

  /// No description provided for @invalidFullName.
  ///
  /// In vi, this message translates to:
  /// **'Họ tên chưa hợp lệ.'**
  String get invalidFullName;

  /// No description provided for @invalidPassword.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu chưa hợp lệ.'**
  String get invalidPassword;

  /// No description provided for @confirmPasswordMismatch.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu xác nhận không khớp.'**
  String get confirmPasswordMismatch;

  /// No description provided for @activationOtpRequired.
  ///
  /// In vi, this message translates to:
  /// **'Tài khoản chưa kích hoạt. Vui lòng nhập OTP để kích hoạt.'**
  String get activationOtpRequired;

  /// No description provided for @invalidOtp.
  ///
  /// In vi, this message translates to:
  /// **'Mã OTP đã hết hạn hoặc không hợp lệ.'**
  String get invalidOtp;

  /// No description provided for @failureSignOut.
  ///
  /// In vi, this message translates to:
  /// **'Không thể đăng xuất lúc này.'**
  String get failureSignOut;

  /// No description provided for @failureOtpVerification.
  ///
  /// In vi, this message translates to:
  /// **'Xác thực OTP không thành công.'**
  String get failureOtpVerification;

  /// No description provided for @failureResendOtp.
  ///
  /// In vi, this message translates to:
  /// **'Không thể gửi lại mã OTP lúc này.'**
  String get failureResendOtp;

  /// No description provided for @resendOtpSuccess.
  ///
  /// In vi, this message translates to:
  /// **'Đã gửi lại mã OTP.'**
  String get resendOtpSuccess;

  /// No description provided for @failureRegisterUnavailable.
  ///
  /// In vi, this message translates to:
  /// **'Không thể tạo tài khoản lúc này.'**
  String get failureRegisterUnavailable;

  /// No description provided for @failureAccountAlreadyExists.
  ///
  /// In vi, this message translates to:
  /// **'Tài khoản đã tồn tại.'**
  String get failureAccountAlreadyExists;

  /// No description provided for @workerSearchNav.
  ///
  /// In vi, this message translates to:
  /// **'Tìm thợ'**
  String get workerSearchNav;

  /// No description provided for @messagesNav.
  ///
  /// In vi, this message translates to:
  /// **'Tin nhắn'**
  String get messagesNav;

  /// No description provided for @myWorkNav.
  ///
  /// In vi, this message translates to:
  /// **'Công việc'**
  String get myWorkNav;

  /// No description provided for @profileNav.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ'**
  String get profileNav;

  /// No description provided for @workerSearchAppBar.
  ///
  /// In vi, this message translates to:
  /// **'Tìm thợ gần đây'**
  String get workerSearchAppBar;

  /// No description provided for @workerSearchHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Bạn cần sửa gì hôm nay?'**
  String get workerSearchHeadline;

  /// No description provided for @workerSearchSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Chọn nghề, khu vực và xem thợ đang sẵn sàng nhận việc.'**
  String get workerSearchSubtitle;

  /// No description provided for @workerSearchHint.
  ///
  /// In vi, this message translates to:
  /// **'Tìm theo tên, nghề nghiệp, khu vực...'**
  String get workerSearchHint;

  /// No description provided for @serviceCategoriesTitle.
  ///
  /// In vi, this message translates to:
  /// **'Danh mục dịch vụ'**
  String get serviceCategoriesTitle;

  /// No description provided for @suggestedAreasTitle.
  ///
  /// In vi, this message translates to:
  /// **'Khu vực gợi ý'**
  String get suggestedAreasTitle;

  /// No description provided for @workerListTitle.
  ///
  /// In vi, this message translates to:
  /// **'Danh sách thợ'**
  String get workerListTitle;

  /// No description provided for @matchingResults.
  ///
  /// In vi, this message translates to:
  /// **'{count} kết quả phù hợp'**
  String matchingResults(int count);

  /// No description provided for @noMatchingWorkersTitle.
  ///
  /// In vi, this message translates to:
  /// **'Chưa có kết quả phù hợp'**
  String get noMatchingWorkersTitle;

  /// No description provided for @noMatchingWorkersDescription.
  ///
  /// In vi, this message translates to:
  /// **'Thử đổi từ khóa hoặc bộ lọc danh mục để xem thêm thợ.'**
  String get noMatchingWorkersDescription;

  /// No description provided for @details.
  ///
  /// In vi, this message translates to:
  /// **'Chi tiết'**
  String get details;

  /// No description provided for @ageAndProfession.
  ///
  /// In vi, this message translates to:
  /// **'{age} tuổi • {profession}'**
  String ageAndProfession(int age, String profession);

  /// No description provided for @yearsExperienceShort.
  ///
  /// In vi, this message translates to:
  /// **'{years} năm KN'**
  String yearsExperienceShort(int years);

  /// No description provided for @yearsExperienceLong.
  ///
  /// In vi, this message translates to:
  /// **'{years} năm kinh nghiệm'**
  String yearsExperienceLong(int years);

  /// No description provided for @ratingLabel.
  ///
  /// In vi, this message translates to:
  /// **'{rating} sao'**
  String ratingLabel(double rating);

  /// No description provided for @completedJobsLabel.
  ///
  /// In vi, this message translates to:
  /// **'{count} công việc'**
  String completedJobsLabel(int count);

  /// No description provided for @completedRepairsLabel.
  ///
  /// In vi, this message translates to:
  /// **'{count} lượt sửa'**
  String completedRepairsLabel(int count);

  /// No description provided for @distanceLabel.
  ///
  /// In vi, this message translates to:
  /// **'{distanceKm} km'**
  String distanceLabel(double distanceKm);

  /// No description provided for @workerDetailTitle.
  ///
  /// In vi, this message translates to:
  /// **'Chi tiết thợ'**
  String get workerDetailTitle;

  /// No description provided for @contactNowWithPrice.
  ///
  /// In vi, this message translates to:
  /// **'Liên hệ ngay • {price}'**
  String contactNowWithPrice(String price);

  /// No description provided for @workerContactPlaceholder.
  ///
  /// In vi, this message translates to:
  /// **'Bạn có thể gắn màn chat hoặc tạo yêu cầu sửa chữa ở bước sau.'**
  String get workerContactPlaceholder;

  /// No description provided for @messagesAppBar.
  ///
  /// In vi, this message translates to:
  /// **'Tin nhắn'**
  String get messagesAppBar;

  /// No description provided for @recentConversationsTitle.
  ///
  /// In vi, this message translates to:
  /// **'Hội thoại gần đây'**
  String get recentConversationsTitle;

  /// No description provided for @recentConversationsSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Tìm nhanh cuộc trò chuyện và lọc theo trạng thái đọc.'**
  String get recentConversationsSubtitle;

  /// No description provided for @messageSearchHint.
  ///
  /// In vi, this message translates to:
  /// **'Tìm theo tên thợ, nghề, nội dung...'**
  String get messageSearchHint;

  /// No description provided for @unreadOnly.
  ///
  /// In vi, this message translates to:
  /// **'Chưa đọc'**
  String get unreadOnly;

  /// No description provided for @latestFirst.
  ///
  /// In vi, this message translates to:
  /// **'Mới nhất'**
  String get latestFirst;

  /// No description provided for @oldestFirst.
  ///
  /// In vi, this message translates to:
  /// **'Cũ nhất'**
  String get oldestFirst;

  /// No description provided for @conversationListTitle.
  ///
  /// In vi, this message translates to:
  /// **'Danh sách trò chuyện'**
  String get conversationListTitle;

  /// No description provided for @conversationsCount.
  ///
  /// In vi, this message translates to:
  /// **'{count} cuộc trò chuyện'**
  String conversationsCount(int count);

  /// No description provided for @noMatchingConversationsTitle.
  ///
  /// In vi, this message translates to:
  /// **'Không có cuộc trò chuyện phù hợp'**
  String get noMatchingConversationsTitle;

  /// No description provided for @noMatchingConversationsDescription.
  ///
  /// In vi, this message translates to:
  /// **'Thử đổi bộ lọc hoặc tìm bằng từ khóa khác.'**
  String get noMatchingConversationsDescription;

  /// No description provided for @readyWorkersTitle.
  ///
  /// In vi, this message translates to:
  /// **'Thợ đang sẵn sàng nhận việc'**
  String get readyWorkersTitle;

  /// No description provided for @readyWorkersSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Gợi ý thêm để bạn mở rộng liên hệ nhanh.'**
  String get readyWorkersSubtitle;

  /// No description provided for @myWorkAppBar.
  ///
  /// In vi, this message translates to:
  /// **'Việc của tôi'**
  String get myWorkAppBar;

  /// No description provided for @myWorkHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Bài đăng đang hiển thị'**
  String get myWorkHeadline;

  /// No description provided for @myWorkSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Theo dõi các bài viết về mình đang xuất hiện trong từng danh mục.'**
  String get myWorkSubtitle;

  /// No description provided for @viewsCount.
  ///
  /// In vi, this message translates to:
  /// **'{count} lượt xem'**
  String viewsCount(int count);

  /// No description provided for @contactCount.
  ///
  /// In vi, this message translates to:
  /// **'{count} liên hệ'**
  String contactCount(int count);

  /// No description provided for @updatedAtLabel.
  ///
  /// In vi, this message translates to:
  /// **'Cập nhật lần cuối: {value}'**
  String updatedAtLabel(String value);

  /// No description provided for @profileAppBar.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ'**
  String get profileAppBar;

  /// No description provided for @profileHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Tài khoản và hồ sơ thợ'**
  String get profileHeadline;

  /// No description provided for @profileSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Quản lý thông tin cá nhân, năng lực và trạng thái xác thực.'**
  String get profileSubtitle;

  /// No description provided for @accountInfoTitle.
  ///
  /// In vi, this message translates to:
  /// **'Thông tin tài khoản'**
  String get accountInfoTitle;

  /// No description provided for @workerProfileTitle.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ thợ'**
  String get workerProfileTitle;

  /// No description provided for @noWorkerProfile.
  ///
  /// In vi, this message translates to:
  /// **'Bạn chưa tạo hồ sơ thợ.'**
  String get noWorkerProfile;

  /// No description provided for @kycTitle.
  ///
  /// In vi, this message translates to:
  /// **'KYC'**
  String get kycTitle;

  /// No description provided for @kycApproved.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ KYC đã được duyệt.'**
  String get kycApproved;

  /// No description provided for @kycPending.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ KYC đang chờ duyệt.'**
  String get kycPending;

  /// No description provided for @kycNotSubmitted.
  ///
  /// In vi, this message translates to:
  /// **'Bạn chưa gửi hồ sơ KYC.'**
  String get kycNotSubmitted;

  /// No description provided for @viewKyc.
  ///
  /// In vi, this message translates to:
  /// **'Xem KYC'**
  String get viewKyc;

  /// No description provided for @kycPlaceholder.
  ///
  /// In vi, this message translates to:
  /// **'Đây là placeholder UI cho quy trình KYC.'**
  String get kycPlaceholder;

  /// No description provided for @preferencesTitle.
  ///
  /// In vi, this message translates to:
  /// **'Tùy chọn'**
  String get preferencesTitle;

  /// No description provided for @themeModeLabel.
  ///
  /// In vi, this message translates to:
  /// **'Đổi theme sáng/tối'**
  String get themeModeLabel;

  /// No description provided for @languageLabel.
  ///
  /// In vi, this message translates to:
  /// **'Ngôn ngữ'**
  String get languageLabel;

  /// No description provided for @languageDescription.
  ///
  /// In vi, this message translates to:
  /// **'Ứng dụng hỗ trợ tiếng Việt và tiếng Anh.'**
  String get languageDescription;

  /// No description provided for @vietnameseLabel.
  ///
  /// In vi, this message translates to:
  /// **'Tiếng Việt'**
  String get vietnameseLabel;

  /// No description provided for @englishLabel.
  ///
  /// In vi, this message translates to:
  /// **'English'**
  String get englishLabel;

  /// No description provided for @signOut.
  ///
  /// In vi, this message translates to:
  /// **'Đăng xuất'**
  String get signOut;

  /// No description provided for @retry.
  ///
  /// In vi, this message translates to:
  /// **'Thử lại'**
  String get retry;

  /// No description provided for @updateAction.
  ///
  /// In vi, this message translates to:
  /// **'Cập nhật'**
  String get updateAction;

  /// No description provided for @understoodAction.
  ///
  /// In vi, this message translates to:
  /// **'Đã hiểu'**
  String get understoodAction;

  /// No description provided for @updateUnavailableTitle.
  ///
  /// In vi, this message translates to:
  /// **'Không thể cập nhật'**
  String get updateUnavailableTitle;

  /// No description provided for @updateLinkMissingMessage.
  ///
  /// In vi, this message translates to:
  /// **'Chưa cấu hình đường dẫn cập nhật cho ứng dụng.'**
  String get updateLinkMissingMessage;

  /// No description provided for @updateLinkOpenFailedMessage.
  ///
  /// In vi, this message translates to:
  /// **'Không thể mở liên kết cập nhật. Vui lòng thử lại sau.'**
  String get updateLinkOpenFailedMessage;

  /// No description provided for @mainShellPreviewTitle.
  ///
  /// In vi, this message translates to:
  /// **'Tìm thợ gần đây'**
  String get mainShellPreviewTitle;

  /// No description provided for @mainShellPreviewDescription.
  ///
  /// In vi, this message translates to:
  /// **'Bản xem trước này dùng để kiểm tra nhanh khung điều hướng chính và thanh điều hướng dưới.'**
  String get mainShellPreviewDescription;

  /// No description provided for @mainShellPreviewBody.
  ///
  /// In vi, this message translates to:
  /// **'Nội dung từng tab sẽ hiển thị tại đây khi ứng dụng chạy qua GoRouter.'**
  String get mainShellPreviewBody;

  /// No description provided for @emptyStatePreviewTitle.
  ///
  /// In vi, this message translates to:
  /// **'Chưa có dữ liệu'**
  String get emptyStatePreviewTitle;

  /// No description provided for @emptyStatePreviewDescription.
  ///
  /// In vi, this message translates to:
  /// **'Nội dung sẽ hiển thị ở đây khi chưa có kết quả phù hợp.'**
  String get emptyStatePreviewDescription;

  /// No description provided for @simplePreviewText.
  ///
  /// In vi, this message translates to:
  /// **'Bản xem trước đơn giản'**
  String get simplePreviewText;

  /// No description provided for @commonViewPreviewTitle.
  ///
  /// In vi, this message translates to:
  /// **'Nội dung mẫu'**
  String get commonViewPreviewTitle;

  /// No description provided for @categoryElectrical.
  ///
  /// In vi, this message translates to:
  /// **'Điện'**
  String get categoryElectrical;

  /// No description provided for @categoryPlumbing.
  ///
  /// In vi, this message translates to:
  /// **'Nước'**
  String get categoryPlumbing;

  /// No description provided for @categoryCoolingHvac.
  ///
  /// In vi, this message translates to:
  /// **'Điện lạnh'**
  String get categoryCoolingHvac;

  /// No description provided for @categoryHomeAppliances.
  ///
  /// In vi, this message translates to:
  /// **'Đồ gia dụng'**
  String get categoryHomeAppliances;

  /// No description provided for @categoryPaintingRepair.
  ///
  /// In vi, this message translates to:
  /// **'Sơn sửa'**
  String get categoryPaintingRepair;

  /// No description provided for @professionResidentialElectrician.
  ///
  /// In vi, this message translates to:
  /// **'Thợ điện dân dụng'**
  String get professionResidentialElectrician;

  /// No description provided for @professionFastResponsePlumber.
  ///
  /// In vi, this message translates to:
  /// **'Thợ nước nhanh gọn'**
  String get professionFastResponsePlumber;

  /// No description provided for @professionHvacTechnician.
  ///
  /// In vi, this message translates to:
  /// **'Thợ điện lạnh'**
  String get professionHvacTechnician;

  /// No description provided for @professionHomeApplianceTechnician.
  ///
  /// In vi, this message translates to:
  /// **'Thợ đồ gia dụng'**
  String get professionHomeApplianceTechnician;

  /// No description provided for @professionFinishingPainter.
  ///
  /// In vi, this message translates to:
  /// **'Thợ sơn hoàn thiện'**
  String get professionFinishingPainter;

  /// No description provided for @professionConcealedPipePlumber.
  ///
  /// In vi, this message translates to:
  /// **'Thợ ống nước âm tường'**
  String get professionConcealedPipePlumber;

  /// No description provided for @professionInverterAcCleaner.
  ///
  /// In vi, this message translates to:
  /// **'Thợ vệ sinh máy lạnh inverter'**
  String get professionInverterAcCleaner;

  /// No description provided for @professionMultiSkilledTechnician.
  ///
  /// In vi, this message translates to:
  /// **'Thợ đa năng'**
  String get professionMultiSkilledTechnician;

  /// No description provided for @workerBioElectrical.
  ///
  /// In vi, this message translates to:
  /// **'Chuyên chạm chích, aptomat, dây nguồn và thiết bị điện trong nhà.'**
  String get workerBioElectrical;

  /// No description provided for @workerBioPlumbing.
  ///
  /// In vi, this message translates to:
  /// **'Xử lý rò rỉ, thông bồn rửa, lắp đặt thiết bị vệ sinh.'**
  String get workerBioPlumbing;

  /// No description provided for @workerBioHvac.
  ///
  /// In vi, this message translates to:
  /// **'Vệ sinh máy lạnh, bơm ga, sửa tủ lạnh và máy giặt inverter.'**
  String get workerBioHvac;

  /// No description provided for @workerBioAppliance.
  ///
  /// In vi, this message translates to:
  /// **'Sửa bếp từ, máy nước nóng, lò vi sóng và máy hút mùi.'**
  String get workerBioAppliance;

  /// No description provided for @workerBioPainting.
  ///
  /// In vi, this message translates to:
  /// **'Sơn tường nội thất, xử lý bong tróc và thấm ẩm nhanh sạch.'**
  String get workerBioPainting;

  /// No description provided for @workerBioConcealedPipe.
  ///
  /// In vi, this message translates to:
  /// **'Chuyên tìm điểm rò ngầm, thay ống âm tường và chống thấm WC.'**
  String get workerBioConcealedPipe;

  /// No description provided for @workerBioAcCleaning.
  ///
  /// In vi, this message translates to:
  /// **'Vệ sinh định kỳ, kiểm tra yếu lạnh và cân chỉnh bộ nóng lạnh.'**
  String get workerBioAcCleaning;

  /// No description provided for @workerBioGeneralAppliance.
  ///
  /// In vi, this message translates to:
  /// **'Nhận các công việc sửa đồ gia dụng và hỗ trợ lắp đặt cơ bản.'**
  String get workerBioGeneralAppliance;

  /// No description provided for @priceFrom150.
  ///
  /// In vi, this message translates to:
  /// **'Từ 150.000đ'**
  String get priceFrom150;

  /// No description provided for @priceFrom180.
  ///
  /// In vi, this message translates to:
  /// **'Từ 180.000đ'**
  String get priceFrom180;

  /// No description provided for @priceFrom200.
  ///
  /// In vi, this message translates to:
  /// **'Từ 200.000đ'**
  String get priceFrom200;

  /// No description provided for @priceFrom220.
  ///
  /// In vi, this message translates to:
  /// **'Từ 220.000đ'**
  String get priceFrom220;

  /// No description provided for @priceFrom250.
  ///
  /// In vi, this message translates to:
  /// **'Từ 250.000đ'**
  String get priceFrom250;

  /// No description provided for @priceFrom280.
  ///
  /// In vi, this message translates to:
  /// **'Từ 280.000đ'**
  String get priceFrom280;

  /// No description provided for @priceQuotedAfterInspection.
  ///
  /// In vi, this message translates to:
  /// **'Báo giá theo hiện trạng'**
  String get priceQuotedAfterInspection;

  /// No description provided for @priceQuotedPerService.
  ///
  /// In vi, this message translates to:
  /// **'Báo giá theo dịch vụ'**
  String get priceQuotedPerService;

  /// No description provided for @workListingTitleHvacDistrict7.
  ///
  /// In vi, this message translates to:
  /// **'Thợ điện lạnh có mặt nhanh tại Quận 7'**
  String get workListingTitleHvacDistrict7;

  /// No description provided for @workListingTitleSameDayPlumbing.
  ///
  /// In vi, this message translates to:
  /// **'Nhận sửa rò rỉ nước, thông bồn rửa trong ngày'**
  String get workListingTitleSameDayPlumbing;

  /// No description provided for @workListingTitleApplianceRepair.
  ///
  /// In vi, this message translates to:
  /// **'Sửa bếp từ, máy nước nóng tận nơi'**
  String get workListingTitleApplianceRepair;

  /// No description provided for @workListingTitlePainting.
  ///
  /// In vi, this message translates to:
  /// **'Nhận sơn lại căn hộ, xử lý tường ẩm mốc'**
  String get workListingTitlePainting;

  /// No description provided for @visiblePlacementTopSuggestions.
  ///
  /// In vi, this message translates to:
  /// **'Top gợi ý theo khu vực'**
  String get visiblePlacementTopSuggestions;

  /// No description provided for @visiblePlacementPlumbingCategory.
  ///
  /// In vi, this message translates to:
  /// **'Danh mục Nước'**
  String get visiblePlacementPlumbingCategory;

  /// No description provided for @visiblePlacementApplianceCategory.
  ///
  /// In vi, this message translates to:
  /// **'Danh mục Gia dụng'**
  String get visiblePlacementApplianceCategory;

  /// No description provided for @listingStatusPerformingWell.
  ///
  /// In vi, this message translates to:
  /// **'Đang hiển thị tốt'**
  String get listingStatusPerformingWell;

  /// No description provided for @listingStatusStable.
  ///
  /// In vi, this message translates to:
  /// **'Ổn định'**
  String get listingStatusStable;

  /// No description provided for @listingStatusNeedsEngagement.
  ///
  /// In vi, this message translates to:
  /// **'Cần tăng tương tác'**
  String get listingStatusNeedsEngagement;

  /// No description provided for @chatMessageInspectOutlet.
  ///
  /// In vi, this message translates to:
  /// **'Em có thể qua kiểm tra ổ cắm cho mình lúc 19:00.'**
  String get chatMessageInspectOutlet;

  /// No description provided for @chatMessageSentQuote.
  ///
  /// In vi, this message translates to:
  /// **'Anh đã gửi báo giá và thời gian qua nhà ngày mai.'**
  String get chatMessageSentQuote;

  /// No description provided for @chatMessageNeedMorePipePhotos.
  ///
  /// In vi, this message translates to:
  /// **'Mình chụp thêm hiện trạng đường ống giúp em nhé.'**
  String get chatMessageNeedMorePipePhotos;

  /// No description provided for @chatMessageNeedPressureCheck.
  ///
  /// In vi, this message translates to:
  /// **'Phần rò ngầm này em cần ghé đo áp lực nước trước khi báo giá.'**
  String get chatMessageNeedPressureCheck;

  /// No description provided for @chatMessageSlot1630.
  ///
  /// In vi, this message translates to:
  /// **'Chiều nay em có slot 16:30, mình xác nhận để em mang đúng linh kiện.'**
  String get chatMessageSlot1630;

  /// No description provided for @failureLoadGlobalConfig.
  ///
  /// In vi, this message translates to:
  /// **'Không thể tải cấu hình ứng dụng lúc này.'**
  String get failureLoadGlobalConfig;

  /// No description provided for @failureLoginUnavailable.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập không thành công. Vui lòng thử lại.'**
  String get failureLoginUnavailable;

  /// No description provided for @failureInvalidLoginCredentials.
  ///
  /// In vi, this message translates to:
  /// **'Thông tin đăng nhập không chính xác.'**
  String get failureInvalidLoginCredentials;

  /// No description provided for @failureGoogleNotImplemented.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập Google chưa khả dụng.'**
  String get failureGoogleNotImplemented;

  /// No description provided for @failureGoogleLoginTimeout.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập Google đã hết thời gian. Vui lòng thử lại.'**
  String get failureGoogleLoginTimeout;

  /// No description provided for @failureGoogleLoginScreenUnavailable.
  ///
  /// In vi, this message translates to:
  /// **'Không mở được màn hình đăng nhập Google.'**
  String get failureGoogleLoginScreenUnavailable;

  /// No description provided for @failureGoogleUnavailable.
  ///
  /// In vi, this message translates to:
  /// **'Không thể đăng nhập với Google lúc này.'**
  String get failureGoogleUnavailable;

  /// No description provided for @failureCredentialsUnavailable.
  ///
  /// In vi, this message translates to:
  /// **'Không thể đăng nhập bằng số điện thoại hoặc email.'**
  String get failureCredentialsUnavailable;

  /// No description provided for @failureLoadCategories.
  ///
  /// In vi, this message translates to:
  /// **'Không tải được danh mục dịch vụ.'**
  String get failureLoadCategories;

  /// No description provided for @failureLoadWorkers.
  ///
  /// In vi, this message translates to:
  /// **'Không tải được danh sách thợ.'**
  String get failureLoadWorkers;

  /// No description provided for @failureLoadWorkerDetails.
  ///
  /// In vi, this message translates to:
  /// **'Không tìm thấy thông tin thợ.'**
  String get failureLoadWorkerDetails;

  /// No description provided for @failureLoadConversations.
  ///
  /// In vi, this message translates to:
  /// **'Không tải được danh sách trò chuyện.'**
  String get failureLoadConversations;

  /// No description provided for @failureLoadRecentConversations.
  ///
  /// In vi, this message translates to:
  /// **'Không tải được hội thoại.'**
  String get failureLoadRecentConversations;

  /// No description provided for @failureLoadWorkListings.
  ///
  /// In vi, this message translates to:
  /// **'Không tải được danh sách bài đăng công việc.'**
  String get failureLoadWorkListings;

  /// No description provided for @failureLoadProfile.
  ///
  /// In vi, this message translates to:
  /// **'Không tải được thông tin hồ sơ.'**
  String get failureLoadProfile;

  /// No description provided for @workerNameLeVanKhoa.
  ///
  /// In vi, this message translates to:
  /// **'Lê Văn Khoa'**
  String get workerNameLeVanKhoa;

  /// No description provided for @workerNamePhamQuocBao.
  ///
  /// In vi, this message translates to:
  /// **'Phạm Quốc Bảo'**
  String get workerNamePhamQuocBao;

  /// No description provided for @workerNameDoDucHai.
  ///
  /// In vi, this message translates to:
  /// **'Đỗ Đức Hải'**
  String get workerNameDoDucHai;

  /// No description provided for @workerNameNguyenAnhTuan.
  ///
  /// In vi, this message translates to:
  /// **'Nguyễn Anh Tuấn'**
  String get workerNameNguyenAnhTuan;

  /// No description provided for @workerNameVoMinhTri.
  ///
  /// In vi, this message translates to:
  /// **'Võ Minh Trí'**
  String get workerNameVoMinhTri;

  /// No description provided for @workerNameTranHuuDat.
  ///
  /// In vi, this message translates to:
  /// **'Trần Hữu Đạt'**
  String get workerNameTranHuuDat;

  /// No description provided for @workerNameNguyenQuocViet.
  ///
  /// In vi, this message translates to:
  /// **'Nguyễn Quốc Việt'**
  String get workerNameNguyenQuocViet;

  /// No description provided for @workerShortNameLeVanKhoa.
  ///
  /// In vi, this message translates to:
  /// **'Văn Khoa'**
  String get workerShortNameLeVanKhoa;

  /// No description provided for @workerShortNamePhamQuocBao.
  ///
  /// In vi, this message translates to:
  /// **'Quốc Bảo'**
  String get workerShortNamePhamQuocBao;

  /// No description provided for @workerShortNameDoDucHai.
  ///
  /// In vi, this message translates to:
  /// **'Đức Hải'**
  String get workerShortNameDoDucHai;

  /// No description provided for @workerShortNameNguyenAnhTuan.
  ///
  /// In vi, this message translates to:
  /// **'Anh Tuấn'**
  String get workerShortNameNguyenAnhTuan;

  /// No description provided for @workerShortNameVoMinhTri.
  ///
  /// In vi, this message translates to:
  /// **'Minh Trí'**
  String get workerShortNameVoMinhTri;

  /// No description provided for @workerShortNameTranHuuDat.
  ///
  /// In vi, this message translates to:
  /// **'Hữu Đạt'**
  String get workerShortNameTranHuuDat;

  /// No description provided for @workerShortNameNguyenQuocViet.
  ///
  /// In vi, this message translates to:
  /// **'Quốc Việt'**
  String get workerShortNameNguyenQuocViet;

  /// No description provided for @areaDistrict7.
  ///
  /// In vi, this message translates to:
  /// **'Quận 7'**
  String get areaDistrict7;

  /// No description provided for @areaNhaBe.
  ///
  /// In vi, this message translates to:
  /// **'Nhà Bè'**
  String get areaNhaBe;

  /// No description provided for @areaThuDuc.
  ///
  /// In vi, this message translates to:
  /// **'Thủ Đức'**
  String get areaThuDuc;

  /// No description provided for @areaBinhThanh.
  ///
  /// In vi, this message translates to:
  /// **'Bình Thạnh'**
  String get areaBinhThanh;

  /// No description provided for @areaDistrict4.
  ///
  /// In vi, this message translates to:
  /// **'Quận 4'**
  String get areaDistrict4;

  /// No description provided for @areaGoVap.
  ///
  /// In vi, this message translates to:
  /// **'Gò Vấp'**
  String get areaGoVap;

  /// No description provided for @areaTanBinh.
  ///
  /// In vi, this message translates to:
  /// **'Tân Bình'**
  String get areaTanBinh;

  /// No description provided for @workerDetailServicesAndPricing.
  ///
  /// In vi, this message translates to:
  /// **'Dịch vụ & chi phí'**
  String get workerDetailServicesAndPricing;

  /// No description provided for @workerDetailActivityArea.
  ///
  /// In vi, this message translates to:
  /// **'Khu vực hoạt động'**
  String get workerDetailActivityArea;

  /// No description provided for @workerDetailPortfolio.
  ///
  /// In vi, this message translates to:
  /// **'Hình ảnh thi công'**
  String get workerDetailPortfolio;

  /// No description provided for @workerDetailSeeAll.
  ///
  /// In vi, this message translates to:
  /// **'Xem tất cả'**
  String get workerDetailSeeAll;

  /// No description provided for @workerDetailReviewsTitle.
  ///
  /// In vi, this message translates to:
  /// **'Đánh giá từ khách hàng'**
  String get workerDetailReviewsTitle;

  /// No description provided for @workerDetailReviewCount.
  ///
  /// In vi, this message translates to:
  /// **'({count} đánh giá)'**
  String workerDetailReviewCount(int count);

  /// No description provided for @workerDetailExperienceLabel.
  ///
  /// In vi, this message translates to:
  /// **'Kinh nghiệm'**
  String get workerDetailExperienceLabel;

  /// No description provided for @workerDetailExperienceValue.
  ///
  /// In vi, this message translates to:
  /// **'{years} năm'**
  String workerDetailExperienceValue(int years);

  /// No description provided for @workerDetailJobsLabel.
  ///
  /// In vi, this message translates to:
  /// **'Công việc'**
  String get workerDetailJobsLabel;

  /// No description provided for @workerDetailLocationLabel.
  ///
  /// In vi, this message translates to:
  /// **'{area}, TP. HCM'**
  String workerDetailLocationLabel(String area);

  /// No description provided for @workerDetailExtraPortfolio.
  ///
  /// In vi, this message translates to:
  /// **'+{count}'**
  String workerDetailExtraPortfolio(int count);

  /// No description provided for @workerDetailUnavailableMessage.
  ///
  /// In vi, this message translates to:
  /// **'Không thể hiển thị chi tiết thợ lúc này.'**
  String get workerDetailUnavailableMessage;

  /// No description provided for @globalConfigForceUpdateTitle.
  ///
  /// In vi, this message translates to:
  /// **'Cần cập nhật ứng dụng'**
  String get globalConfigForceUpdateTitle;

  /// No description provided for @globalConfigRecommendedUpdateTitle.
  ///
  /// In vi, this message translates to:
  /// **'Đã có phiên bản mới'**
  String get globalConfigRecommendedUpdateTitle;

  /// No description provided for @globalConfigForceUpdateMessage.
  ///
  /// In vi, this message translates to:
  /// **'Phiên bản hiện tại đã quá cũ. Vui lòng cập nhật ứng dụng để tiếp tục sử dụng.'**
  String get globalConfigForceUpdateMessage;

  /// No description provided for @globalConfigRecommendedUpdateMessage.
  ///
  /// In vi, this message translates to:
  /// **'Đã có phiên bản mới của ứng dụng. Bạn nên cập nhật để có trải nghiệm tốt hơn.'**
  String get globalConfigRecommendedUpdateMessage;

  /// No description provided for @globalConfigImportantNoticeTitle.
  ///
  /// In vi, this message translates to:
  /// **'Thông báo quan trọng'**
  String get globalConfigImportantNoticeTitle;

  /// No description provided for @workerDetailServiceElectricalRepair.
  ///
  /// In vi, this message translates to:
  /// **'Sửa điện'**
  String get workerDetailServiceElectricalRepair;

  /// No description provided for @workerDetailServiceBreaker.
  ///
  /// In vi, this message translates to:
  /// **'Aptomat'**
  String get workerDetailServiceBreaker;

  /// No description provided for @workerDetailServiceOutlet.
  ///
  /// In vi, this message translates to:
  /// **'Ổ cắm'**
  String get workerDetailServiceOutlet;

  /// No description provided for @workerDetailServiceCeilingLight.
  ///
  /// In vi, this message translates to:
  /// **'Đèn trần'**
  String get workerDetailServiceCeilingLight;

  /// No description provided for @workerDetailServicePipeRepair.
  ///
  /// In vi, this message translates to:
  /// **'Ống nước'**
  String get workerDetailServicePipeRepair;

  /// No description provided for @workerDetailServiceSink.
  ///
  /// In vi, this message translates to:
  /// **'Bồn rửa'**
  String get workerDetailServiceSink;

  /// No description provided for @workerDetailServicePump.
  ///
  /// In vi, this message translates to:
  /// **'Máy bơm'**
  String get workerDetailServicePump;

  /// No description provided for @workerDetailServiceLeakFix.
  ///
  /// In vi, this message translates to:
  /// **'Chống rò rỉ'**
  String get workerDetailServiceLeakFix;

  /// No description provided for @workerDetailServiceWashingMachine.
  ///
  /// In vi, this message translates to:
  /// **'Sửa máy giặt'**
  String get workerDetailServiceWashingMachine;

  /// No description provided for @workerDetailServiceRefrigerator.
  ///
  /// In vi, this message translates to:
  /// **'Tủ lạnh'**
  String get workerDetailServiceRefrigerator;

  /// No description provided for @workerDetailServiceAirConditioner.
  ///
  /// In vi, this message translates to:
  /// **'Điều hòa'**
  String get workerDetailServiceAirConditioner;

  /// No description provided for @workerDetailServiceMicrowave.
  ///
  /// In vi, this message translates to:
  /// **'Lò vi sóng'**
  String get workerDetailServiceMicrowave;

  /// No description provided for @workerDetailServiceInductionCooker.
  ///
  /// In vi, this message translates to:
  /// **'Bếp từ'**
  String get workerDetailServiceInductionCooker;

  /// No description provided for @workerDetailServiceWaterHeater.
  ///
  /// In vi, this message translates to:
  /// **'Máy nước nóng'**
  String get workerDetailServiceWaterHeater;

  /// No description provided for @workerDetailServiceRangeHood.
  ///
  /// In vi, this message translates to:
  /// **'Máy hút mùi'**
  String get workerDetailServiceRangeHood;

  /// No description provided for @workerDetailServiceWallPainting.
  ///
  /// In vi, this message translates to:
  /// **'Sơn tường'**
  String get workerDetailServiceWallPainting;

  /// No description provided for @workerDetailServiceCrackFilling.
  ///
  /// In vi, this message translates to:
  /// **'Trám nứt'**
  String get workerDetailServiceCrackFilling;

  /// No description provided for @workerDetailServiceWaterproofing.
  ///
  /// In vi, this message translates to:
  /// **'Chống thấm'**
  String get workerDetailServiceWaterproofing;

  /// No description provided for @workerDetailServiceFinishing.
  ///
  /// In vi, this message translates to:
  /// **'Hoàn thiện'**
  String get workerDetailServiceFinishing;

  /// No description provided for @workerDetailServiceHomeRepair.
  ///
  /// In vi, this message translates to:
  /// **'Sửa chữa tại nhà'**
  String get workerDetailServiceHomeRepair;

  /// No description provided for @workerDetailServiceInspection.
  ///
  /// In vi, this message translates to:
  /// **'Khảo sát'**
  String get workerDetailServiceInspection;

  /// No description provided for @workerDetailServiceQuotation.
  ///
  /// In vi, this message translates to:
  /// **'Báo giá'**
  String get workerDetailServiceQuotation;

  /// No description provided for @workerDetailServiceFastSupport.
  ///
  /// In vi, this message translates to:
  /// **'Hỗ trợ nhanh'**
  String get workerDetailServiceFastSupport;

  /// No description provided for @reviewAuthorMinhHoang.
  ///
  /// In vi, this message translates to:
  /// **'Minh Hoàng'**
  String get reviewAuthorMinhHoang;

  /// No description provided for @reviewAuthorThanhHuong.
  ///
  /// In vi, this message translates to:
  /// **'Thanh Hương'**
  String get reviewAuthorThanhHuong;

  /// No description provided for @reviewTimeTwoDaysAgo.
  ///
  /// In vi, this message translates to:
  /// **'2 ngày trước'**
  String get reviewTimeTwoDaysAgo;

  /// No description provided for @reviewTimeOneWeekAgo.
  ///
  /// In vi, this message translates to:
  /// **'1 tuần trước'**
  String get reviewTimeOneWeekAgo;

  /// No description provided for @reviewContentOne.
  ///
  /// In vi, this message translates to:
  /// **'Anh Tuấn làm việc rất chuyên nghiệp, đúng giờ và giải thích kỹ vấn đề của máy giặt. Giá cả minh bạch. Rất hài lòng!'**
  String get reviewContentOne;

  /// No description provided for @reviewContentTwo.
  ///
  /// In vi, this message translates to:
  /// **'Sửa điều hòa rất nhanh, dọn dẹp sạch sẽ sau khi làm xong. Sẽ tiếp tục ủng hộ anh.'**
  String get reviewContentTwo;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
