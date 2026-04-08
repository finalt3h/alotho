import '../../../../core/l10n/app_localizations.dart';

class AppVersionInfo {
  const AppVersionInfo({required this.version, required this.buildNumber});

  final String version;
  final String buildNumber;

  String get fullVersion {
    if (buildNumber.trim().isEmpty) {
      return version;
    }
    return '$version+$buildNumber';
  }
}
