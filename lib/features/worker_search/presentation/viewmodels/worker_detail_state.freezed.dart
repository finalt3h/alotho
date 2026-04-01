// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkerDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Worker? get worker => throw _privateConstructorUsedError;

  /// Create a copy of WorkerDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkerDetailStateCopyWith<WorkerDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerDetailStateCopyWith<$Res> {
  factory $WorkerDetailStateCopyWith(
    WorkerDetailState value,
    $Res Function(WorkerDetailState) then,
  ) = _$WorkerDetailStateCopyWithImpl<$Res, WorkerDetailState>;
  @useResult
  $Res call({bool isLoading, String? errorMessage, Worker? worker});

  $WorkerCopyWith<$Res>? get worker;
}

/// @nodoc
class _$WorkerDetailStateCopyWithImpl<$Res, $Val extends WorkerDetailState>
    implements $WorkerDetailStateCopyWith<$Res> {
  _$WorkerDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkerDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? worker = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            worker: freezed == worker
                ? _value.worker
                : worker // ignore: cast_nullable_to_non_nullable
                      as Worker?,
          )
          as $Val,
    );
  }

  /// Create a copy of WorkerDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkerCopyWith<$Res>? get worker {
    if (_value.worker == null) {
      return null;
    }

    return $WorkerCopyWith<$Res>(_value.worker!, (value) {
      return _then(_value.copyWith(worker: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkerDetailStateImplCopyWith<$Res>
    implements $WorkerDetailStateCopyWith<$Res> {
  factory _$$WorkerDetailStateImplCopyWith(
    _$WorkerDetailStateImpl value,
    $Res Function(_$WorkerDetailStateImpl) then,
  ) = __$$WorkerDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? errorMessage, Worker? worker});

  @override
  $WorkerCopyWith<$Res>? get worker;
}

/// @nodoc
class __$$WorkerDetailStateImplCopyWithImpl<$Res>
    extends _$WorkerDetailStateCopyWithImpl<$Res, _$WorkerDetailStateImpl>
    implements _$$WorkerDetailStateImplCopyWith<$Res> {
  __$$WorkerDetailStateImplCopyWithImpl(
    _$WorkerDetailStateImpl _value,
    $Res Function(_$WorkerDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkerDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? worker = freezed,
  }) {
    return _then(
      _$WorkerDetailStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        worker: freezed == worker
            ? _value.worker
            : worker // ignore: cast_nullable_to_non_nullable
                  as Worker?,
      ),
    );
  }
}

/// @nodoc

class _$WorkerDetailStateImpl implements _WorkerDetailState {
  const _$WorkerDetailStateImpl({
    this.isLoading = true,
    this.errorMessage,
    this.worker,
  });

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final Worker? worker;

  @override
  String toString() {
    return 'WorkerDetailState(isLoading: $isLoading, errorMessage: $errorMessage, worker: $worker)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.worker, worker) || other.worker == worker));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage, worker);

  /// Create a copy of WorkerDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerDetailStateImplCopyWith<_$WorkerDetailStateImpl> get copyWith =>
      __$$WorkerDetailStateImplCopyWithImpl<_$WorkerDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkerDetailState implements WorkerDetailState {
  const factory _WorkerDetailState({
    final bool isLoading,
    final String? errorMessage,
    final Worker? worker,
  }) = _$WorkerDetailStateImpl;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  Worker? get worker;

  /// Create a copy of WorkerDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkerDetailStateImplCopyWith<_$WorkerDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
