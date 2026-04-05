import 'package:flutter/widgets.dart';

import 'generated/generated_app_localizations.dart';

export 'generated/generated_app_localizations.dart';

extension AppLocalizationsContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension AppLocalizationsHelpers on AppLocalizations {
  String categoryName(String raw) {
    return switch (raw) {
      'Dien' => categoryElectrical,
      'Nuoc' => categoryPlumbing,
      'Dien lanh' => categoryCoolingHvac,
      'Do gia dung' => categoryHomeAppliances,
      'Son sua' => categoryPaintingRepair,
      _ => raw,
    };
  }

  String workerProfession(String raw) {
    return switch (raw) {
      'Tho dien dan dung' => professionResidentialElectrician,
      'Tho nuoc nhanh gon' => professionFastResponsePlumber,
      'Tho dien lanh' => professionHvacTechnician,
      'Tho do gia dung' => professionHomeApplianceTechnician,
      'Tho son hoan thien' => professionFinishingPainter,
      'Tho ong nuoc am tuong' => professionConcealedPipePlumber,
      'Tho ve sinh may lanh inverter' => professionInverterAcCleaner,
      'Tho da nang' => professionMultiSkilledTechnician,
      _ => raw,
    };
  }

  String workerBio(String raw) {
    return switch (raw) {
      'Chuyen cham chich, aptomat, day nguon va thiet bi dien trong nha.' =>
        workerBioElectrical,
      'Xu ly ro ri, thong bon rua, lap dat thiet bi ve sinh.' =>
        workerBioPlumbing,
      'Ve sinh may lanh, bom ga, sua tu lanh va may giat inverter.' =>
        workerBioHvac,
      'Sua bep tu, may nuoc nong, lo vi song va may hut mui.' =>
        workerBioAppliance,
      'Son tuong noi that, xu ly bong troc va tham am nhanh sach.' =>
        workerBioPainting,
      'Chuyen tim diem ro ngam, thay ong am tuong va chong tham wc.' =>
        workerBioConcealedPipe,
      'Ve sinh dinh ky, kiem tra yeu lanh va can chinh bo nong lanh.' =>
        workerBioAcCleaning,
      'Nhan cac cong viec sua do gia dung va ho tro lap dat co ban.' =>
        workerBioGeneralAppliance,
      _ => raw,
    };
  }

  String priceDescription(String raw) {
    return switch (raw) {
      'Tu 150.000d' => priceFrom150,
      'Tu 180.000d' => priceFrom180,
      'Tu 200.000d' => priceFrom200,
      'Tu 220.000d' => priceFrom220,
      'Tu 250.000d' => priceFrom250,
      'Tu 280.000d' => priceFrom280,
      'Bao gia theo hien trang' => priceQuotedAfterInspection,
      'Bao gia theo dich vu' => priceQuotedPerService,
      _ => raw,
    };
  }

  String workListingTitle(String raw) {
    return switch (raw) {
      'Tho dien lanh co mat nhanh tai Quan 7' => workListingTitleHvacDistrict7,
      'Nhan sua ro ri nuoc, thong bon rua trong ngay' =>
        workListingTitleSameDayPlumbing,
      'Sua bep tu, may nuoc nong tan noi' => workListingTitleApplianceRepair,
      'Nhan son lai can ho, xu ly tuong am moc' => workListingTitlePainting,
      _ => raw,
    };
  }

  String visiblePlacement(String raw) {
    return switch (raw) {
      'Top goi y theo khu vuc' => visiblePlacementTopSuggestions,
      'Danh muc Nuoc' => visiblePlacementPlumbingCategory,
      'Danh muc Gia dung' => visiblePlacementApplianceCategory,
      _ => raw,
    };
  }

  String listingStatus(String raw) {
    return switch (raw) {
      'Dang hien thi tot' => listingStatusPerformingWell,
      'On dinh' => listingStatusStable,
      'Can tang tuong tac' => listingStatusNeedsEngagement,
      _ => raw,
    };
  }

  String chatMessage(String raw) {
    return switch (raw) {
      'Em co the qua kiem tra o cam cho minh luc 19:00.' =>
        chatMessageInspectOutlet,
      'Anh da gui bao gia va thoi gian qua nha ngay mai.' =>
        chatMessageSentQuote,
      'Minh chup them hien trang duong ong giup em nhe.' =>
        chatMessageNeedMorePipePhotos,
      'Phan ro ngam nay em can ghé do ap luc nuoc trước khi bao gia.' =>
        chatMessageNeedPressureCheck,
      'Chieu nay em co slot 16:30, minh xac nhan de em mang dung linh kien.' =>
        chatMessageSlot1630,
      _ => raw,
    };
  }

