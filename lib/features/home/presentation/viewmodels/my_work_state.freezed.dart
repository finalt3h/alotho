// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_work_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MyWorkState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<WorkListing> get listings => throw _privateConstructorUsedError;

  /// Create a copy of MyWorkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyWorkStateCopyWith<MyWorkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyWorkStateCopyWith<$Res> {
  factory $MyWorkStateCopyWith(
    MyWorkState value,
    $Res Function(MyWorkState) then,
  ) = _$MyWorkStateCopyWithImpl<$Res, MyWorkState>;
  @useResult
  $Res call({bool isLoading, String? errorMessage, List<WorkListing> listings});
}

/// @nodoc
class _$MyWorkStateCopyWithImpl<$Res, $Val extends MyWorkState>
    implements $MyWorkStateCopyWith<$Res> {
  _$MyWorkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyWorkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? listings = null,
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
            listings: null == listings
                ? _value.listings
                : listings // ignore: cast_nullable_to_non_nullable
                      as List<WorkListing>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MyWorkStateImplCopyWith<$Res>
    implements $MyWorkStateCopyWith<$Res> {
  factory _$$MyWorkStateImplCopyWith(
    _$MyWorkStateImpl value,
    $Res Function(_$MyWorkStateImpl) then,
  ) = __$$MyWorkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? errorMessage, List<WorkListing> listings});
}

/// @nodoc
class __$$MyWorkStateImplCopyWithImpl<$Res>
    extends _$MyWorkStateCopyWithImpl<$Res, _$MyWorkStateImpl>
    implements _$$MyWorkStateImplCopyWith<$Res> {
  __$$MyWorkStateImplCopyWithImpl(
    _$MyWorkStateImpl _value,
    $Res Function(_$MyWorkStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyWorkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? listings = null,
  }) {
    return _then(
      _$MyWorkStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        listings: null == listings
            ? _value._listings
            : listings // ignore: cast_nullable_to_non_nullable
                  as List<WorkListing>,
      ),
    );
  }
}

/// @nodoc

class _$MyWorkStateImpl implements _MyWorkState {
  const _$MyWorkStateImpl({
    this.isLoading = true,
    this.errorMessage,
    final List<WorkListing> listings = const [],
  }) : _listings = listings;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  final List<WorkListing> _listings;
  @override
  @JsonKey()
  List<WorkListing> get listings {
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listings);
  }

  @override
  String toString() {
    return 'MyWorkState(isLoading: $isLoading, errorMessage: $errorMessage, listings: $listings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyWorkStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._listings, _listings));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    errorMessage,
    const DeepCollectionEquality().hash(_listings),
  );

  /// Create a copy of MyWorkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyWorkStateImplCopyWith<_$MyWorkStateImpl> get copyWith =>
      __$$MyWorkStateImplCopyWithImpl<_$MyWorkStateImpl>(this, _$identity);
}

abstract class _MyWorkState implements MyWorkState {
  const factory _MyWorkState({
    final bool isLoading,
    final String? errorMessage,
    final List<WorkListing> listings,
  }) = _$MyWorkStateImpl;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  List<WorkListing> get listings;

  /// Create a copy of MyWorkState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyWorkStateImplCopyWith<_$MyWorkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
