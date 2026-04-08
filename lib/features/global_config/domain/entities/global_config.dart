import 'package:alo_tho/core/utils/app_version_comparator.dart';
import 'package:alo_tho/features/global_config/domain/entities/app_version_info.dart';
import 'package:flutter/foundation.dart';

class GlobalConfig {
  const GlobalConfig({
    required this.appVersionInfo,
    required this.platform,
    this.minimumSupportedVersion,
    this.latestAvailableVersion,
    this.storeUrl,
    this.updateTitle,
    this.updateMessage,
    this.noticeId,
    this.noticeTitle,
    this.noticeMessage,
    this.isNoticeEnabled = false,
    this.isNoticeBlocking = false,
    this.updatedAt,
  });

  final AppVersionInfo appVersionInfo;
  final TargetPlatform platform;
  final String? minimumSupportedVersion;
  final String? latestAvailableVersion;
  final String? storeUrl;
  final String? updateTitle;
  final String? updateMessage;
  final String? noticeId;
  final String? noticeTitle;
  final String? noticeMessage;
  final bool isNoticeEnabled;
  final bool isNoticeBlocking;
  final DateTime? updatedAt;

  bool get requiresForceUpdate {
    final minVersion = minimumSupportedVersion?.trim();
    if (minVersion == null || minVersion.isEmpty) {
      return false;
    }

    return AppVersionComparator.compare(appVersionInfo.version, minVersion) < 0;
  }

  bool get hasRecommendedUpdate {
    final latestVersion = latestAvailableVersion?.trim();
    if (latestVersion == null || latestVersion.isEmpty) {
      return false;
    }

    return AppVersionComparator.compare(appVersionInfo.version, latestVersion) <
        0;
  }

  bool get hasImportantNotice {
    return isNoticeEnabled && (noticeMessage?.trim().isNotEmpty ?? false);
  }

  String get updatePresentationKey {
    return [
      appVersionInfo.fullVersion,
      minimumSupportedVersion ?? '',
      latestAvailableVersion ?? '',
      storeUrl ?? '',
    ].join('|');
  }

  String get noticePresentationKey {
    return [
      noticeId ?? '',
      noticeTitle ?? '',
      noticeMessage ?? '',
      isNoticeBlocking.toString(),
    ].join('|');
  }
}
