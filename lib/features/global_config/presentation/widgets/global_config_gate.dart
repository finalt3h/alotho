import 'dart:async';

import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/widgets/app_status_dialog.dart';
import 'package:alo_tho/features/global_config/domain/entities/global_config.dart';
import 'package:alo_tho/features/global_config/presentation/viewmodels/global_config_controller.dart';
import 'package:alo_tho/features/global_config/presentation/viewmodels/global_config_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class GlobalConfigGate extends ConsumerStatefulWidget {
  const GlobalConfigGate({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<GlobalConfigGate> createState() => _GlobalConfigGateState();
}

class _GlobalConfigGateState extends ConsumerState<GlobalConfigGate>
    with WidgetsBindingObserver {
  String? _lastNoticeKey;
  String? _lastUpdateKey;
  bool _isShowingDialog = false;
  bool _isShowingBlockingDialog = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(ref.read(globalConfigControllerProvider.notifier).refresh());
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(globalConfigControllerProvider, (previous, next) {
      unawaited(_handleState(next));
    });

    return widget.child;
  }

  Future<void> _handleState(GlobalConfigState state) async {
    if (!mounted) {
      return;
    }

    final config = state.config;
    if (config == null) {
      return;
    }

    if (config.requiresForceUpdate) {
      await _showForceUpdateDialog(config);
      return;
    }

    if (config.hasImportantNotice) {
      final noticeKey = config.noticePresentationKey;
      if (_lastNoticeKey == noticeKey) {
        return;
      }

      _lastNoticeKey = noticeKey;
      await _showImportantNotice(config);
      return;
    }

    if (config.hasRecommendedUpdate) {
      final updateKey = config.updatePresentationKey;
      if (_lastUpdateKey == updateKey) {
        return;
      }

      _lastUpdateKey = updateKey;
      await _showRecommendedUpdate(config);
    }
  }

  Future<void> _showForceUpdateDialog(GlobalConfig config) async {
    if (_isShowingBlockingDialog || !mounted) {
      return;
    }

    final l10n = context.l10n;
    _isShowingBlockingDialog = true;

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return PopScope(
          canPop: false,
          child: AppStatusDialog(
            state: AppStatusDialogState.alert,
            title: _resolvedUpdateTitle(l10n, config),
            message: _resolvedUpdateMessage(l10n, config),
            positiveText: l10n.updateAction,
            onPositivePressed: () {
              unawaited(
                _openUpdateLink(
                  config.storeUrl,
                  dialogContext,
                  shouldCloseCurrentDialog: true,
                ),
              );
            },
          ),
        );
      },
    );

    _isShowingBlockingDialog = false;
  }

  Future<void> _showImportantNotice(GlobalConfig config) async {
    if (_isShowingDialog || !mounted) {
      return;
    }

    final l10n = context.l10n;
    _isShowingDialog = true;

    await showAppStatusDialog(
      context: context,
      state: AppStatusDialogState.alert,
      title: _resolvedNoticeTitle(l10n, config),
      message: config.noticeMessage!.trim(),
      barrierDismissible: !config.isNoticeBlocking,
      positiveText: l10n.understoodAction,
    );

    _isShowingDialog = false;
  }

  Future<void> _showRecommendedUpdate(GlobalConfig config) async {
    if (_isShowingDialog || !mounted) {
      return;
    }

    final l10n = context.l10n;
    _isShowingDialog = true;

    await showAppStatusDialog(
      context: context,
      state: AppStatusDialogState.alert,
      title: _resolvedUpdateTitle(l10n, config),
      message: _resolvedUpdateMessage(l10n, config),
      barrierDismissible: true,
      positiveText: l10n.updateAction,
      onPositivePressed: () {
        unawaited(_openUpdateLink(config.storeUrl, context));
      },
    );

    _isShowingDialog = false;
  }

  Future<void> _openUpdateLink(
    String? url,
    BuildContext dialogContext, {
    bool shouldCloseCurrentDialog = false,
  }) async {
    final trimmedUrl = url?.trim();
    final l10n = context.l10n;

    if (trimmedUrl == null || trimmedUrl.isEmpty) {
      if (!mounted) {
        return;
      }

      if (shouldCloseCurrentDialog && dialogContext.mounted) {
        Navigator.of(dialogContext, rootNavigator: true).pop();
      }
      await showAppStatusDialog(
        context: context,
        state: AppStatusDialogState.error,
        title: l10n.updateUnavailableTitle,
        message: l10n.updateLinkMissingMessage,
      );
      return;
    }

    final uri = Uri.tryParse(trimmedUrl);
    if (uri == null ||
        !await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) {
        return;
      }

      if (shouldCloseCurrentDialog && dialogContext.mounted) {
        Navigator.of(dialogContext, rootNavigator: true).pop();
      }
      await showAppStatusDialog(
        context: context,
        state: AppStatusDialogState.error,
        title: l10n.updateUnavailableTitle,
        message: l10n.updateLinkOpenFailedMessage,
      );
    }
  }

  String _resolvedUpdateTitle(AppLocalizations l10n, GlobalConfig config) {
    final title = config.updateTitle?.trim();
    if (title != null && title.isNotEmpty) {
      return title;
    }

    return config.requiresForceUpdate
        ? l10n.globalConfigForceUpdateTitle
        : l10n.globalConfigRecommendedUpdateTitle;
  }

  String _resolvedUpdateMessage(AppLocalizations l10n, GlobalConfig config) {
    final message = config.updateMessage?.trim();
    if (message != null && message.isNotEmpty) {
      return message;
    }

    return config.requiresForceUpdate
        ? l10n.globalConfigForceUpdateMessage
        : l10n.globalConfigRecommendedUpdateMessage;
  }

  String _resolvedNoticeTitle(AppLocalizations l10n, GlobalConfig config) {
    final title = config.noticeTitle?.trim();
    if (title != null && title.isNotEmpty) {
      return title;
    }

    return l10n.globalConfigImportantNoticeTitle;
  }
}
