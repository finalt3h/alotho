# Feature Template

## When to create a new feature
- Create a new `lib/features/<feature>/` folder when the task introduces a distinct user capability with its own domain language, repository contract, or navigation entry.
- Stay inside an existing feature when the task is a widget, page, controller, model, or repository extension of that capability.

## Standard feature shape
```text
lib/features/<feature>/
  domain/
    entities/
    repositories/
  data/
    datasources/
    models/
    repositories/
  presentation/
    pages/
    widgets/
    viewmodels/
test/features/<feature>/
```

## Minimum files by use case

### 1. Static or mock-backed list/detail flow
- `domain/entities/<entity>.dart`
- `domain/repositories/<feature>_repository.dart`
- `data/models/<entity>_model.dart`
- `data/datasources/mock_<feature>_data_source.dart`
- `data/repositories/mock_<feature>_repository.dart`
- `presentation/viewmodels/<feature>_state.dart`
- `presentation/viewmodels/<feature>_view_model.dart`
- `presentation/pages/<feature>_page.dart`
- optional `presentation/widgets/*.dart`
- `test/features/<feature>/<feature>_view_model_test.dart`

### 2. Form submission flow
- Add one `@freezed` state file for form fields, loading flag, and error fields.
- Controller methods should validate input first, then call the repository, then update state.
- Return `Future<bool>` when the page needs a success/failure signal after submit.
- Use `ref.listen` in the page for dialogs or navigation triggered by state transitions.

### 3. Supabase remote flow
- Add remote data source providers in `data/datasources/`.
- Keep raw Supabase interaction in the data source.
- Keep message mapping and `Result<T>` conversion in the repository.
- Convert Supabase or JSON payloads into domain entities via models.

## Controller template
- `build()` returns a small default state.
- For initial async load, use `_didBootstrap`.
- Use `state = state.copyWith(...)` for every mutation.
- Keep private helpers inside the controller for filtering or validation.
- Do not call UI APIs like dialogs, navigation, or snackbars inside the controller.

## Page template
- Use `Scaffold` + `AppBar` + `AppPageBody`.
- Use `RefreshIndicator` for refreshable lists or profile-like pages.
- Read state with `ref.watch(...)`.
- Read notifier with `ref.read(...notifier)`.
- Use `if (state.isLoading)`, `else if (state.errorMessage != null)`, `else ...[]` for async branches.
- Split repeated card/list-tile UI into widgets under `presentation/widgets/`.

## Naming rules
- Feature folders: snake_case.
- Entities/models/classes: PascalCase.
- Provider variables: lowerCamelCase ending with `Provider`.
- Controller files stay named `*_view_model.dart` even though the class is `*Controller`.
- Freezed state files stay named `*_state.dart`.

## Source anchors
- Use `lib/features/worker_search/` as the default template for new browse/list/detail experiences.
- Use `lib/features/auth/` as the template for input validation, submit actions, and repository-backed session updates.
- Use `lib/features/profile/` as the template for async bootstrap plus pull-to-refresh screens.
