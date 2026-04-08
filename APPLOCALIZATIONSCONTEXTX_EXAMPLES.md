# AppLocalizationsContextX - Practical Examples

## 🎯 Real-World Usage From Your App

### Ví Dụ 1: LoginPage (Từ Codebase Của Bạn)

```dart
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;  // ← Lấy l10n
    
    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: LoginForm(),
    );
  }
}
```

---

### Ví Dụ 2: GlobalConfigGate (Đã Update)

```dart
Future<void> _showRecommendedUpdate(GlobalConfig config) async {
  final l10n = context.l10n;  // ← Lấy l10n
  
  await showAppStatusDialog(
    context: context,
    title: config.resolvedUpdateTitle,
    positiveText: l10n.globalConfigUpdateButton,  // ← Dùng l10n
  );
}
```

---

### Ví Dụ 3: ProfilePage

```dart
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;  // ← Lấy l10n
    
    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: Column(
        children: [
          ProfileCard(),
          SignOutButton(l10n: l10n),  // ← Pass l10n xuống
        ],
      ),
    );
  }
}
```

---

## 📋 All Available Keys (Từ ARB File)

### Global Config Keys
```dart
context.l10n.globalConfigUpdateButton              // "Cập nhật"
context.l10n.globalConfigAcknowledgeButton         // "Đã hiểu"
context.l10n.globalConfigUpdateErrorTitle          // "Không thể cập nhật"
context.l10n.globalConfigUpdateErrorMessage        // "Chưa cấu hình..."
context.l10n.globalConfigUpdateLinkErrorTitle      // "Không thể cập nhật"
context.l10n.globalConfigUpdateLinkErrorMessage    // "Không thể mở liên kết..."
```

### Auth Error Keys
```dart
context.l10n.authErrorAccountNotCreated            // "Không thể tạo tài khoản..."
context.l10n.authErrorOtpVerificationFailed        // "Xác thực OTP không thành công..."
context.l10n.authErrorOtpExpiredOrInvalid          // "Mã OTP đã hết hạn..."
context.l10n.authErrorResendOtpFailed              // "Không thể gửi lại mã OTP..."
context.l10n.authErrorLoginFailed                  // "Không thể đăng nhập..."
context.l10n.authErrorLoginInvalid                 // "Thông tin đăng nhập không chính xác..."
context.l10n.authErrorAccountNotActivated          // "Tài khoản chưa kích hoạt..."
context.l10n.authErrorGoogleLoginUnavailable       // "Đăng nhập Google chưa khả dụng..."
context.l10n.authErrorGoogleLoginFailed            // "Không thể đăng nhập với Google..."
context.l10n.authErrorGoogleLoginTimeout           // "Đăng nhập Google hết thời gian..."
context.l10n.authErrorGoogleLoginCannotOpen        // "Không mở được màn hình đăng nhập..."
context.l10n.authErrorRegisterAccountExists        // "Tài khoản đã tồn tại..."
context.l10n.authErrorRegisterPasswordWeak         // "Mật khẩu chưa hợp lệ..."
context.l10n.authErrorIdentifierInvalid            // "Số điện thoại hoặc email chưa hợp lệ..."
context.l10n.authErrorPasswordInvalid              // "Mật khẩu chưa hợp lệ..."
```

### Profile Keys
```dart
context.l10n.profileErrorSignOutFailed             // "Không thể đăng xuất..."
context.l10n.profileErrorLoadSummaryFailed         // "Không tải được thông tin hồ sơ..."
```

### Worker Keys
```dart
context.l10n.workerErrorLoadServiceCategoriesFailed // "Không tải được danh mục..."
context.l10n.workerErrorNotFound                    // "Không tìm thấy thông tin thợ..."
context.l10n.workerErrorLoadWorkersFailed           // "Không tải được danh sách thợ..."
context.l10n.workerSearchNav                        // "Tìm Thợ"
```

### Home Keys
```dart
context.l10n.homeErrorLoadJobsFailed                // "Không tải được danh sách bài..."
context.l10n.myWorkNav                              // "Công Việc Của Tôi"
```

### Chat Keys
```dart
context.l10n.chatErrorLoadConversationsFailed       // "Không tải được danh sách trò..."
context.l10n.messagesNav                            // "Tin Nhắn"
```

### Other Keys
```dart
context.l10n.appTitle                               // "ALO THỢ"
context.l10n.profileNav                             // "Hồ Sơ"
```

