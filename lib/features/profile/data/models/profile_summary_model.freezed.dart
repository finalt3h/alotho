// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileSummaryModel _$ProfileSummaryModelFromJson(Map<String, dynamic> json) {
  return _ProfileSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileSummaryModel {
  UserModel get user => throw _privateConstructorUsedError;
  WorkerModel? get workerProfile => throw _privateConstructorUsedError;
  bool get isKycSubmitted => throw _privateConstructorUsedError;
  bool get isKycApproved => throw _privateConstructorUsedError;

  /// Serializes this ProfileSummaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileSummaryModelCopyWith<ProfileSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSummaryModelCopyWith<$Res> {
  factory $ProfileSummaryModelCopyWith(
    ProfileSummaryModel value,
    $Res Function(ProfileSummaryModel) then,
  ) = _$ProfileSummaryModelCopyWithImpl<$Res, ProfileSummaryModel>;
  @useResult
  $Res call({
    UserModel user,
    WorkerModel? workerProfile,
    bool isKycSubmitted,
    bool isKycApproved,
  });

  $UserModelCopyWith<$Res> get user;
  $WorkerModelCopyWith<$Res>? get workerProfile;
}

/// @nodoc
class _$ProfileSummaryModelCopyWithImpl<$Res, $Val extends ProfileSummaryModel>
    implements $ProfileSummaryModelCopyWith<$Res> {
  _$ProfileSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileSummaryModel
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
                      as UserModel,
            workerProfile: freezed == workerProfile
                ? _value.workerProfile
                : workerProfile // ignore: cast_nullable_to_non_nullable
                      as WorkerModel?,
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

  /// Create a copy of ProfileSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of ProfileSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkerModelCopyWith<$Res>? get workerProfile {
    if (_value.workerProfile == null) {
      return null;
    }

    return $WorkerModelCopyWith<$Res>(_value.workerProfile!, (value) {
      return _then(_value.copyWith(workerProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileSummaryModelImplCopyWith<$Res>
    implements $ProfileSummaryModelCopyWith<$Res> {
  factory _$$ProfileSummaryModelImplCopyWith(
    _$ProfileSummaryModelImpl value,
    $Res Function(_$ProfileSummaryModelImpl) then,
  ) = __$$ProfileSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserModel user,
    WorkerModel? workerProfile,
    bool isKycSubmitted,
    bool isKycApproved,
  });

  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $WorkerModelCopyWith<$Res>? get workerProfile;
}

/// @nodoc
class __$$ProfileSummaryModelImplCopyWithImpl<$Res>
    extends _$ProfileSummaryModelCopyWithImpl<$Res, _$ProfileSummaryModelImpl>
    implements _$$ProfileSummaryModelImplCopyWith<$Res> {
  __$$ProfileSummaryModelImplCopyWithImpl(
    _$ProfileSummaryModelImpl _value,
    $Res Function(_$ProfileSummaryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileSummaryModel
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
      _$ProfileSummaryModelImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        workerProfile: freezed == workerProfile
            ? _value.workerProfile
            : workerProfile // ignore: cast_nullable_to_non_nullable
                  as WorkerModel?,
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
@JsonSerializable()
class _$ProfileSummaryModelImpl extends _ProfileSummaryModel {
  const _$ProfileSummaryModelImpl({
    required this.user,
    this.workerProfile,
    required this.isKycSubmitted,
    required this.isKycApproved,
  }) : super._();

  factory _$ProfileSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileSummaryModelImplFromJson(json);

  @override
  final UserModel user;
  @override
  final WorkerModel? workerProfile;
  @override
  final bool isKycSubmitted;
  @override
  final bool isKycApproved;

  @override
  String toString() {
    return 'ProfileSummaryModel(user: $user, workerProfile: $workerProfile, isKycSubmitted: $isKycSubmitted, isKycApproved: $isKycApproved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSummaryModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.workerProfile, workerProfile) ||
                other.workerProfile == workerProfile) &&
            (identical(other.isKycSubmitted, isKycSubmitted) ||
                other.isKycSubmitted == isKycSubmitted) &&
            (identical(other.isKycApproved, isKycApproved) ||
                other.isKycApproved == isKycApproved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    user,
    workerProfile,
    isKycSubmitted,
    isKycApproved,
  );

  /// Create a copy of ProfileSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSummaryModelImplCopyWith<_$ProfileSummaryModelImpl> get copyWith =>
      __$$ProfileSummaryModelImplCopyWithImpl<_$ProfileSummaryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileSummaryModelImplToJson(this);
  }
}

abstract class _ProfileSummaryModel extends ProfileSummaryModel {
  const factory _ProfileSummaryModel({
    required final UserModel user,
    final WorkerModel? workerProfile,
    required final bool isKycSubmitted,
    required final bool isKycApproved,
  }) = _$ProfileSummaryModelImpl;
  const _ProfileSummaryModel._() : super._();

  factory _ProfileSummaryModel.fromJson(Map<String, dynamic> json) =
      _$ProfileSummaryModelImpl.fromJson;

  @override
  UserModel get user;
  @override
  WorkerModel? get workerProfile;
  @override
  bool get isKycSubmitted;
  @override
  bool get isKycApproved;

  /// Create a copy of ProfileSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileSummaryModelImplCopyWith<_$ProfileSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
