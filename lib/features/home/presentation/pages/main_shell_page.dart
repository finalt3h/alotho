import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';

@Preview(
  group: 'Screens',
  name: 'Main Shell Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewMainShellPage() => MainShellScaffold(
  currentIndex: 0,
  onDestinationSelected: (_) {},
  body: const _MainShellPreviewBody(),
);

class _MainShellPreviewBody extends StatelessWidget {
  const _MainShellPreviewBody();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            l10n.mainShellPreviewTitle,
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.mainShellPreviewDescription,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                l10n.mainShellPreviewBody,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainShellPage extends StatelessWidget {
  const MainShellPage({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return MainShellScaffold(
      body: navigationShell,
      currentIndex: navigationShell.currentIndex,
      onDestinationSelected: (index) {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      },
    );
  }
}

class MainShellScaffold extends StatelessWidget {
  const MainShellScaffold({
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        height: 72,
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.search_rounded),
            label: l10n.workerSearchNav,
          ),
          NavigationDestination(
            icon: const Icon(Icons.work_history_outlined),
            label: l10n.myWorkNav,
          ),
          NavigationDestination(
            icon: const Icon(Icons.forum_outlined),
            label: l10n.messagesNav,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline_rounded),
            label: l10n.profileNav,
          ),
        ],
      ),
    );
  }
}
