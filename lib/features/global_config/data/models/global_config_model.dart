import 'package:alo_tho/features/global_config/domain/entities/app_version_info.dart';
import 'package:alo_tho/features/global_config/domain/entities/global_config.dart';
import 'package:flutter/foundation.dart';

class GlobalConfigModel {
  const GlobalConfigModel({
    this.minimumAndroidVersion,
    this.latestAndroidVersion,
    this.androidStoreUrl,
    this.minimumIosVersion,
    this.latestIosVersion,
    this.iosStoreUrl,
    this.updateTitle,
    this.updateMessage,
    this.noticeId,
    this.noticeTitle,
    this.noticeMessage,
    this.isNoticeEnabled = false,
    this.isNoticeBlocking = false,
    this.updatedAt,
  });

  factory GlobalConfigModel.fromJson(Map<String, dynamic> json) {
    return GlobalConfigModel(
      minimumAndroidVersion: _readString(json, 'minimum_android_version'),
      latestAndroidVersion: _readString(json, 'latest_android_version'),
      androidStoreUrl: _readString(json, 'android_store_url'),
      minimumIosVersion: _readString(json, 'minimum_ios_version'),
      latestIosVersion: _readString(json, 'latest_ios_version'),
      iosStoreUrl: _readString(json, 'ios_store_url'),
      updateTitle: _readString(json, 'update_title'),
      updateMessage: _readString(json, 'update_message'),
      noticeId: _readString(json, 'notice_id'),
      noticeTitle: _readString(json, 'notice_title'),
      noticeMessage: _readString(json, 'notice_message'),
      isNoticeEnabled: json['notice_enabled'] as bool? ?? false,
      isNoticeBlocking: json['notice_blocking'] as bool? ?? false,
      updatedAt: _readDateTime(json, 'updated_at'),
    );
  }

  final String? minimumAndroidVersion;
  final String? latestAndroidVersion;
  final String? androidStoreUrl;
  final String? minimumIosVersion;
  final String? latestIosVersion;
  final String? iosStoreUrl;
  final String? updateTitle;
  final String? updateMessage;
  final String? noticeId;
  final String? noticeTitle;
  final String? noticeMessage;
  final bool isNoticeEnabled;
  final bool isNoticeBlocking;
  final DateTime? updatedAt;

  GlobalConfig toEntity({
    required AppVersionInfo appVersionInfo,
    required TargetPlatform platform,
  }) {
    return GlobalConfig(
      appVersionInfo: appVersionInfo,
      platform: platform,
      minimumSupportedVersion: switch (platform) {
        TargetPlatform.android => minimumAndroidVersion,
        TargetPlatform.iOS => minimumIosVersion,
        _ => null,
      },
      latestAvailableVersion: switch (platform) {
        TargetPlatform.android => latestAndroidVersion,
        TargetPlatform.iOS => latestIosVersion,
        _ => null,
      },
      storeUrl: switch (platform) {
        TargetPlatform.android => androidStoreUrl,
        TargetPlatform.iOS => iosStoreUrl,
        _ => null,
      },
      updateTitle: updateTitle,
      updateMessage: updateMessage,
      noticeId: noticeId,
      noticeTitle: noticeTitle,
      noticeMessage: noticeMessage,
      isNoticeEnabled: isNoticeEnabled,
      isNoticeBlocking: isNoticeBlocking,
      updatedAt: updatedAt,
    );
  }

  static String? _readString(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value is String && value.trim().isNotEmpty) {
      return value.trim();
    }

    return null;
  }

  static DateTime? _readDateTime(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value is! String || value.trim().isEmpty) {
      return null;
    }

    return DateTime.tryParse(value);
  }
}
