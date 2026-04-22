// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OtpVerificationState {
  String get otp => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isResending => throw _privateConstructorUsedError;

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpVerificationStateCopyWith<OtpVerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerificationStateCopyWith<$Res> {
  factory $OtpVerificationStateCopyWith(
    OtpVerificationState value,
    $Res Function(OtpVerificationState) then,
  ) = _$OtpVerificationStateCopyWithImpl<$Res, OtpVerificationState>;
  @useResult
  $Res call({String otp, bool isSubmitting, bool isResending});
}

/// @nodoc
class _$OtpVerificationStateCopyWithImpl<
  $Res,
  $Val extends OtpVerificationState
>
    implements $OtpVerificationStateCopyWith<$Res> {
  _$OtpVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
    Object? isSubmitting = null,
    Object? isResending = null,
  }) {
    return _then(
      _value.copyWith(
            otp: null == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
                      as String,
            isSubmitting: null == isSubmitting
                ? _value.isSubmitting
                : isSubmitting // ignore: cast_nullable_to_non_nullable
                      as bool,
            isResending: null == isResending
                ? _value.isResending
                : isResending // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OtpVerificationStateImplCopyWith<$Res>
    implements $OtpVerificationStateCopyWith<$Res> {
  factory _$$OtpVerificationStateImplCopyWith(
    _$OtpVerificationStateImpl value,
    $Res Function(_$OtpVerificationStateImpl) then,
  ) = __$$OtpVerificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String otp, bool isSubmitting, bool isResending});
}

/// @nodoc
class __$$OtpVerificationStateImplCopyWithImpl<$Res>
    extends _$OtpVerificationStateCopyWithImpl<$Res, _$OtpVerificationStateImpl>
    implements _$$OtpVerificationStateImplCopyWith<$Res> {
  __$$OtpVerificationStateImplCopyWithImpl(
    _$OtpVerificationStateImpl _value,
    $Res Function(_$OtpVerificationStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
    Object? isSubmitting = null,
    Object? isResending = null,
  }) {
    return _then(
      _$OtpVerificationStateImpl(
        otp: null == otp
            ? _value.otp
            : otp // ignore: cast_nullable_to_non_nullable
                  as String,
        isSubmitting: null == isSubmitting
            ? _value.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        isResending: null == isResending
            ? _value.isResending
            : isResending // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$OtpVerificationStateImpl implements _OtpVerificationState {
  const _$OtpVerificationStateImpl({
    this.otp = '',
    this.isSubmitting = false,
    this.isResending = false,
  });

  @override
  @JsonKey()
  final String otp;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isResending;

  @override
  String toString() {
    return 'OtpVerificationState(otp: $otp, isSubmitting: $isSubmitting, isResending: $isResending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationStateImpl &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isResending, isResending) ||
                other.isResending == isResending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp, isSubmitting, isResending);

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationStateImplCopyWith<_$OtpVerificationStateImpl>
  get copyWith =>
      __$$OtpVerificationStateImplCopyWithImpl<_$OtpVerificationStateImpl>(
        this,
        _$identity,
      );
}

abstract class _OtpVerificationState implements OtpVerificationState {
  const factory _OtpVerificationState({
    final String otp,
    final bool isSubmitting,
    final bool isResending,
  }) = _$OtpVerificationStateImpl;

  @override
  String get otp;
  @override
  bool get isSubmitting;
  @override
  bool get isResending;

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerificationStateImplCopyWith<_$OtpVerificationStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
