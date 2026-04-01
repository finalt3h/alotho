import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShellPage extends StatelessWidget {
  const MainShellPage({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        height: 72,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.search_rounded),
            label: l10n.workerSearchNav,
          ),
          NavigationDestination(
            icon: const Icon(Icons.forum_outlined),
            label: l10n.messagesNav,
          ),
          NavigationDestination(
            icon: const Icon(Icons.work_history_outlined),
            label: l10n.myWorkNav,
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
