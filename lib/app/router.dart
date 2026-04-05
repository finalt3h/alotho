import 'package:alo_tho/app/app_routes.dart';
import 'package:alo_tho/features/auth/presentation/pages/login_page.dart';
import 'package:alo_tho/features/auth/presentation/pages/register_page.dart';
import 'package:alo_tho/features/auth/presentation/pages/splash_page.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_state.dart';
import 'package:alo_tho/features/chat/presentation/pages/message_list_page.dart';
import 'package:alo_tho/features/home/presentation/pages/main_shell_page.dart';
import 'package:alo_tho/features/home/presentation/pages/my_work_page.dart';
import 'package:alo_tho/features/profile/presentation/pages/profile_page.dart';
import 'package:alo_tho/features/worker_search/presentation/pages/worker_detail_page.dart';
import 'package:alo_tho/features/worker_search/presentation/pages/worker_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// Central router for the first mock version of the app.
final routerProvider = Provider<GoRouter>((ref) {
  final authStatus = ref.watch(
    authSessionControllerProvider.select((state) => state.status),
  );

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splashPath,
    routes: [
      GoRoute(
        path: AppRoutes.splashPath,
        name: AppRoutes.splashName,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.loginPath,
        name: AppRoutes.loginName,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.registerPath,
        name: AppRoutes.registerName,
        builder: (context, state) => const RegisterPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellPage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.workersPath,
                name: AppRoutes.workersName,
                builder: (context, state) => const WorkerSearchPage(),
                routes: [
                  GoRoute(
                    path: ':workerId',
                    name: AppRoutes.workerDetailName,
                    builder: (context, state) {
                      final workerId = state.pathParameters['workerId']!;
                      return WorkerDetailPage(workerId: workerId);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.messagesPath,
                name: AppRoutes.messagesName,
                builder: (context, state) => const MessageListPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.myWorkPath,
                name: AppRoutes.myWorkName,
                builder: (context, state) => const MyWorkPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profilePath,
                name: AppRoutes.profileName,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final location = state.matchedLocation;
      final isInAuthFlow = AppRoutes.isAuthPath(location);
      final isProtectedRoute = AppRoutes.isProtectedPath(location);

      if (authStatus == AuthStatus.unknown &&
          location != AppRoutes.splashPath) {
        return AppRoutes.splashPath;
      }

      if (authStatus == AuthStatus.unauthenticated) {
        if (location == AppRoutes.splashPath || isProtectedRoute) {
          return AppRoutes.loginPath;
        }
      }

      if (authStatus == AuthStatus.authenticated && isInAuthFlow) {
        return AppRoutes.workersPath;
      }

      return null;
    },
  );
});
