abstract class UiEffect {
  const UiEffect();
}

class ShowSuccessMessage extends UiEffect {
  final String message;
  const ShowSuccessMessage(this.message);
}

class ShowErrorMessage extends UiEffect {
  final String message;
  const ShowErrorMessage(this.message);
}
