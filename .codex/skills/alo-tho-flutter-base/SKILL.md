---
name: alo-tho-flutter-base
description: Generate, extend, and refactor Flutter code for the alo_tho app using its existing feature-first architecture, Riverpod Notifier state management, Freezed states and entities, GoRouter navigation, Supabase-backed repositories, shared core widgets, localization, previews, and tests. Use when Codex needs to add screens, routes, features, entities, repositories, controllers, widgets, or tests in this repo while matching the established base instead of inventing a new structure.
---

# Alo Tho Flutter Base

Use this skill when working inside the `alo_tho` Flutter project and the goal is to produce code that looks native to the repo.

## Required workflow
1. Inspect the closest existing feature before writing code.
2. Match the repo's feature-first layout under `lib/features/<feature_name>/`.
3. Reuse Riverpod `NotifierProvider`, `@freezed` states, `Result<T>`, and existing core widgets instead of introducing new patterns.
4. Keep pages thin: place business logic in controllers and data mapping in models/repositories.
5. Add localization, previews, routing, and tests whenever the change affects user-facing screens or app flow.
6. Run code generation only when adding or changing `freezed` or `json_serializable` files.
7. Validate with `flutter analyze` and the most relevant `flutter test` targets before finishing.

## Project rules
- Keep the existing layering: `domain`, `data`, `presentation`.
- Prefer one repository provider per feature and inject dependencies through Riverpod providers.
- Return `Result<T>` from repositories for recoverable failures.
- Use `Failure(message, code: ...)` for repository-level errors.
- Use `ConsumerWidget` or `ConsumerStatefulWidget` for pages; use `ref.listen` for dialogs and one-off side effects.
- Keep UI composition in pages/widgets and async workflows in controllers.
- Reuse `AppPageBody`, `SectionHeader`, `AppLoadingState`, `AppErrorView`, `AppEmptyState`, `AppSectionCard`, and spacing tokens before building new generic widgets.
- Follow existing naming: `<Feature>Controller`, `<Feature>State`, `<Entity>Model`, `mock_<feature>_repository.dart`, `mock_<feature>_data_source.dart`.
- Preserve Vietnamese-first UX copy. New strings belong in ARB files, not inline literals, unless the surrounding file already uses fixed demo copy.

## Choose the nearest reference
- For auth or Supabase-backed flows, read `references/project-architecture.md` and inspect `lib/features/auth/`.
- For list/filter/detail features, read `references/feature-template.md` and inspect `lib/features/worker_search/` or `lib/features/chat/`.
- For profile-style load/retry/sign-out flows, inspect `lib/features/profile/`.
- For app-level routing or global guards, inspect `lib/app/router.dart` and `lib/features/global_config/`.
- For screen polish and shared layout patterns, read `references/ui-routing-testing.md`.

## Generation checklist
1. Confirm whether the task needs a new feature, a new page inside an existing feature, or only a widget/controller change.
2. Copy the nearest folder/file pattern instead of designing from scratch.
3. If adding a new entity/model/state, add the `part` files and keep constructors small and explicit.
4. If adding a new page, wire route constants in `lib/app/app_routes.dart` and route definitions in `lib/app/router.dart`.
5. If adding visible strings, update `lib/core/l10n/arb/app_vi.arb` and `lib/core/l10n/arb/app_en.arb`.
6. If adding a presentational screen, add a `@Preview` entry using `appPreviewWrapper`.
7. If adding controller logic, add or update a focused provider test under `test/features/...`.
8. If adding a screen, keep or extend the smoke/layout coverage when practical.

## References
- `references/project-architecture.md` - stack, folder layout, state/data conventions, and source examples.
- `references/feature-template.md` - practical file templates and decision rules for new features.
- `references/ui-routing-testing.md` - page composition, localization, previews, routing, and validation checklist.