  String localizeFailureMessage(String raw) {
    return switch (raw) {
      'So dien thoai hoac email chua hop le.' => invalidLoginIdentifier,
      'Email chua hop le.' => invalidRegisterEmail,
      'So dien thoai chua hop le.' => invalidRegisterPhone,
      'Ho ten chua hop le.' => invalidFullName,
      'Mat khau chua hop le.' => invalidPassword,
      'Mat khau xac nhan khong khop.' => confirmPasswordMismatch,
      'Tai khoan chua kich hoat. Vui long nhap OTP de kich hoat.' =>
        activationOtpRequired,
      'Ma OTP chua hop le.' => invalidOtp,
      'Ma OTP da het han hoac khong hop le.' => invalidOtp,
      'Xac thuc OTP khong thanh cong.' => failureOtpVerification,
      'Khong the gui lai ma OTP luc nay.' => failureResendOtp,
      'Da gui lai ma OTP.' => resendOtpSuccess,
      'Khong the tao tai khoan luc nay.' => failureRegisterUnavailable,
      'Tai khoan da ton tai.' => failureAccountAlreadyExists,
      'Khong the dang nhap voi Google luc nay.' => failureGoogleUnavailable,
      'Khong the dang nhap bang so dien thoai hoac email.' =>
        failureCredentialsUnavailable,
      'Khong tai duoc danh muc dich vu.' => failureLoadCategories,
      'Khong tai duoc danh sach tho.' => failureLoadWorkers,
      'Khong tim thay thong tin tho.' => failureLoadWorkerDetails,
      'Khong tai duoc danh sach tro chuyen.' => failureLoadConversations,
      'Khong tai duoc hoi tho.' => failureLoadRecentConversations,
      'Khong tai duoc danh sach bai dang cong viec.' => failureLoadWorkListings,
      'Khong tai duoc thong tin ho so.' => failureLoadProfile,
      'Khong the dang xuat luc nay.' => failureSignOut,
      _ => raw,
    };
  }

  String workerDisplayName(String raw) {
    return switch (raw) {
      'Le Van Khoa' => workerNameLeVanKhoa,
      'Pham Quoc Bao' => workerNamePhamQuocBao,
      'Do Duc Hai' => workerNameDoDucHai,
      'Nguyen Anh Tuan' => workerNameNguyenAnhTuan,
      'Vo Minh Tri' => workerNameVoMinhTri,
      'Tran Huu Dat' => workerNameTranHuuDat,
      'Nguyen Quoc Viet' => workerNameNguyenQuocViet,
      _ => raw,
    };
  }

  String workerShortName(String raw) {
    return switch (raw) {
      'Le Van Khoa' => workerShortNameLeVanKhoa,
      'Pham Quoc Bao' => workerShortNamePhamQuocBao,
      'Do Duc Hai' => workerShortNameDoDucHai,
      'Nguyen Anh Tuan' => workerShortNameNguyenAnhTuan,
      'Vo Minh Tri' => workerShortNameVoMinhTri,
      'Tran Huu Dat' => workerShortNameTranHuuDat,
      'Nguyen Quoc Viet' => workerShortNameNguyenQuocViet,
      _ => raw,
    };
  }

  String areaName(String raw) {
    return switch (raw) {
      'Quan 7' => areaDistrict7,
      'Nha Be' => areaNhaBe,
      'Thu Duc' => areaThuDuc,
      'Binh Thanh' => areaBinhThanh,
      'Quan 4' => areaDistrict4,
      'Go Vap' => areaGoVap,
      'Tan Binh' => areaTanBinh,
      _ => raw,
    };
  }

  String workerDetailLocationForArea(String rawArea) {
    return workerDetailLocationLabel(areaName(rawArea));
  }

  List<String> workerDetailServiceLabels(String categoryId) {
    return switch (categoryId) {
      'electric' => [
        workerDetailServiceElectricalRepair,
        workerDetailServiceBreaker,
        workerDetailServiceOutlet,
        workerDetailServiceCeilingLight,
      ],
      'water' => [
        workerDetailServicePipeRepair,
        workerDetailServiceSink,
        workerDetailServicePump,
        workerDetailServiceLeakFix,
      ],
      'aircon' => [
        workerDetailServiceWashingMachine,
        workerDetailServiceRefrigerator,
        workerDetailServiceAirConditioner,
        workerDetailServiceMicrowave,
      ],
      'appliance' => [
        workerDetailServiceInductionCooker,
        workerDetailServiceWaterHeater,
        workerDetailServiceMicrowave,
        workerDetailServiceRangeHood,
      ],
      'painting' => [
        workerDetailServiceWallPainting,
        workerDetailServiceCrackFilling,
        workerDetailServiceWaterproofing,
        workerDetailServiceFinishing,
      ],
      _ => [
        workerDetailServiceHomeRepair,
        workerDetailServiceInspection,
        workerDetailServiceQuotation,
        workerDetailServiceFastSupport,
      ],
    };
  }
}
