# alo_tho

Flutter app ket noi nguoi dung voi tho sua chua gan day.

## Supabase login

Du an da duoc tich hop `supabase_flutter` cho luong dang nhap bang email hoac so dien thoai + mat khau.

App se tu dong nap env file:

- Debug: `.env.debug`
- Profile/Release: `.env.release`

Noi dung file:

```env
SUPABASE_URL=https://YOUR_PROJECT_REF.supabase.co
SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

Ban van co the override bang `dart-define` neu can.

Vi du:

```bash
flutter run \
  --dart-define=SUPABASE_URL=https://YOUR_PROJECT_REF.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

Neu ban dang dung VS Code/Android Studio, chi can them hai `dart-define` nay vao run configuration.

## Google login

Dang nhap Google da duoc noi voi Supabase OAuth qua deep link callback:

- Redirect URL cua app: `com.itsonnm.alotho://login-callback`
- Android va iOS da duoc khai bao deep link trong project

Ban can cau hinh them tren Supabase Dashboard:

1. Vao `Authentication -> Providers -> Google` va bat Google provider.
2. Trong `Authentication -> URL Configuration`, them `com.itsonnm.alotho://login-callback` vao `Additional Redirect URLs`.
3. Dung client ID/secret cua Google OAuth cho provider Google trong Supabase.

## Ghi chu

- Dang nhap Google tren Android se mo trinh duyet ngoai va quay lai app sau khi xac thuc thanh cong.
- Du lieu ho so trong app duoc map tu `auth.users` metadata nhu `full_name`, `name`, `phone_number`, `city`, `is_worker`, `avatar_url` neu co.

## Global config

App da co them luong tai `global config` tu bang Supabase `public.global_configs` de:

- Kiem tra app co can `force update` hay khong
- Goi y cap nhat neu da co phien ban moi
- Hien thong bao quan trong khi app mo len

Mau schema va seed data nam o:

- `supabase/global_configs.sql`
