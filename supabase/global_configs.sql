create table if not exists public.global_configs (
  id uuid primary key default gen_random_uuid(),
  is_active boolean not null default true,
  minimum_android_version text,
  latest_android_version text,
  android_store_url text,
  minimum_ios_version text,
  latest_ios_version text,
  ios_store_url text,
  update_title text,
  update_message text,
  notice_id text,
  notice_title text,
  notice_message text,
  notice_enabled boolean not null default false,
  notice_blocking boolean not null default false,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create index if not exists global_configs_active_updated_idx
  on public.global_configs (is_active, updated_at desc);

create or replace function public.set_global_configs_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = timezone('utc', now());
  return new;
end;
$$;

drop trigger if exists trg_global_configs_updated_at on public.global_configs;

create trigger trg_global_configs_updated_at
before update on public.global_configs
for each row
execute function public.set_global_configs_updated_at();

alter table public.global_configs enable row level security;

drop policy if exists "Allow anonymous read global configs"
  on public.global_configs;

create policy "Allow anonymous read global configs"
on public.global_configs
for select
to anon, authenticated
using (is_active = true);

insert into public.global_configs (
  is_active,
  minimum_android_version,
  latest_android_version,
  android_store_url,
  minimum_ios_version,
  latest_ios_version,
  ios_store_url,
  update_title,
  update_message,
  notice_id,
  notice_title,
  notice_message,
  notice_enabled,
  notice_blocking
)
values (
  true,
  '1.0.0',
  '1.1.0',
  'https://play.google.com/store/apps/details?id=com.itsonnm.alotho',
  '1.0.0',
  '1.1.0',
  'https://apps.apple.com/app/id0000000000',
  'Da co phien ban moi',
  'Vui long cap nhat ung dung de nhan ban sua loi va tinh nang moi.',
  'welcome_notice',
  'Thong bao quan trong',
  'He thong se bao tri luc 23:00 toi nay.',
  false,
  false
);