---

## 🎨 Common Patterns

### Pattern 1: Validation Error Messages

```dart
class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  void validateAndLogin() {
    final l10n = context.l10n;
    
    if (phone.isEmpty) {
      showError(l10n.authErrorIdentifierInvalid);
      return;
    }
    
    if (password.length < 6) {
      showError(l10n.authErrorPasswordInvalid);
      return;
    }
    
    login();
  }
}
```

---

### Pattern 2: Dialog Messages

```dart
void showConfirmDialog(BuildContext context) {
  final l10n = context.l10n;
  
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.globalConfigUpdateErrorTitle),
      content: Text(l10n.globalConfigUpdateErrorMessage),
      actions: [
        TextButton(
          child: Text(l10n.globalConfigAcknowledgeButton),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
```

---

### Pattern 3: Snackbar Messages

```dart
void showSuccessMessage(BuildContext context) {
  final l10n = context.l10n;
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(l10n.authErrorAccountNotCreated)),
  );
}
```

---

### Pattern 4: BottomNavigationBar Labels

```dart
@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  
  return Scaffold(
    bottomNavigationBar: NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.search),
          label: l10n.workerSearchNav,      // "Tìm Thợ"
        ),
        NavigationDestination(
          icon: Icon(Icons.chat),
          label: l10n.messagesNav,          // "Tin Nhắn"
        ),
        NavigationDestination(
          icon: Icon(Icons.work),
          label: l10n.myWorkNav,            // "Công Việc"
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: l10n.profileNav,           // "Hồ Sơ"
        ),
      ],
    ),
  );
}
```

---

### Pattern 5: Pass L10n to Child Widgets

```dart
class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    
    return Column(
      children: [
        ChildWidget1(l10n: l10n),
        ChildWidget2(l10n: l10n),
      ],
    );
  }
}

class ChildWidget1 extends StatelessWidget {
  final AppLocalizations l10n;
  
  const ChildWidget1({required this.l10n});
  
  @override
  Widget build(BuildContext context) {
    return Text(l10n.authErrorAccountNotCreated);
  }
}
```

---

## ⚠️ When NOT to Use `context.l10n`

### ❌ In Non-Widget Code

```dart
// ❌ Wrong - không có BuildContext
class AuthService {
  void validateEmail(String email) {
    // Không thể dùng context.l10n ở đây
    print(context.l10n.authErrorIdentifierInvalid);  // ERROR!
  }
}

// ✅ Correct - dùng constants thay vì
class AuthService {
  void validateEmail(String email) {
    print(AuthErrorMessages.authErrorIdentifierInvalid);  // OK
  }
}
```

### ❌ In Not-Yet-Built Widgets

```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late String title;
  
  @override
  void initState() {
    super.initState();
    // ❌ Không dùng context.l10n ở đây
    // title = context.l10n.appTitle;  // ERROR!
  }
  
  @override
  Widget build(BuildContext context) {
    // ✅ Dùng ở đây
    title = context.l10n.appTitle;
    return Text(title);
  }
}
```

---

## 🔍 How to Find All L10n Keys in Your App

### Using IDE (IntelliJ/Android Studio)

1. Type: `context.l10n.`
2. Auto-complete sẽ show tất cả keys có sẵn
3. Press `Ctrl+Space` (Cmd+Space on Mac) để xem suggestion

### Using Search

```bash
grep -r "context.l10n\." lib/  # Find all usages
```

---

## 🚀 Best Practices

✅ **Do:**
- Use `context.l10n` for brevity
- Fetch once per widget if using multiple keys
- Pass `l10n` to child widgets if needed
- Use `final l10n = context.l10n;` at the top of build()

❌ **Don't:**
- Don't use `context.l10n` outside widgets
- Don't use it in `initState()` before build
- Don't forget that it's null-unsafe without proper setup
- Don't hardcode strings when keys exist

---

## 📚 Related Documentation

- `WHAT_IS_APPLOCALIZATIONSCONTEXTX.md` - Detailed explanation
- `HOW_TO_USE_L10N_IN_TESTS.md` - Using l10n in tests
- `ARB_KEYS_QUICK_REFERENCE.md` - All available keys

---

**Summary**: `AppLocalizationsContextX` is an extension that provides the convenient `context.l10n` getter, making it easy to access localized strings in your Flutter app!


