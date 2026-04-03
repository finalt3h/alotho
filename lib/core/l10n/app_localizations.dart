import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = [Locale('vi'), Locale('en')];

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    _AppLocalizationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static AppLocalizations of(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    assert(localization != null, 'AppLocalizations not found in context.');
    return localization!;
  }

  bool get isVietnamese => locale.languageCode == 'vi';

  String _text({required String vi, required String en}) {
    return isVietnamese ? vi : en;
  }

  String get appTitle => 'Alo Tho';
  String get splashTagline => _text(
    vi: 'Tim tho uy tin quanh ban chi trong vai giay.',
    en: 'Find trusted repair workers near you in seconds.',
  );
  String get loginTitle => _text(
    vi: 'Dang nhap de tim tho phu hop',
    en: 'Sign in to find the right worker',
  );
  String get loginDescription => _text(
    vi: 'Dang nhap bang so dien thoai, email va mat khau. Google sign-in van san sang de gan backend that sau.',
    en: 'Sign in with your phone number or email and password. Google sign-in remains ready for real backend integration later.',
  );
  String get loginIdentifierLabel =>
      _text(vi: 'So dien thoai hoac email', en: 'Phone number or email');
  String get loginIdentifierHint => _text(
    vi: '0912 345 678 hoac ban@example.com',
    en: '0912 345 678 or you@example.com',
  );
  String get passwordLabel => _text(vi: 'Mat khau', en: 'Password');
  String get passwordHint =>
      _text(vi: 'Nhap mat khau cua ban', en: 'Enter your password');
  String get processing => _text(vi: 'Dang xu ly...', en: 'Processing...');
  String get signInWithCredentials => _text(vi: 'Dang nhap', en: 'Sign in');
  String get orLabel => _text(vi: 'hoac', en: 'or');
  String get signInWithGoogle =>
      _text(vi: 'Dang nhap bang Google', en: 'Sign in with Google');
  String get forgotPassword =>
      _text(vi: 'Quen mat khau?', en: 'Forgot password?');
  String get forgotPasswordPlaceholder => _text(
    vi: 'Tam thoi day la nut placeholder cho flow quen mat khau.',
    en: 'This is currently a placeholder for the forgot password flow.',
  );
  String get loginBenefitTitle => _text(
    vi: 'Ban xem duoc gi sau khi dang nhap?',
    en: 'What do you get after signing in?',
  );
  String get loginBenefitDescription => _text(
    vi: 'Tim tho theo nghe va khu vuc, xem hoi tho gan day, quan ly bai dang ve cong viec cua ban va cap nhat ho so tho.',
    en: 'Search workers by service and area, review recent conversations, manage your work posts, and update your worker profile.',
  );
  String get invalidLoginIdentifier => _text(
    vi: 'So dien thoai hoac email chua hop le.',
    en: 'The phone number or email is invalid.',
  );
  String get invalidPassword =>
      _text(vi: 'Mat khau chua hop le.', en: 'The password is invalid.');
  String get workerSearchNav => _text(vi: 'Tim tho', en: 'Search');
  String get messagesNav => _text(vi: 'Tin nhan', en: 'Messages');
  String get myWorkNav => _text(vi: 'Cong viec', en: 'My work');
  String get profileNav => _text(vi: 'Ho so', en: 'Profile');
  String get workerSearchAppBar =>
      _text(vi: 'Tim tho gan day', en: 'Nearby workers');
  String get workerSearchHeadline =>
      _text(vi: 'Ban can sua gi hom nay?', en: 'What do you need fixed today?');
  String get workerSearchSubtitle => _text(
    vi: 'Chon nghe, khu vuc va xem tho dang san sang nhan viec.',
    en: 'Pick a service, browse nearby areas, and see available workers.',
  );
  String get workerSearchHint => _text(
    vi: 'Tim theo ten, nghe nghiep, khu vuc...',
    en: 'Search by name, trade, or area...',
  );
  String get serviceCategoriesTitle =>
      _text(vi: 'Danh muc dich vu', en: 'Service categories');
  String get suggestedAreasTitle =>
      _text(vi: 'Khu vuc goi y', en: 'Suggested areas');
  String get workerListTitle =>
      _text(vi: 'Danh sach tho', en: 'Available workers');
  String matchingResults(int count) =>
      _text(vi: '$count ket qua phu hop', en: '$count matching results');
  String get noMatchingWorkersTitle =>
      _text(vi: 'Chua co ket qua phu hop', en: 'No matching workers yet');
  String get noMatchingWorkersDescription => _text(
    vi: 'Thu doi tu khoa hoac bo loc danh muc de xem them tho.',
    en: 'Try another keyword or clear the category filter to see more workers.',
  );
  String get details => _text(vi: 'Chi tiet', en: 'Details');
  String ageAndProfession(int age, String profession) => _text(
    vi: '$age tuoi • ${workerProfession(profession)}',
    en: '$age years old • ${workerProfession(profession)}',
  );
  String yearsExperienceShort(int years) =>
      _text(vi: '$years nam KN', en: '$years yrs exp');
  String yearsExperienceLong(int years) =>
      _text(vi: '$years nam kinh nghiem', en: '$years years of experience');
  String ratingLabel(double rating) =>
      _text(vi: '$rating sao', en: '$rating stars');
  String completedJobsLabel(int count) =>
      _text(vi: '$count cong viec', en: '$count jobs');
  String completedRepairsLabel(int count) =>
      _text(vi: '$count luot sua', en: '$count completed repairs');
  String distanceLabel(double distanceKm) =>
      _text(vi: '$distanceKm km', en: '$distanceKm km');
  String get workerDetailTitle =>
      _text(vi: 'Chi tiet tho', en: 'Worker details');
  String contactNowWithPrice(String price) => _text(
    vi: 'Lien he ngay • ${priceDescription(price)}',
    en: 'Contact now • ${priceDescription(price)}',
  );
  String get workerContactPlaceholder => _text(
    vi: 'Ban co the gan man chat hoac tao yeu cau sua chua o buoc sau.',
    en: 'You can connect this action to chat or create a repair request next.',
  );
  String get messagesAppBar => _text(vi: 'Tin nhan', en: 'Messages');
  String get recentConversationsTitle =>
      _text(vi: 'Hoi tho gan day', en: 'Recent conversations');
  String get recentConversationsSubtitle => _text(
    vi: 'Tim nhanh cuoc tro chuyen va loc theo trang thai doc.',
    en: 'Search conversations quickly and filter by read status.',
  );
  String get messageSearchHint => _text(
    vi: 'Tim theo ten tho, nghe, noi dung...',
    en: 'Search by worker, trade, or message...',
  );
  String get unreadOnly => _text(vi: 'Chua doc', en: 'Unread');
  String get latestFirst => _text(vi: 'Moi nhat', en: 'Latest');
  String get oldestFirst => _text(vi: 'Cu nhat', en: 'Oldest');
  String get conversationListTitle =>
      _text(vi: 'Danh sach tro chuyen', en: 'Conversation list');
  String conversationsCount(int count) =>
      _text(vi: '$count cuoc tro chuyen', en: '$count conversations');
  String get noMatchingConversationsTitle => _text(
    vi: 'Khong co cuoc tro chuyen phu hop',
    en: 'No matching conversations',
  );
  String get noMatchingConversationsDescription => _text(
    vi: 'Thu doi bo loc hoac tim bang tu khoa khac.',
    en: 'Try another filter or search term.',
  );
  String get readyWorkersTitle => _text(
    vi: 'Tho dang san sang nhan viec',
    en: 'Workers ready to take jobs',
  );
  String get readyWorkersSubtitle => _text(
    vi: 'Goi y them de ban mo rong lien he nhanh.',
    en: 'Extra suggestions to help you contact faster.',
  );
  String get myWorkAppBar => _text(vi: 'Viec cua toi', en: 'My work');
  String get myWorkHeadline =>
      _text(vi: 'Bai dang dang hien thi', en: 'Visible work posts');
  String get myWorkSubtitle => _text(
    vi: 'Theo doi cac bai viet ve minh dang xuat hien trong tung danh muc.',
    en: 'Track which of your posts are showing in each category.',
  );
  String viewsCount(int count) =>
      _text(vi: '$count luot xem', en: '$count views');
  String contactCount(int count) =>
      _text(vi: '$count lien he', en: '$count contacts');
  String updatedAtLabel(String value) =>
      _text(vi: 'Cap nhat lan cuoi: $value', en: 'Last updated: $value');
  String get profileAppBar => _text(vi: 'Ho so', en: 'Profile');
  String get profileHeadline =>
      _text(vi: 'Tai khoan va ho so tho', en: 'Account and worker profile');
  String get profileSubtitle => _text(
    vi: 'Quan ly thong tin ca nhan, nang luc va trang thai xac thuc.',
    en: 'Manage personal info, skills, and verification status.',
  );
  String get accountInfoTitle =>
      _text(vi: 'Thong tin tai khoan', en: 'Account information');
  String get workerProfileTitle => _text(vi: 'Ho so tho', en: 'Worker profile');
  String get noWorkerProfile => _text(
    vi: 'Ban chua tao ho so tho.',
    en: 'You have not created a worker profile yet.',
  );
  String get kycTitle => 'KYC';
  String get kycApproved => _text(
    vi: 'Ho so KYC da duoc duyet.',
    en: 'Your KYC profile has been approved.',
  );
  String get kycPending => _text(
    vi: 'Ho so KYC dang cho duyet.',
    en: 'Your KYC profile is under review.',
  );
  String get kycNotSubmitted => _text(
    vi: 'Ban chua gui ho so KYC.',
    en: 'You have not submitted your KYC profile.',
  );
  String get viewKyc => _text(vi: 'Xem KYC', en: 'View KYC');
  String get kycPlaceholder => _text(
    vi: 'Day la placeholder UI cho quy trinh KYC.',
    en: 'This is a UI placeholder for the KYC flow.',
  );
  String get preferencesTitle => _text(vi: 'Tuy chon', en: 'Preferences');
  String get themeModeLabel =>
      _text(vi: 'Doi theme sang/toi', en: 'Toggle light/dark theme');
  String get languageLabel => _text(vi: 'Ngon ngu', en: 'Language');
  String get languageDescription => _text(
    vi: 'Ung dung ho tro tieng Viet va tieng Anh.',
    en: 'The app supports Vietnamese and English.',
  );
  String get vietnameseLabel => _text(vi: 'Tieng Viet', en: 'Vietnamese');
  String get englishLabel => 'English';
  String get signOut => _text(vi: 'Dang xuat', en: 'Sign out');
  String get retry => _text(vi: 'Thu lai', en: 'Retry');

  String categoryName(String raw) {
    return switch (raw) {
      'Dien' => _text(vi: 'Dien', en: 'Electrical'),
      'Nuoc' => _text(vi: 'Nuoc', en: 'Plumbing'),
      'Dien lanh' => _text(vi: 'Dien lanh', en: 'Cooling & HVAC'),
      'Do gia dung' => _text(vi: 'Do gia dung', en: 'Home appliances'),
      'Son sua' => _text(vi: 'Son sua', en: 'Painting & repair'),
      _ => raw,
    };
  }

  String workerProfession(String raw) {
    return switch (raw) {
      'Tho dien dan dung' => _text(vi: raw, en: 'Residential electrician'),
      'Tho nuoc nhanh gon' => _text(vi: raw, en: 'Fast-response plumber'),
      'Tho dien lanh' => _text(vi: raw, en: 'HVAC technician'),
      'Tho do gia dung' => _text(vi: raw, en: 'Home appliance technician'),
      'Tho son hoan thien' => _text(vi: raw, en: 'Finishing painter'),
      'Tho ong nuoc am tuong' => _text(
        vi: raw,
        en: 'Concealed-pipe plumbing technician',
      ),
      'Tho ve sinh may lanh inverter' => _text(
        vi: raw,
        en: 'Inverter AC cleaning technician',
      ),
      'Tho da nang' => _text(vi: raw, en: 'Multi-skilled technician'),
      _ => raw,
    };
  }

  String workerBio(String raw) {
    return switch (raw) {
      'Chuyen cham chich, aptomat, day nguon va thiet bi dien trong nha.' =>
        _text(
          vi: raw,
          en: 'Specializes in wiring, breakers, power lines, and household electrical devices.',
        ),
      'Xu ly ro ri, thong bon rua, lap dat thiet bi ve sinh.' => _text(
        vi: raw,
        en: 'Handles leaks, sink clogs, and sanitary equipment installation.',
      ),
      'Ve sinh may lanh, bom ga, sua tu lanh va may giat inverter.' => _text(
        vi: raw,
        en: 'Cleans air conditioners, refills gas, and repairs refrigerators and inverter washing machines.',
      ),
      'Sua bep tu, may nuoc nong, lo vi song va may hut mui.' => _text(
        vi: raw,
        en: 'Repairs induction cookers, water heaters, microwaves, and range hoods.',
      ),
      'Son tuong noi that, xu ly bong troc va tham am nhanh sach.' => _text(
        vi: raw,
        en: 'Handles interior painting, peeling walls, and moisture issues cleanly and fast.',
      ),
      'Chuyen tim diem ro ngam, thay ong am tuong va chong tham wc.' => _text(
        vi: raw,
        en: 'Specializes in hidden leaks, in-wall pipe replacement, and bathroom waterproofing.',
      ),
      'Ve sinh dinh ky, kiem tra yeu lanh va can chinh bo nong lanh.' => _text(
        vi: raw,
        en: 'Provides routine AC cleaning, cooling diagnostics, and outdoor unit tuning.',
      ),
      'Nhan cac cong viec sua do gia dung va ho tro lap dat co ban.' => _text(
        vi: raw,
        en: 'Takes home appliance repair jobs and basic installation support.',
      ),
      _ => raw,
    };
  }

  String priceDescription(String raw) {
    return switch (raw) {
      'Tu 150.000d' => _text(vi: raw, en: 'From 150,000 VND'),
      'Tu 180.000d' => _text(vi: raw, en: 'From 180,000 VND'),
      'Tu 200.000d' => _text(vi: raw, en: 'From 200,000 VND'),
      'Tu 220.000d' => _text(vi: raw, en: 'From 220,000 VND'),
      'Tu 250.000d' => _text(vi: raw, en: 'From 250,000 VND'),
      'Tu 280.000d' => _text(vi: raw, en: 'From 280,000 VND'),
      'Bao gia theo hien trang' => _text(
        vi: raw,
        en: 'Quoted after inspection',
      ),
      'Bao gia theo dich vu' => _text(vi: raw, en: 'Quoted per service'),
      _ => raw,
    };
  }

  String workListingTitle(String raw) {
    return switch (raw) {
      'Tho dien lanh co mat nhanh tai Quan 7' => _text(
        vi: raw,
        en: 'HVAC technician available quickly in District 7',
      ),
      'Nhan sua ro ri nuoc, thong bon rua trong ngay' => _text(
        vi: raw,
        en: 'Same-day leak repair and sink unclogging',
      ),
      'Sua bep tu, may nuoc nong tan noi' => _text(
        vi: raw,
        en: 'On-site induction cooker and water heater repair',
      ),
      'Nhan son lai can ho, xu ly tuong am moc' => _text(
        vi: raw,
        en: 'Apartment repainting and damp wall treatment',
      ),
      _ => raw,
    };
  }

  String visiblePlacement(String raw) {
    return switch (raw) {
      'Top goi y theo khu vuc' => _text(vi: raw, en: 'Top suggestions by area'),
      'Danh muc Nuoc' => _text(vi: raw, en: 'Plumbing category'),
      'Danh muc Gia dung' => _text(vi: raw, en: 'Home appliance category'),
      _ => raw,
    };
  }

  String listingStatus(String raw) {
    return switch (raw) {
      'Dang hien thi tot' => _text(vi: raw, en: 'Performing well'),
      'On dinh' => _text(vi: raw, en: 'Stable'),
      'Can tang tuong tac' => _text(vi: raw, en: 'Needs more engagement'),
      _ => raw,
    };
  }

  String chatMessage(String raw) {
    return switch (raw) {
      'Em co the qua kiem tra o cam cho minh luc 19:00.' => _text(
        vi: raw,
        en: 'I can stop by at 7:00 PM to inspect the outlet for you.',
      ),
      'Anh da gui bao gia va thoi gian qua nha ngay mai.' => _text(
        vi: raw,
        en: 'I sent the quote and the time I can come by tomorrow.',
      ),
      'Minh chup them hien trang duong ong giup em nhe.' => _text(
        vi: raw,
        en: 'Please send one more photo of the pipe condition for me.',
      ),
      'Phan ro ngam nay em can ghé do ap luc nuoc trước khi bao gia.' => _text(
        vi: raw,
        en: 'For this hidden leak I need to check water pressure on site before quoting.',
      ),
      'Chieu nay em co slot 16:30, minh xac nhan de em mang dung linh kien.' =>
        _text(
          vi: raw,
          en: 'I have a 4:30 PM slot this afternoon. Please confirm so I can bring the right parts.',
        ),
      _ => raw,
    };
  }

  String localizeFailureMessage(String raw) {
    return switch (raw) {
      'So dien thoai hoac email chua hop le.' => invalidLoginIdentifier,
      'Mat khau chua hop le.' => invalidPassword,
      'Khong the dang nhap voi Google luc nay.' => _text(
        vi: raw,
        en: 'Google sign-in is unavailable right now.',
      ),
      'Khong the dang nhap bang so dien thoai hoac email.' => _text(
        vi: raw,
        en: 'Phone or email sign-in is unavailable right now.',
      ),
      'Khong tai duoc danh muc dich vu.' => _text(
        vi: raw,
        en: 'Unable to load service categories.',
      ),
      'Khong tai duoc danh sach tho.' => _text(
        vi: raw,
        en: 'Unable to load the worker list.',
      ),
      'Khong tim thay thong tin tho.' => _text(
        vi: raw,
        en: 'Unable to find worker details.',
      ),
      'Khong tai duoc danh sach tro chuyen.' => _text(
        vi: raw,
        en: 'Unable to load conversations.',
      ),
      'Khong tai duoc hoi tho.' => _text(
        vi: raw,
        en: 'Unable to load recent conversations.',
      ),
      'Khong tai duoc danh sach bai dang cong viec.' => _text(
        vi: raw,
        en: 'Unable to load work listings.',
      ),
      'Khong tai duoc thong tin ho so.' => _text(
        vi: raw,
        en: 'Unable to load profile information.',
      ),
      _ => raw,
    };
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['vi', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture(AppLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}

extension AppLocalizationsContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
