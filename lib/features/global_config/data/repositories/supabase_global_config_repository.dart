import 'package:alo_tho/core/errors/failure.dart';
import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/global_config/data/datasources/supabase_global_config_remote_data_source.dart';
import 'package:alo_tho/features/global_config/data/services/app_version_info_service.dart';
import 'package:alo_tho/features/global_config/domain/entities/global_config.dart';
import 'package:alo_tho/features/global_config/domain/repositories/global_config_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final globalConfigRepositoryProvider = Provider<GlobalConfigRepository>((ref) {
  return SupabaseGlobalConfigRepository(
    ref.watch(globalConfigRemoteDataSourceProvider),
    ref.watch(appVersionInfoServiceProvider),
  );
});

class SupabaseGlobalConfigRepository implements GlobalConfigRepository {
  const SupabaseGlobalConfigRepository(
    this._remoteDataSource,
    this._appVersionInfoService,
  );

  final SupabaseGlobalConfigRemoteDataSource _remoteDataSource;
  final AppVersionInfoService _appVersionInfoService;

  @override
  Future<Result<GlobalConfig?>> getGlobalConfig() async {
    try {
      final versionInfo = await _appVersionInfoService.getCurrentVersion();
      final model = await _remoteDataSource.getGlobalConfig();
      if (model == null) {
        return const Success<GlobalConfig?>(null);
      }

      return Success(
        model.toEntity(
          appVersionInfo: versionInfo,
          platform: defaultTargetPlatform,
        ),
      );
    } on supabase.PostgrestException catch (error) {
      return Error(Failure(_mapPostgrestError(error), code: error.code));
    } catch (_) {
      return const Error(Failure('Khong the tai cau hinh ung dung luc nay.'));
    }
  }

  String _mapPostgrestError(supabase.PostgrestException error) {
    final message = error.message.trim();
    if (message.isEmpty) {
      return 'Khong the tai cau hinh ung dung luc nay.';
    }

    return message;
  }
}
