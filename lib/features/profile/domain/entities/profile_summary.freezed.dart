// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileSummary {
  User get user => throw _privateConstructorUsedError;
  Worker? get workerProfile => throw _privateConstructorUsedError;
  bool get isKycSubmitted => throw _privateConstructorUsedError;
  bool get isKycApproved => throw _privateConstructorUsedError;

  /// Create a copy of ProfileSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileSummaryCopyWith<ProfileSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSummaryCopyWith<$Res> {
  factory $ProfileSummaryCopyWith(
    ProfileSummary value,
    $Res Function(ProfileSummary) then,
  ) = _$ProfileSummaryCopyWithImpl<$Res, ProfileSummary>;
  @useResult
  $Res call({
    User user,
    Worker? workerProfile,
    bool isKycSubmitted,
    bool isKycApproved,
  });

  $UserCopyWith<$Res> get user;
  $WorkerCopyWith<$Res>? get workerProfile;
}

/// @nodoc
class _$ProfileSummaryCopyWithImpl<$Res, $Val extends ProfileSummary>
    implements $ProfileSummaryCopyWith<$Res> {
  _$ProfileSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? workerProfile = freezed,
    Object? isKycSubmitted = null,
    Object? isKycApproved = null,
  }) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as User,
            workerProfile: freezed == workerProfile
                ? _value.workerProfile
                : workerProfile // ignore: cast_nullable_to_non_nullable
                      as Worker?,
            isKycSubmitted: null == isKycSubmitted
                ? _value.isKycSubmitted
                : isKycSubmitted // ignore: cast_nullable_to_non_nullable
                      as bool,
            isKycApproved: null == isKycApproved
                ? _value.isKycApproved
                : isKycApproved // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of ProfileSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkerCopyWith<$Res>? get workerProfile {
    if (_value.workerProfile == null) {
      return null;
    }

    return $WorkerCopyWith<$Res>(_value.workerProfile!, (value) {
      return _then(_value.copyWith(workerProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileSummaryImplCopyWith<$Res>
    implements $ProfileSummaryCopyWith<$Res> {
  factory _$$ProfileSummaryImplCopyWith(
    _$ProfileSummaryImpl value,
    $Res Function(_$ProfileSummaryImpl) then,
  ) = __$$ProfileSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    User user,
    Worker? workerProfile,
    bool isKycSubmitted,
    bool isKycApproved,
  });

  @override
  $UserCopyWith<$Res> get user;
  @override
  $WorkerCopyWith<$Res>? get workerProfile;
}

/// @nodoc
class __$$ProfileSummaryImplCopyWithImpl<$Res>
    extends _$ProfileSummaryCopyWithImpl<$Res, _$ProfileSummaryImpl>
    implements _$$ProfileSummaryImplCopyWith<$Res> {
  __$$ProfileSummaryImplCopyWithImpl(
    _$ProfileSummaryImpl _value,
    $Res Function(_$ProfileSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? workerProfile = freezed,
    Object? isKycSubmitted = null,
    Object? isKycApproved = null,
  }) {
    return _then(
      _$ProfileSummaryImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as User,
        workerProfile: freezed == workerProfile
            ? _value.workerProfile
            : workerProfile // ignore: cast_nullable_to_non_nullable
                  as Worker?,
        isKycSubmitted: null == isKycSubmitted
            ? _value.isKycSubmitted
            : isKycSubmitted // ignore: cast_nullable_to_non_nullable
                  as bool,
        isKycApproved: null == isKycApproved
            ? _value.isKycApproved
            : isKycApproved // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ProfileSummaryImpl implements _ProfileSummary {
  const _$ProfileSummaryImpl({
    required this.user,
    this.workerProfile,
    required this.isKycSubmitted,
    required this.isKycApproved,
  });

  @override
  final User user;
  @override
  final Worker? workerProfile;
  @override
  final bool isKycSubmitted;
  @override
  final bool isKycApproved;

  @override
  String toString() {
    return 'ProfileSummary(user: $user, workerProfile: $workerProfile, isKycSubmitted: $isKycSubmitted, isKycApproved: $isKycApproved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSummaryImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.workerProfile, workerProfile) ||
                other.workerProfile == workerProfile) &&
            (identical(other.isKycSubmitted, isKycSubmitted) ||
                other.isKycSubmitted == isKycSubmitted) &&
            (identical(other.isKycApproved, isKycApproved) ||
                other.isKycApproved == isKycApproved));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    user,
    workerProfile,
    isKycSubmitted,
    isKycApproved,
  );

  /// Create a copy of ProfileSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSummaryImplCopyWith<_$ProfileSummaryImpl> get copyWith =>
      __$$ProfileSummaryImplCopyWithImpl<_$ProfileSummaryImpl>(
        this,
        _$identity,
      );
}

abstract class _ProfileSummary implements ProfileSummary {
  const factory _ProfileSummary({
    required final User user,
    final Worker? workerProfile,
    required final bool isKycSubmitted,
    required final bool isKycApproved,
  }) = _$ProfileSummaryImpl;

  @override
  User get user;
  @override
  Worker? get workerProfile;
  @override
  bool get isKycSubmitted;
  @override
  bool get isKycApproved;

  /// Create a copy of ProfileSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileSummaryImplCopyWith<_$ProfileSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
