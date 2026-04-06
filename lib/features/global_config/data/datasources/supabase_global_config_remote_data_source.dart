import 'package:alo_tho/features/auth/data/datasources/supabase_auth_remote_data_source.dart';
import 'package:alo_tho/features/global_config/data/models/global_config_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final globalConfigRemoteDataSourceProvider =
    Provider<SupabaseGlobalConfigRemoteDataSource>(
      (ref) => SupabaseGlobalConfigRemoteDataSource(
        ref.watch(supabaseClientProvider),
      ),
    );

class SupabaseGlobalConfigRemoteDataSource {
  const SupabaseGlobalConfigRemoteDataSource(this._client);

  final supabase.SupabaseClient _client;

  Future<GlobalConfigModel?> getGlobalConfig() async {
    final response = await _client
        .from('global_configs')
        .select()
        .eq('is_active', true)
        .order('updated_at', ascending: false)
        .limit(1)
        .maybeSingle();

    if (response == null) {
      return null;
    }

    return GlobalConfigModel.fromJson(Map<String, dynamic>.from(response));
  }
}
