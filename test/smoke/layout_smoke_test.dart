import 'package:alo_tho/app/theme/app_theme.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/features/auth/presentation/pages/login_page.dart';
import 'package:alo_tho/features/auth/presentation/pages/register_page.dart';
import 'package:alo_tho/features/auth/presentation/pages/splash_page.dart';
import 'package:alo_tho/features/chat/presentation/pages/message_list_page.dart';
import 'package:alo_tho/features/home/presentation/pages/my_work_page.dart';
import 'package:alo_tho/features/profile/presentation/pages/profile_page.dart';
import 'package:alo_tho/features/worker_search/presentation/pages/worker_detail_page.dart';
import 'package:alo_tho/features/worker_search/presentation/pages/worker_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  Future<void> pumpPage(
    WidgetTester tester,
    Widget page, {
    bool settle = true,
  }) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: const Locale('vi'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          home: page,
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 800));
    if (settle) {
      await tester.pumpAndSettle();
    }
  }

  testWidgets('worker search page lays out and handles taps', (tester) async {
    await pumpPage(tester, const WorkerSearchPage());

    expect(tester.takeException(), isNull);

    await tester.tap(find.byType(FilterChip).first);
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });

  testWidgets('message list page lays out and handles taps', (tester) async {
    await pumpPage(tester, const MessageListPage());

    expect(tester.takeException(), isNull);

    await tester.tap(find.byType(FilterChip).first);
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });

  testWidgets('my work page lays out', (tester) async {
    await pumpPage(tester, const MyWorkPage());

    expect(tester.takeException(), isNull);
  });

  testWidgets('profile page lays out', (tester) async {
    await pumpPage(tester, const ProfilePage());

    expect(tester.takeException(), isNull);
  });

  testWidgets('login page lays out', (tester) async {
    await pumpPage(tester, const LoginPage());

    expect(tester.takeException(), isNull);
  });

  testWidgets('register page lays out', (tester) async {
    await pumpPage(tester, const RegisterPage());

    expect(tester.takeException(), isNull);
  });

  testWidgets('worker detail page lays out', (tester) async {
    await pumpPage(tester, const WorkerDetailPage(workerId: 'worker-003'));

    expect(tester.takeException(), isNull);
  });

  testWidgets('splash page lays out', (tester) async {
    await pumpPage(tester, const SplashPage(), settle: false);

    expect(tester.takeException(), isNull);
  });
}
