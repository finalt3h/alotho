# UI, Routing, And Testing

## Screen composition
- Prefer `ConsumerWidget` unless local ephemeral UI state is required. Use `ConsumerStatefulWidget` for cases like password visibility toggles.
- Add `@Preview` for user-facing pages:
```dart
@Preview(
  group: 'Screens',
  name: 'Example Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewExamplePage() => const ExamplePage();
```
- Use `Theme.of(context)` and shared tokens instead of hardcoding full style systems.
- Reuse `AppSearchField`, `AvatarView`, `AppSectionCard`, and other shared widgets before creating new generics.

## Localization
- App localization is wired through `context.l10n`.
- New user-facing copy should be added to:
  - `lib/core/l10n/arb/app_vi.arb`
  - `lib/core/l10n/arb/app_en.arb`
- Keep Vietnamese and English keys aligned.
- If the surrounding screen already contains fixed demo copy, prefer following the local pattern rather than half-localizing a file.

## Routing
- Route names and paths live in `lib/app/app_routes.dart`.
- Route registrations live in `lib/app/router.dart`.
- For tabbed authenticated screens, follow the existing `StatefulShellRoute.indexedStack` setup.
- For detail pages under an existing feature route, nest child `GoRoute`s as in worker detail.
- Use helper methods like `AppRoutes.workerDetailPath(worker.id)` when a route helper already exists.

## Async side effects
- Put dialogs and navigation reactions in `ref.listen(...)` inside the page.
- Guard repeated dialogs by comparing previous and next values when needed.
- Keep controller state explicit with fields like `errorMessage`, `pendingActivationIdentifier`, or `signOutErrorMessage`.

## Validation checklist
- If you changed generated models or states, run:
```bash
dart run build_runner build --delete-conflicting-outputs
```
- Run:
```bash
flutter analyze
```
- Run the most relevant tests, for example:
```bash
flutter test test/features/auth/login_view_model_test.dart
flutter test test/features/worker_search/worker_search_view_model_test.dart
flutter test test/smoke/layout_smoke_test.dart
```

## Testing conventions
- Controller tests use `ProviderContainer` and override repository providers with fakes.
- Keep fake repositories inline in the test file when the scope is small.
- Assert both returned values and final provider state.
- For screen safety, preserve or extend `test/smoke/layout_smoke_test.dart` when adding pages that should at least render without exceptions.
