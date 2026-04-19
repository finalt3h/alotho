# Alo Tho - Implementation Plan

Last updated: 2026-04-19 (Asia/Ho_Chi_Minh)

## 1) Hien trang du an (da co)

### Nen tang va architecture
- Flutter app da chia theo feature-first structure (`lib/features/*`).
- Da dung Riverpod Notifier, Freezed entities/state, GoRouter.
- Da co localization (`vi`, `en`) va app theme.
- Da co mot so reusable widgets trong `lib/core/widgets`.

### Chuc nang da ket noi backend that (Supabase)
- Auth:
  - Dang ky bang email/phone + password.
  - Dang nhap credentials.
  - OTP activation + resend OTP.
  - Google login qua Supabase OAuth callback.
  - Theo doi auth session trong app.
- Global config:
  - Tai config tu bang `public.global_configs`.
  - Ho tro force update / recommend update / important notice.
  - Da co script SQL: `supabase/global_configs.sql`.

### Chuc nang hien dang dung mock data
- `worker_search`: mock workers + categories.
- `my_work` (home): mock work listings.
- `chat`: mock conversation previews.
- `profile`: mock profile summary.

### Test baseline hien tai
- `flutter test` dang fail 1 case:
  - `test/smoke/layout_smoke_test.dart`
  - Scenario: `worker search page lays out and handles taps`
  - Loi: tap `FilterChip` khong tim thay widget (test da lech so voi UI hien tai).

## 2) Muc tieu trien khai
- Chuyen tu mock data sang Supabase cho cac luong chinh.
- Duy tri app on dinh: test pass, khong crash, auth flow ro rang.
- Co kha nang release ban beta noi bo (Android truoc, iOS sau).

## 3) Roadmap theo phase

## Phase 0 - Stabilize baseline (uu tien cao, 1-2 ngay)
- Sua test smoke dang fail (worker search tap interaction).
- Chuan hoa test smoke de khong phu thuoc widget type de vo.
- Chot lai env setup cho team (`.env.debug`, `.env.release`, run config).
- Output:
  - `flutter test` pass lai.
  - Co note ro cach chay test local.

## Phase 1 - Data model va Supabase schema (2-4 ngay)
- Thiet ke schema cho:
  - `profiles` (user profile mo rong neu can),
  - `worker_profiles`,
  - `service_categories`,
  - `job_posts` / `my_work`,
  - `conversations`, `messages`,
  - mapping user <-> worker.
- Viet SQL migration + seed data toi thieu cho dev.
- Viet RLS policy theo role (anonymous/authenticated/worker).
- Output:
  - Folder migration SQL ro rang.
  - Tai lieu schema + relation + policy.

## Phase 2 - Worker Search va Worker Detail len backend that (3-5 ngay)
- Tao Supabase datasource/repository cho `worker_search`.
- Ho tro query categories + worker list + worker detail.
- Bo sung loading/error/empty states dung data that.
- Output:
  - Khong con mock datasource cho worker search tren main flow.
  - Unit tests cho viewmodel + repository mapping.

## Phase 3 - My Work va Profile len backend that (3-5 ngay)
- `my_work`: lay danh sach bai dang/cong viec cua worker.
- `profile`: lay profile tu user metadata + bang profile.
- Chot format data hien thi, fallback neu thieu du lieu.
- Output:
  - Khong con mock datasource cho my_work/profile tren main flow.
  - Co test cho cac state chinh (success/empty/error).

## Phase 4 - Chat MVP backend that (4-7 ngay)
- Tao schema conversation/message.
- Lay danh sach conversation preview.
- Gui/nhan tin nhan co ban (co the polling truoc, realtime sau).
- Output:
  - Message list khong con mock.
  - Co luong chat toi thieu de dung thu nghiem.

## Phase 5 - QA, release readiness, observability (2-4 ngay)
- Tang test cover cho flow quan trong:
  - register/login/logout,
  - worker search -> detail,
  - my_work,
  - message list.
- Add crash/error logging strategy (Sentry hoac tuong duong).
- Build checklist release beta.
- Output:
  - Test suite on dinh.
  - Co release checklist co the lap lai.

## 4) Thu tu uu tien task (high-level)
1. Sua test fail baseline (Phase 0).
2. Chot schema + RLS (Phase 1).
3. Chuyen worker search sang data that (Phase 2).
4. Chuyen my_work + profile (Phase 3).
5. Chat MVP (Phase 4).
6. QA + release checklist (Phase 5).

## 5) Nguyen tac trien khai
- Moi feature chuyen tu mock -> Supabase theo tung block nho, merge som.
- Moi block can co:
  - ViewModel test,
  - Mapping/model test (neu co),
  - Manual smoke checklist.
- Khong doi den cuoi moi test tong; test sau moi block.

## 6) Dinh nghia hoan thanh (Definition of Done)
- Code compile + `flutter test` pass.
- Khong con hardcoded mock o flow vua trien khai.
- Error/loading/empty state da xu ly.
- README/docs duoc cap nhat neu co thay doi env/schema/run flow.
