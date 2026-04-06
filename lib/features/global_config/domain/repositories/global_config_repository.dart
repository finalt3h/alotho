import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/global_config/domain/entities/global_config.dart';

abstract interface class GlobalConfigRepository {
  Future<Result<GlobalConfig?>> getGlobalConfig();
}
