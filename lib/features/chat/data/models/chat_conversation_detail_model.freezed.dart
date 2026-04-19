// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_conversation_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatConversationDetailModel _$ChatConversationDetailModelFromJson(
  Map<String, dynamic> json,
) {
  return _ChatConversationDetailModel.fromJson(json);
}

/// @nodoc
mixin _$ChatConversationDetailModel {
  String get conversationId => throw _privateConstructorUsedError;
  String get workerId => throw _privateConstructorUsedError;
  String get workerName => throw _privateConstructorUsedError;
  String get workerAvatarUrl => throw _privateConstructorUsedError;
  String get professionTitle => throw _privateConstructorUsedError;
  bool get isWorkerOnline => throw _privateConstructorUsedError;
  DateTime get lastActiveAt => throw _privateConstructorUsedError;
  List<ChatMessageModel> get messages => throw _privateConstructorUsedError;

  /// Serializes this ChatConversationDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatConversationDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatConversationDetailModelCopyWith<ChatConversationDetailModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatConversationDetailModelCopyWith<$Res> {
  factory $ChatConversationDetailModelCopyWith(
    ChatConversationDetailModel value,
    $Res Function(ChatConversationDetailModel) then,
  ) =
      _$ChatConversationDetailModelCopyWithImpl<
        $Res,
        ChatConversationDetailModel
      >;
  @useResult
  $Res call({
    String conversationId,
    String workerId,
    String workerName,
    String workerAvatarUrl,
    String professionTitle,
    bool isWorkerOnline,
    DateTime lastActiveAt,
    List<ChatMessageModel> messages,
  });
}

/// @nodoc
class _$ChatConversationDetailModelCopyWithImpl<
  $Res,
  $Val extends ChatConversationDetailModel
