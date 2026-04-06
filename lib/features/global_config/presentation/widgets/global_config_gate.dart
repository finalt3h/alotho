import 'dart:async';

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

    _isShowingBlockingDialog = true;

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return PopScope(
          canPop: false,
          child: AppStatusDialog(
            state: AppStatusDialogState.alert,
            title: config.resolvedUpdateTitle,
            message: config.resolvedUpdateMessage,
            positiveText: 'Cap nhat',
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

    _isShowingDialog = true;

    await showAppStatusDialog(
      context: context,
      state: AppStatusDialogState.alert,
      title: config.resolvedNoticeTitle,
      message: config.noticeMessage!.trim(),
      barrierDismissible: !config.isNoticeBlocking,
      positiveText: 'Da hieu',
    );

    _isShowingDialog = false;
  }

  Future<void> _showRecommendedUpdate(GlobalConfig config) async {
    if (_isShowingDialog || !mounted) {
      return;
    }

    _isShowingDialog = true;

    await showAppStatusDialog(
      context: context,
      state: AppStatusDialogState.alert,
      title: config.resolvedUpdateTitle,
      message: config.resolvedUpdateMessage,
      barrierDismissible: true,
      positiveText: 'Cap nhat',
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
        title: 'Khong the cap nhat',
        message: 'Chua cau hinh duong dan cap nhat cho ung dung.',
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
        title: 'Khong the cap nhat',
        message: 'Khong the mo lien ket cap nhat. Vui long thu lai sau.',
      );
    }
  }
}
