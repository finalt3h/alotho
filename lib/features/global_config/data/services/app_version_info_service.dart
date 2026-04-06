import 'package:alo_tho/features/global_config/domain/entities/app_version_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final appVersionInfoServiceProvider = Provider<AppVersionInfoService>(
  (ref) => const AppVersionInfoService(),
);

class AppVersionInfoService {
  const AppVersionInfoService();

  Future<AppVersionInfo> getCurrentVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return AppVersionInfo(
      version: packageInfo.version.trim(),
      buildNumber: packageInfo.buildNumber.trim(),
    );
  }
}
