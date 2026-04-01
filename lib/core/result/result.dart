import 'package:alo_tho/core/errors/failure.dart';

sealed class Result<T> {
  const Result();

  R when<R>({
    required R Function(T value) success,
    required R Function(Failure failure) failure,
  }) {
    final self = this;
    return switch (self) {
      Success<T>(:final value) => success(value),
      Error<T>(failure: final error) => failure(error),
    };
  }

  bool get isSuccess => this is Success<T>;
}

class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

class Error<T> extends Result<T> {
  const Error(this.failure);

  final Failure failure;
}
