import 'package:alo_tho/core/effects/ui_effect.dart';

sealed class RegisterUiAction extends UiEffect {
  const RegisterUiAction();
}

class RegisterRegistrationSucceededAction extends RegisterUiAction {
  const RegisterRegistrationSucceededAction({
    required this.hasActiveSession,
    required this.identifier,
  });

  final bool hasActiveSession;
  final String identifier;
}
