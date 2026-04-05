// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'generated_app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Alo Tho';

  @override
  String get splashTagline => 'Kết nối thợ nhanh chóng';

  @override
  String get splashLoadingLabel => 'Đang khởi động...';

  @override
  String get splashFooterLabel => 'Premium Service Marketplace';

  @override
  String get loginTitle => 'Chào mừng trở lại';

  @override
  String get loginDescription => 'Kết nối với những thợ giỏi nhất';

  @override
  String get loginIdentifierLabel => 'Số điện thoại hoặc email';

  @override
  String get loginIdentifierHint => 'Nhập thông tin của bạn';

  @override
  String get passwordLabel => 'Mật khẩu';

  @override
  String get passwordHint => '••••••••';

  @override
  String get processing => 'Đang xử lý...';

  @override
  String get signInWithCredentials => 'Đăng nhập';

  @override
  String get orLabel => 'Hoặc đăng nhập qua';

  @override
  String get signInWithGoogle => 'Google';

  @override
  String get continueWithFacebook => 'Facebook';

  @override
  String get forgotPassword => 'Quên mật khẩu?';

  @override
  String get forgotPasswordPlaceholder =>
      'Tạm thời đây là nút placeholder cho flow quên mật khẩu.';

  @override
  String get authActionPlaceholder =>
      'Tính năng này sẽ được nối backend ở bước sau.';

  @override
  String get noAccountPrompt => 'Bạn chưa có tài khoản?';

  @override
  String get registerNow => 'Đăng ký ngay';

  @override
  String get loginHelpTooltip => 'Trợ giúp';

  @override
  String get registerTitle => 'Tạo tài khoản';

  @override
  String get registerDescription =>
      'Bắt đầu kết nối với những người thợ phù hợp';

  @override
  String get registerFullNameLabel => 'Họ và tên';

  @override
  String get registerFullNameHint => 'Nhập họ tên của bạn';

  @override
  String get registerConfirmPasswordLabel => 'Nhập lại mật khẩu';

  @override
  String get registerConfirmPasswordHint => 'Nhập lại mật khẩu';

  @override
  String get createAccount => 'Tạo tài khoản';

  @override
  String get alreadyHaveAccountPrompt => 'Bạn đã có tài khoản?';

  @override
  String get backToLogin => 'Đăng nhập';

  @override
  String get registerPlaceholder =>
      'Đây là placeholder UI cho quy trình đăng ký.';

  @override
  String get loginBenefitTitle => 'Bạn xem được gì sau khi đăng nhập?';

  @override
  String get loginBenefitDescription =>
      'Tìm thợ theo nghề và khu vực, xem hội thoại gần đây, quản lý bài đăng về công việc của bạn và cập nhật hồ sơ thợ.';

  @override
  String get invalidLoginIdentifier => 'Số điện thoại hoặc email chưa hợp lệ.';

  @override
  String get invalidPassword => 'Mật khẩu chưa hợp lệ.';

  @override
  String get workerSearchNav => 'Tìm thợ';

  @override
  String get messagesNav => 'Tin nhắn';

  @override
  String get myWorkNav => 'Công việc';

  @override
  String get profileNav => 'Hồ sơ';

  @override
  String get workerSearchAppBar => 'Tìm thợ gần đây';

  @override
  String get workerSearchHeadline => 'Bạn cần sửa gì hôm nay?';

  @override
  String get workerSearchSubtitle =>
      'Chọn nghề, khu vực và xem thợ đang sẵn sàng nhận việc.';

  @override
  String get workerSearchHint => 'Tìm theo tên, nghề nghiệp, khu vực...';

  @override
  String get serviceCategoriesTitle => 'Danh mục dịch vụ';

  @override
  String get suggestedAreasTitle => 'Khu vực gợi ý';

  @override
  String get workerListTitle => 'Danh sách thợ';

  @override
  String matchingResults(int count) {
    return '$count kết quả phù hợp';
  }

  @override
  String get noMatchingWorkersTitle => 'Chưa có kết quả phù hợp';

  @override
  String get noMatchingWorkersDescription =>
      'Thử đổi từ khóa hoặc bộ lọc danh mục để xem thêm thợ.';

  @override
  String get details => 'Chi tiết';

  @override
  String ageAndProfession(int age, String profession) {
    return '$age tuổi • $profession';
  }

  @override
  String yearsExperienceShort(int years) {
    return '$years năm KN';
  }

  @override
  String yearsExperienceLong(int years) {
    return '$years năm kinh nghiệm';
  }

  @override
  String ratingLabel(double rating) {
    return '$rating sao';
  }

  @override
  String completedJobsLabel(int count) {
    return '$count công việc';
  }

  @override
  String completedRepairsLabel(int count) {
    return '$count lượt sửa';
  }

  @override
  String distanceLabel(double distanceKm) {
    return '$distanceKm km';
  }

  @override
  String get workerDetailTitle => 'Chi tiết thợ';

  @override
  String contactNowWithPrice(String price) {
    return 'Liên hệ ngay • $price';
  }

  @override
  String get workerContactPlaceholder =>
      'Bạn có thể gắn màn chat hoặc tạo yêu cầu sửa chữa ở bước sau.';

  @override
  String get messagesAppBar => 'Tin nhắn';

  @override
  String get recentConversationsTitle => 'Hội thoại gần đây';

  @override
  String get recentConversationsSubtitle =>
      'Tìm nhanh cuộc trò chuyện và lọc theo trạng thái đọc.';

  @override
  String get messageSearchHint => 'Tìm theo tên thợ, nghề, nội dung...';

  @override
  String get unreadOnly => 'Chưa đọc';

  @override
  String get latestFirst => 'Mới nhất';

  @override
  String get oldestFirst => 'Cũ nhất';

  @override
  String get conversationListTitle => 'Danh sách trò chuyện';

  @override
  String conversationsCount(int count) {
    return '$count cuộc trò chuyện';
  }

  @override
  String get noMatchingConversationsTitle => 'Không có cuộc trò chuyện phù hợp';

  @override
  String get noMatchingConversationsDescription =>
      'Thử đổi bộ lọc hoặc tìm bằng từ khóa khác.';

  @override
  String get readyWorkersTitle => 'Thợ đang sẵn sàng nhận việc';

  @override
  String get readyWorkersSubtitle => 'Gợi ý thêm để bạn mở rộng liên hệ nhanh.';

  @override
  String get myWorkAppBar => 'Việc của tôi';

  @override
  String get myWorkHeadline => 'Bài đăng đang hiển thị';

  @override
  String get myWorkSubtitle =>
      'Theo dõi các bài viết về mình đang xuất hiện trong từng danh mục.';

  @override
  String viewsCount(int count) {
    return '$count lượt xem';
  }

  @override
  String contactCount(int count) {
    return '$count liên hệ';
  }

  @override
  String updatedAtLabel(String value) {
    return 'Cập nhật lần cuối: $value';
  }

  @override
  String get profileAppBar => 'Hồ sơ';

  @override
  String get profileHeadline => 'Tài khoản và hồ sơ thợ';

  @override
  String get profileSubtitle =>
      'Quản lý thông tin cá nhân, năng lực và trạng thái xác thực.';

  @override
  String get accountInfoTitle => 'Thông tin tài khoản';

  @override
  String get workerProfileTitle => 'Hồ sơ thợ';

  @override
  String get noWorkerProfile => 'Bạn chưa tạo hồ sơ thợ.';

  @override
  String get kycTitle => 'KYC';

  @override
  String get kycApproved => 'Hồ sơ KYC đã được duyệt.';

  @override
  String get kycPending => 'Hồ sơ KYC đang chờ duyệt.';

  @override
  String get kycNotSubmitted => 'Bạn chưa gửi hồ sơ KYC.';

  @override
  String get viewKyc => 'Xem KYC';

  @override
  String get kycPlaceholder => 'Đây là placeholder UI cho quy trình KYC.';

  @override
  String get preferencesTitle => 'Tùy chọn';

  @override
  String get themeModeLabel => 'Đổi theme sáng/tối';

  @override
  String get languageLabel => 'Ngôn ngữ';

  @override
  String get languageDescription => 'Ứng dụng hỗ trợ tiếng Việt và tiếng Anh.';

  @override
  String get vietnameseLabel => 'Tiếng Việt';

  @override
  String get englishLabel => 'English';

  @override
  String get signOut => 'Đăng xuất';

  @override
  String get retry => 'Thử lại';

  @override
  String get categoryElectrical => 'Điện';

  @override
  String get categoryPlumbing => 'Nước';

  @override
  String get categoryCoolingHvac => 'Điện lạnh';

  @override
  String get categoryHomeAppliances => 'Đồ gia dụng';

  @override
  String get categoryPaintingRepair => 'Sơn sửa';

  @override
  String get professionResidentialElectrician => 'Thợ điện dân dụng';

  @override
  String get professionFastResponsePlumber => 'Thợ nước nhanh gọn';

  @override
  String get professionHvacTechnician => 'Thợ điện lạnh';

  @override
  String get professionHomeApplianceTechnician => 'Thợ đồ gia dụng';

  @override
  String get professionFinishingPainter => 'Thợ sơn hoàn thiện';

  @override
  String get professionConcealedPipePlumber => 'Thợ ống nước âm tường';

  @override
  String get professionInverterAcCleaner => 'Thợ vệ sinh máy lạnh inverter';

  @override
  String get professionMultiSkilledTechnician => 'Thợ đa năng';

  @override
  String get workerBioElectrical =>
      'Chuyên chạm chích, aptomat, dây nguồn và thiết bị điện trong nhà.';

  @override
  String get workerBioPlumbing =>
      'Xử lý rò rỉ, thông bồn rửa, lắp đặt thiết bị vệ sinh.';

  @override
  String get workerBioHvac =>
      'Vệ sinh máy lạnh, bơm ga, sửa tủ lạnh và máy giặt inverter.';

  @override
  String get workerBioAppliance =>
      'Sửa bếp từ, máy nước nóng, lò vi sóng và máy hút mùi.';

  @override
  String get workerBioPainting =>
      'Sơn tường nội thất, xử lý bong tróc và thấm ẩm nhanh sạch.';

  @override
  String get workerBioConcealedPipe =>
      'Chuyên tìm điểm rò ngầm, thay ống âm tường và chống thấm WC.';

  @override
  String get workerBioAcCleaning =>
      'Vệ sinh định kỳ, kiểm tra yếu lạnh và cân chỉnh bộ nóng lạnh.';

  @override
  String get workerBioGeneralAppliance =>
      'Nhận các công việc sửa đồ gia dụng và hỗ trợ lắp đặt cơ bản.';

  @override
  String get priceFrom150 => 'Từ 150.000đ';

  @override
  String get priceFrom180 => 'Từ 180.000đ';

  @override
  String get priceFrom200 => 'Từ 200.000đ';

  @override
  String get priceFrom220 => 'Từ 220.000đ';

  @override
  String get priceFrom250 => 'Từ 250.000đ';

  @override
  String get priceFrom280 => 'Từ 280.000đ';

  @override
  String get priceQuotedAfterInspection => 'Báo giá theo hiện trạng';

  @override
  String get priceQuotedPerService => 'Báo giá theo dịch vụ';

  @override
  String get workListingTitleHvacDistrict7 =>
      'Thợ điện lạnh có mặt nhanh tại Quận 7';

  @override
  String get workListingTitleSameDayPlumbing =>
      'Nhận sửa rò rỉ nước, thông bồn rửa trong ngày';

  @override
  String get workListingTitleApplianceRepair =>
      'Sửa bếp từ, máy nước nóng tận nơi';

  @override
  String get workListingTitlePainting =>
      'Nhận sơn lại căn hộ, xử lý tường ẩm mốc';

  @override
  String get visiblePlacementTopSuggestions => 'Top gợi ý theo khu vực';

  @override
  String get visiblePlacementPlumbingCategory => 'Danh mục Nước';

  @override
  String get visiblePlacementApplianceCategory => 'Danh mục Gia dụng';

  @override
  String get listingStatusPerformingWell => 'Đang hiển thị tốt';

  @override
  String get listingStatusStable => 'Ổn định';

  @override
  String get listingStatusNeedsEngagement => 'Cần tăng tương tác';

  @override
  String get chatMessageInspectOutlet =>
      'Em có thể qua kiểm tra ổ cắm cho mình lúc 19:00.';

  @override
  String get chatMessageSentQuote =>
      'Anh đã gửi báo giá và thời gian qua nhà ngày mai.';

  @override
  String get chatMessageNeedMorePipePhotos =>
      'Mình chụp thêm hiện trạng đường ống giúp em nhé.';

  @override
  String get chatMessageNeedPressureCheck =>
      'Phần rò ngầm này em cần ghé đo áp lực nước trước khi báo giá.';

  @override
  String get chatMessageSlot1630 =>
      'Chiều nay em có slot 16:30, mình xác nhận để em mang đúng linh kiện.';

  @override
  String get failureGoogleUnavailable =>
      'Không thể đăng nhập với Google lúc này.';

  @override
  String get failureCredentialsUnavailable =>
      'Không thể đăng nhập bằng số điện thoại hoặc email.';

  @override
  String get failureLoadCategories => 'Không tải được danh mục dịch vụ.';

  @override
  String get failureLoadWorkers => 'Không tải được danh sách thợ.';

  @override
  String get failureLoadWorkerDetails => 'Không tìm thấy thông tin thợ.';

  @override
  String get failureLoadConversations => 'Không tải được danh sách trò chuyện.';

  @override
  String get failureLoadRecentConversations => 'Không tải được hội thoại.';

  @override
  String get failureLoadWorkListings =>
      'Không tải được danh sách bài đăng công việc.';

  @override
  String get failureLoadProfile => 'Không tải được thông tin hồ sơ.';

  @override
  String get workerNameLeVanKhoa => 'Lê Văn Khoa';

  @override
  String get workerNamePhamQuocBao => 'Phạm Quốc Bảo';

  @override
  String get workerNameDoDucHai => 'Đỗ Đức Hải';

  @override
  String get workerNameNguyenAnhTuan => 'Nguyễn Anh Tuấn';

  @override
  String get workerNameVoMinhTri => 'Võ Minh Trí';

  @override
  String get workerNameTranHuuDat => 'Trần Hữu Đạt';

  @override
  String get workerNameNguyenQuocViet => 'Nguyễn Quốc Việt';

  @override
  String get workerShortNameLeVanKhoa => 'Văn Khoa';

  @override
  String get workerShortNamePhamQuocBao => 'Quốc Bảo';

  @override
  String get workerShortNameDoDucHai => 'Đức Hải';

  @override
  String get workerShortNameNguyenAnhTuan => 'Anh Tuấn';

  @override
  String get workerShortNameVoMinhTri => 'Minh Trí';

  @override
  String get workerShortNameTranHuuDat => 'Hữu Đạt';

  @override
  String get workerShortNameNguyenQuocViet => 'Quốc Việt';

  @override
  String get areaDistrict7 => 'Quận 7';

  @override
  String get areaNhaBe => 'Nhà Bè';

  @override
  String get areaThuDuc => 'Thủ Đức';

  @override
  String get areaBinhThanh => 'Bình Thạnh';

  @override
  String get areaDistrict4 => 'Quận 4';

  @override
  String get areaGoVap => 'Gò Vấp';

  @override
  String get areaTanBinh => 'Tân Bình';

  @override
  String get workerDetailServicesAndPricing => 'Dịch vụ & chi phí';

  @override
  String get workerDetailActivityArea => 'Khu vực hoạt động';

  @override
  String get workerDetailPortfolio => 'Hình ảnh thi công';

  @override
  String get workerDetailSeeAll => 'Xem tất cả';

  @override
  String get workerDetailReviewsTitle => 'Đánh giá từ khách hàng';

  @override
  String workerDetailReviewCount(int count) {
    return '($count đánh giá)';
  }

  @override
  String get workerDetailExperienceLabel => 'Kinh nghiệm';

  @override
  String workerDetailExperienceValue(int years) {
    return '$years năm';
  }

  @override
  String get workerDetailJobsLabel => 'Công việc';

  @override
  String workerDetailLocationLabel(String area) {
    return '$area, TP. HCM';
  }

  @override
  String workerDetailExtraPortfolio(int count) {
    return '+$count';
  }

  @override
  String get workerDetailUnavailableMessage =>
      'Không thể hiển thị chi tiết thợ lúc này.';

  @override
  String get workerDetailServiceElectricalRepair => 'Sửa điện';

  @override
  String get workerDetailServiceBreaker => 'Aptomat';

  @override
  String get workerDetailServiceOutlet => 'Ổ cắm';

  @override
  String get workerDetailServiceCeilingLight => 'Đèn trần';

  @override
  String get workerDetailServicePipeRepair => 'Ống nước';

  @override
  String get workerDetailServiceSink => 'Bồn rửa';

  @override
  String get workerDetailServicePump => 'Máy bơm';

  @override
  String get workerDetailServiceLeakFix => 'Chống rò rỉ';

  @override
  String get workerDetailServiceWashingMachine => 'Sửa máy giặt';

  @override
  String get workerDetailServiceRefrigerator => 'Tủ lạnh';

  @override
  String get workerDetailServiceAirConditioner => 'Điều hòa';

  @override
  String get workerDetailServiceMicrowave => 'Lò vi sóng';

  @override
  String get workerDetailServiceInductionCooker => 'Bếp từ';

  @override
  String get workerDetailServiceWaterHeater => 'Máy nước nóng';

  @override
  String get workerDetailServiceRangeHood => 'Máy hút mùi';

  @override
  String get workerDetailServiceWallPainting => 'Sơn tường';

  @override
  String get workerDetailServiceCrackFilling => 'Trám nứt';

  @override
  String get workerDetailServiceWaterproofing => 'Chống thấm';

  @override
  String get workerDetailServiceFinishing => 'Hoàn thiện';

  @override
  String get workerDetailServiceHomeRepair => 'Sửa chữa tại nhà';

  @override
  String get workerDetailServiceInspection => 'Khảo sát';

  @override
  String get workerDetailServiceQuotation => 'Báo giá';

  @override
  String get workerDetailServiceFastSupport => 'Hỗ trợ nhanh';

  @override
  String get reviewAuthorMinhHoang => 'Minh Hoàng';

  @override
  String get reviewAuthorThanhHuong => 'Thanh Hương';

  @override
  String get reviewTimeTwoDaysAgo => '2 ngày trước';

  @override
  String get reviewTimeOneWeekAgo => '1 tuần trước';

  @override
  String get reviewContentOne =>
      'Anh Tuấn làm việc rất chuyên nghiệp, đúng giờ và giải thích kỹ vấn đề của máy giặt. Giá cả minh bạch. Rất hài lòng!';

  @override
  String get reviewContentTwo =>
      'Sửa điều hòa rất nhanh, dọn dẹp sạch sẽ sau khi làm xong. Sẽ tiếp tục ủng hộ anh.';
}
