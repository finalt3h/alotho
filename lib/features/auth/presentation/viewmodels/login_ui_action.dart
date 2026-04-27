import 'package:alo_tho/core/effects/ui_effect.dart';

sealed class LoginUiAction extends UiEffect {
  const LoginUiAction();
}

class LoginRequiresActivationAction extends LoginUiAction {
  const LoginRequiresActivationAction({
    required this.identifier,
    required this.message,
  });

  final String identifier;
  final String message;
}
