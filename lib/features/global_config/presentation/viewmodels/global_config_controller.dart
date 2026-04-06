import 'package:alo_tho/features/global_config/data/repositories/supabase_global_config_repository.dart';
import 'package:alo_tho/features/global_config/presentation/viewmodels/global_config_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalConfigControllerProvider =
    NotifierProvider<GlobalConfigController, GlobalConfigState>(
      GlobalConfigController.new,
    );

class GlobalConfigController extends Notifier<GlobalConfigState> {
  bool _didBootstrap = false;

  @override
  GlobalConfigState build() {
    if (!_didBootstrap) {
      _didBootstrap = true;
      Future<void>.microtask(refresh);
    }

    return const GlobalConfigState();
  }

  Future<void> refresh() async {
    if (state.isLoading) {
      return;
    }

    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    final result = await ref
        .read(globalConfigRepositoryProvider)
        .getGlobalConfig();

    state = result.when(
      success: (config) => state.copyWith(
        isLoading: false,
        hasLoaded: true,
        config: config,
        clearErrorMessage: true,
      ),
      failure: (failure) => state.copyWith(
        isLoading: false,
        hasLoaded: true,
        errorMessage: failure.message,
      ),
    );
  }
}
