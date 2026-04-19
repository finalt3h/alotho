# Alo Tho - Work Status Tracker

Last updated: 2026-04-19 (Asia/Ho_Chi_Minh)

## Cach dung file nay
- Moi lan bat dau session: doc `Next Session Start Checklist`.
- Moi lan ket thuc session: cap nhat `Task Board` + them 1 dong trong `Session Log`.
- Trang thai task dung 1 trong 4 gia tri: `TODO`, `IN_PROGRESS`, `BLOCKED`, `DONE`.

## Snapshot hien tai
- Backend that:
  - `auth`: da dung Supabase.
  - `global_config`: da dung Supabase.
- Dang mock:
  - `worker_search`, `my_work`, `chat`, `profile`.
- Da hoan thanh tren mock:
  - `chat detail` (gui text/anh, typing indicator, trang thai gui, retry khi fail).
- Baseline quality:
  - `flutter analyze`: pass.
  - `flutter test test/smoke/layout_smoke_test.dart`: pass.
  - `flutter test test/features/chat/chat_detail_view_model_test.dart`: pass.

## Task Board

| ID | Area | Task | Priority | Status | Owner | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| STAB-001 | Testing | Fix smoke test `worker search page lays out and handles taps` | P0 | DONE | Codex | Da doi interaction sang widget tap hop le voi UI hien tai |
| STAB-002 | Testing | Chuan hoa smoke test de it brittle (uu tien key/semantics) | P1 | TODO | - | Lam ngay sau STAB-001 |
| DATA-001 | Supabase | Thiet ke schema cho worker/profile/job/chat + relation | P0 | TODO | - | Can tai lieu schema + SQL migration |
| DATA-002 | Supabase | Viet RLS policy cho cac bang moi | P0 | TODO | - | Chot rule cho anon/authenticated/worker |
| WORKER-001 | Worker Search | Tao supabase datasource/repository cho categories + workers | P0 | TODO | - | Thay mock repo trong main flow |
| WORKER-002 | Worker Detail | Lay worker detail that + xu ly empty/error states | P1 | TODO | - | Can test mapping model |
| WORK-001 | My Work | Chuyen `my_work` sang supabase repository | P1 | TODO | - | Query theo current user/worker |
| PROFILE-001 | Profile | Chuyen profile summary sang supabase repository | P1 | TODO | - | Dong bo voi auth metadata |
| CHAT-001 | Chat | Tao schema conversations/messages MVP | P1 | TODO | - | Co seed du lieu dev |
| CHAT-UI-001 | Chat | Tao man chat detail (gui text/anh, typing, status, retry) | P0 | DONE | Codex | Hoan thanh tren mock data, da co test |
| CHAT-002 | Chat | Chuyen message list sang supabase repository | P1 | TODO | - | Polling truoc, realtime sau |
| QA-001 | QA | Bo sung test cho flow auth + worker search + my_work + chat preview | P1 | TODO | - | Gom unit + smoke |
| REL-001 | Release | Tao beta release checklist (Android truoc) | P2 | TODO | - | Build, env, crash log, rollback |

## Dang lam (Current Focus)
- Vua hoan thanh `CHAT-UI-001`.
- Uu tien de nghi cho session tiep theo: `DATA-001` -> `WORKER-001` -> `CHAT-001`.

## Session Log

| Date | What changed | Tasks affected | Result | Next action |
| --- | --- | --- | --- | --- |
| 2026-04-19 | Tao implementation plan + tracker trang thai | STAB-001..REL-001 (khoi tao) | Co plan va board theo doi dai han | Bat dau STAB-001 (fix smoke fail) |
| 2026-04-19 | Implement man chat detail + route + state + test | STAB-001, CHAT-UI-001 | Hoan thanh mock chat detail, fix smoke fail, analyze/test pass | Bat dau data schema cho chat (`CHAT-001`) |

## Next Session Start Checklist
1. Chay `git status --short` de xem context file dang sua.
2. Mo `docs/WORK_STATUS.md`, cap nhat `Current Focus` neu can.
3. Chay `flutter test` de xac nhan baseline truoc khi code.
4. Lam task uu tien cao nhat dang `TODO` hoac `BLOCKED`.
5. Sau khi xong task, cap nhat lai `Task Board` + `Session Log`.

## Quy uoc uu tien
- P0: blocker/cham den baseline on dinh hoac backend core.
- P1: can de hoan thien MVP.
- P2: nang cap release/readiness.
