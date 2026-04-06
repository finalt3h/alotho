# Project Architecture

## Stack
- Flutter with Material 3.
- Riverpod with `Provider`, `NotifierProvider`, and `ConsumerWidget` or `ConsumerStatefulWidget`.
- `freezed` for entities and presentation state.
- `json_serializable` for data models.
- `go_router` for app navigation.
- `supabase_flutter` for auth and remote config flows.

## Root structure
- `lib/app/` holds app bootstrap, routes, router, theme, and app-wide providers.
- `lib/core/` holds shared config, constants, l10n, utilities, result and failure types, previews, and reusable widgets.
- `lib/features/<feature>/domain/` holds entities and repository contracts.
- `lib/features/<feature>/data/` holds data sources, models, and repository implementations.
- `lib/features/<feature>/presentation/` holds pages, widgets, and viewmodels.
- `test/features/` mirrors feature controllers and logic tests.

## App bootstrap
- `lib/main.dart` initializes Flutter bindings, loads Supabase config, initializes Supabase, and wraps the app in `ProviderScope`.
- `lib/app/app.dart` reads theme, locale, and router from providers and wraps the child with `GlobalConfigGate`.
- `lib/app/router.dart` owns route registration and auth-based redirects.

## State management pattern
- Expose controllers as `final ...Provider = NotifierProvider<Controller, State>(Controller.new);`
- Keep state immutable with `@freezed`.
- Use `build()` for initial state; when bootstrapping async loads, gate with `_didBootstrap` plus `Future<void>.microtask(load);`
- Use controller methods like `load`, `refresh`, `updateSearchQuery`, `selectCategory`, `signOut`.
- Keep controller return types pragmatic. Use `Future<bool>` for submit flows that pages may await.

## Repository pattern
- Domain exposes `abstract interface class ...Repository`.
- Repository provider usually lives in the concrete repository file.
- Repositories convert data-source output into domain entities.
- Recoverable errors return `Error(Failure(...))`, not thrown exceptions.
- Use `Success(value)` and `Error(failure)` from `lib/core/result/result.dart`.

## Model and entity pattern
- Domain entities are plain `@freezed` classes in `domain/entities/`.
- Data models mirror the payload shape and live in `data/models/`.
- Models use:
  - `const Model._();`
  - `factory Model.fromJson(...)`
  - `Entity toEntity() => ...`
- Do not skip models for remote or serialized data.

## Existing reference features
- `lib/features/auth/`:
  - Best reference for Supabase remote data source, repository mapping, form submission, auth session updates, and error mapping.
- `lib/features/worker_search/`:
  - Best reference for list + filter + detail features with mock data source and repository.
- `lib/features/chat/`:
  - Best reference for searchable list page composition with chips, empty/loading/error states, and related recommendations.
- `lib/features/profile/`:
  - Best reference for bootstrapped page loading, refresh, and sign-out side effects.
- `lib/features/global_config/`:
  - Best reference for app-wide gate behavior and refresh-on-resume flows.

## Shared UI conventions
- Use spacing and radius tokens from `lib/core/constants/app_spacing.dart`.
- Use `AppPageBody` to constrain content width.
- Use `SectionHeader` for screen section intros.
- Use `AppLoadingState`, `AppErrorView`, and `AppEmptyState` for common async states.
- Use `showAppStatusDialog` for user-facing error/alert dialogs.
- Prefer existing themed Material widgets before adding custom design systems.

## Generated code workflow
- After changing `@freezed` or JSON model files, run:
```bash
dart run build_runner build --delete-conflicting-outputs
```
- Do not run build_runner for pure widget/controller edits that do not affect generated files.