>
    implements $ChatConversationDetailModelCopyWith<$Res> {
  _$ChatConversationDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatConversationDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? workerId = null,
    Object? workerName = null,
    Object? workerAvatarUrl = null,
    Object? professionTitle = null,
    Object? isWorkerOnline = null,
    Object? lastActiveAt = null,
    Object? messages = null,
  }) {
    return _then(
      _value.copyWith(
            conversationId: null == conversationId
                ? _value.conversationId
                : conversationId // ignore: cast_nullable_to_non_nullable
                      as String,
            workerId: null == workerId
                ? _value.workerId
                : workerId // ignore: cast_nullable_to_non_nullable
                      as String,
            workerName: null == workerName
                ? _value.workerName
                : workerName // ignore: cast_nullable_to_non_nullable
                      as String,
            workerAvatarUrl: null == workerAvatarUrl
                ? _value.workerAvatarUrl
                : workerAvatarUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            professionTitle: null == professionTitle
                ? _value.professionTitle
                : professionTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            isWorkerOnline: null == isWorkerOnline
                ? _value.isWorkerOnline
                : isWorkerOnline // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastActiveAt: null == lastActiveAt
                ? _value.lastActiveAt
                : lastActiveAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<ChatMessageModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatConversationDetailModelImplCopyWith<$Res>
    implements $ChatConversationDetailModelCopyWith<$Res> {
  factory _$$ChatConversationDetailModelImplCopyWith(
    _$ChatConversationDetailModelImpl value,
    $Res Function(_$ChatConversationDetailModelImpl) then,
  ) = __$$ChatConversationDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String conversationId,
    String workerId,
    String workerName,
    String workerAvatarUrl,
    String professionTitle,
    bool isWorkerOnline,
    DateTime lastActiveAt,
    List<ChatMessageModel> messages,
  });
}

/// @nodoc
class __$$ChatConversationDetailModelImplCopyWithImpl<$Res>
    extends
        _$ChatConversationDetailModelCopyWithImpl<
          $Res,
          _$ChatConversationDetailModelImpl
        >
    implements _$$ChatConversationDetailModelImplCopyWith<$Res> {
  __$$ChatConversationDetailModelImplCopyWithImpl(
    _$ChatConversationDetailModelImpl _value,
    $Res Function(_$ChatConversationDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatConversationDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? workerId = null,
    Object? workerName = null,
    Object? workerAvatarUrl = null,
    Object? professionTitle = null,
    Object? isWorkerOnline = null,
    Object? lastActiveAt = null,
    Object? messages = null,
  }) {
    return _then(
      _$ChatConversationDetailModelImpl(
        conversationId: null == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String,
        workerId: null == workerId
            ? _value.workerId
            : workerId // ignore: cast_nullable_to_non_nullable
                  as String,
        workerName: null == workerName
            ? _value.workerName
            : workerName // ignore: cast_nullable_to_non_nullable
                  as String,
        workerAvatarUrl: null == workerAvatarUrl
            ? _value.workerAvatarUrl
            : workerAvatarUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        professionTitle: null == professionTitle
            ? _value.professionTitle
            : professionTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        isWorkerOnline: null == isWorkerOnline
            ? _value.isWorkerOnline
            : isWorkerOnline // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastActiveAt: null == lastActiveAt
            ? _value.lastActiveAt
            : lastActiveAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<ChatMessageModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatConversationDetailModelImpl extends _ChatConversationDetailModel {
  const _$ChatConversationDetailModelImpl({
    required this.conversationId,
    required this.workerId,
    required this.workerName,
    required this.workerAvatarUrl,
    required this.professionTitle,
    required this.isWorkerOnline,
    required this.lastActiveAt,
    final List<ChatMessageModel> messages = const [],
  }) : _messages = messages,
       super._();

  factory _$ChatConversationDetailModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ChatConversationDetailModelImplFromJson(json);

  @override
  final String conversationId;
  @override
  final String workerId;
  @override
  final String workerName;
  @override
  final String workerAvatarUrl;
  @override
  final String professionTitle;
  @override
  final bool isWorkerOnline;
  @override
  final DateTime lastActiveAt;
  final List<ChatMessageModel> _messages;
  @override
  @JsonKey()
  List<ChatMessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatConversationDetailModel(conversationId: $conversationId, workerId: $workerId, workerName: $workerName, workerAvatarUrl: $workerAvatarUrl, professionTitle: $professionTitle, isWorkerOnline: $isWorkerOnline, lastActiveAt: $lastActiveAt, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatConversationDetailModelImpl &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.workerName, workerName) ||
                other.workerName == workerName) &&
            (identical(other.workerAvatarUrl, workerAvatarUrl) ||
                other.workerAvatarUrl == workerAvatarUrl) &&
            (identical(other.professionTitle, professionTitle) ||
                other.professionTitle == professionTitle) &&
            (identical(other.isWorkerOnline, isWorkerOnline) ||
                other.isWorkerOnline == isWorkerOnline) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    conversationId,
    workerId,
    workerName,
    workerAvatarUrl,
    professionTitle,
    isWorkerOnline,
    lastActiveAt,
    const DeepCollectionEquality().hash(_messages),
  );

  /// Create a copy of ChatConversationDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatConversationDetailModelImplCopyWith<_$ChatConversationDetailModelImpl>
  get copyWith =>
      __$$ChatConversationDetailModelImplCopyWithImpl<
        _$ChatConversationDetailModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatConversationDetailModelImplToJson(this);
  }
}

abstract class _ChatConversationDetailModel
    extends ChatConversationDetailModel {
  const factory _ChatConversationDetailModel({
    required final String conversationId,
    required final String workerId,
    required final String workerName,
    required final String workerAvatarUrl,
    required final String professionTitle,
    required final bool isWorkerOnline,
    required final DateTime lastActiveAt,
    final List<ChatMessageModel> messages,
  }) = _$ChatConversationDetailModelImpl;
  const _ChatConversationDetailModel._() : super._();

  factory _ChatConversationDetailModel.fromJson(Map<String, dynamic> json) =
      _$ChatConversationDetailModelImpl.fromJson;

  @override
  String get conversationId;
  @override
  String get workerId;
  @override
  String get workerName;
  @override
  String get workerAvatarUrl;
  @override
  String get professionTitle;
  @override
  bool get isWorkerOnline;
  @override
  DateTime get lastActiveAt;
  @override
  List<ChatMessageModel> get messages;

  /// Create a copy of ChatConversationDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatConversationDetailModelImplCopyWith<_$ChatConversationDetailModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
