import 'package:alo_tho/features/global_config/domain/entities/global_config.dart';

class GlobalConfigState {
  const GlobalConfigState({
    this.isLoading = false,
    this.hasLoaded = false,
    this.config,
    this.errorMessage,
  });

  final bool isLoading;
  final bool hasLoaded;
  final GlobalConfig? config;
  final String? errorMessage;

  GlobalConfigState copyWith({
    bool? isLoading,
    bool? hasLoaded,
    GlobalConfig? config,
    bool clearConfig = false,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return GlobalConfigState(
      isLoading: isLoading ?? this.isLoading,
      hasLoaded: hasLoaded ?? this.hasLoaded,
      config: clearConfig ? null : config ?? this.config,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }
}
