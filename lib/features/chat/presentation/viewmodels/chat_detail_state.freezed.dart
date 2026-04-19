// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  ChatConversationDetail? get conversation =>
      throw _privateConstructorUsedError;
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  bool get isWorkerTyping => throw _privateConstructorUsedError;
  String? get composerImageAssetPath => throw _privateConstructorUsedError;
  List<String> get availableImageAssets => throw _privateConstructorUsedError;

  /// Create a copy of ChatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatDetailStateCopyWith<ChatDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDetailStateCopyWith<$Res> {
  factory $ChatDetailStateCopyWith(
    ChatDetailState value,
    $Res Function(ChatDetailState) then,
  ) = _$ChatDetailStateCopyWithImpl<$Res, ChatDetailState>;
  @useResult
  $Res call({
    bool isLoading,
    String? errorMessage,
    ChatConversationDetail? conversation,
    List<ChatMessage> messages,
    bool isWorkerTyping,
    String? composerImageAssetPath,
    List<String> availableImageAssets,
  });

  $ChatConversationDetailCopyWith<$Res>? get conversation;
}

/// @nodoc
class _$ChatDetailStateCopyWithImpl<$Res, $Val extends ChatDetailState>
    implements $ChatDetailStateCopyWith<$Res> {
  _$ChatDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? conversation = freezed,
    Object? messages = null,
    Object? isWorkerTyping = null,
    Object? composerImageAssetPath = freezed,
    Object? availableImageAssets = null,
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
            conversation: freezed == conversation
                ? _value.conversation
                : conversation // ignore: cast_nullable_to_non_nullable
                      as ChatConversationDetail?,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<ChatMessage>,
            isWorkerTyping: null == isWorkerTyping
                ? _value.isWorkerTyping
                : isWorkerTyping // ignore: cast_nullable_to_non_nullable
                      as bool,
            composerImageAssetPath: freezed == composerImageAssetPath
                ? _value.composerImageAssetPath
                : composerImageAssetPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            availableImageAssets: null == availableImageAssets
                ? _value.availableImageAssets
                : availableImageAssets // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatConversationDetailCopyWith<$Res>? get conversation {
    if (_value.conversation == null) {
      return null;
    }

    return $ChatConversationDetailCopyWith<$Res>(_value.conversation!, (value) {
      return _then(_value.copyWith(conversation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatDetailStateImplCopyWith<$Res>
    implements $ChatDetailStateCopyWith<$Res> {
  factory _$$ChatDetailStateImplCopyWith(
    _$ChatDetailStateImpl value,
    $Res Function(_$ChatDetailStateImpl) then,
  ) = __$$ChatDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    String? errorMessage,
    ChatConversationDetail? conversation,
    List<ChatMessage> messages,
    bool isWorkerTyping,
    String? composerImageAssetPath,
    List<String> availableImageAssets,
  });

  @override
  $ChatConversationDetailCopyWith<$Res>? get conversation;
}

/// @nodoc
class __$$ChatDetailStateImplCopyWithImpl<$Res>
    extends _$ChatDetailStateCopyWithImpl<$Res, _$ChatDetailStateImpl>
    implements _$$ChatDetailStateImplCopyWith<$Res> {
  __$$ChatDetailStateImplCopyWithImpl(
    _$ChatDetailStateImpl _value,
    $Res Function(_$ChatDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? conversation = freezed,
    Object? messages = null,
    Object? isWorkerTyping = null,
    Object? composerImageAssetPath = freezed,
    Object? availableImageAssets = null,
  }) {
    return _then(
      _$ChatDetailStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        conversation: freezed == conversation
            ? _value.conversation
            : conversation // ignore: cast_nullable_to_non_nullable
                  as ChatConversationDetail?,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<ChatMessage>,
        isWorkerTyping: null == isWorkerTyping
            ? _value.isWorkerTyping
            : isWorkerTyping // ignore: cast_nullable_to_non_nullable
                  as bool,
        composerImageAssetPath: freezed == composerImageAssetPath
            ? _value.composerImageAssetPath
            : composerImageAssetPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        availableImageAssets: null == availableImageAssets
            ? _value._availableImageAssets
            : availableImageAssets // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$ChatDetailStateImpl implements _ChatDetailState {
  const _$ChatDetailStateImpl({
    this.isLoading = true,
    this.errorMessage,
    this.conversation,
    final List<ChatMessage> messages = const [],
    this.isWorkerTyping = false,
    this.composerImageAssetPath,
    final List<String> availableImageAssets = const [],
  }) : _messages = messages,
       _availableImageAssets = availableImageAssets;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final ChatConversationDetail? conversation;
  final List<ChatMessage> _messages;
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool isWorkerTyping;
  @override
  final String? composerImageAssetPath;
  final List<String> _availableImageAssets;
  @override
  @JsonKey()
  List<String> get availableImageAssets {
    if (_availableImageAssets is EqualUnmodifiableListView)
      return _availableImageAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableImageAssets);
  }

  @override
  String toString() {
    return 'ChatDetailState(isLoading: $isLoading, errorMessage: $errorMessage, conversation: $conversation, messages: $messages, isWorkerTyping: $isWorkerTyping, composerImageAssetPath: $composerImageAssetPath, availableImageAssets: $availableImageAssets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isWorkerTyping, isWorkerTyping) ||
                other.isWorkerTyping == isWorkerTyping) &&
            (identical(other.composerImageAssetPath, composerImageAssetPath) ||
                other.composerImageAssetPath == composerImageAssetPath) &&
            const DeepCollectionEquality().equals(
              other._availableImageAssets,
              _availableImageAssets,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    errorMessage,
    conversation,
    const DeepCollectionEquality().hash(_messages),
    isWorkerTyping,
    composerImageAssetPath,
    const DeepCollectionEquality().hash(_availableImageAssets),
  );

  /// Create a copy of ChatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatDetailStateImplCopyWith<_$ChatDetailStateImpl> get copyWith =>
      __$$ChatDetailStateImplCopyWithImpl<_$ChatDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ChatDetailState implements ChatDetailState {
  const factory _ChatDetailState({
    final bool isLoading,
    final String? errorMessage,
    final ChatConversationDetail? conversation,
    final List<ChatMessage> messages,
    final bool isWorkerTyping,
    final String? composerImageAssetPath,
    final List<String> availableImageAssets,
  }) = _$ChatDetailStateImpl;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  ChatConversationDetail? get conversation;
  @override
  List<ChatMessage> get messages;
  @override
  bool get isWorkerTyping;
  @override
  String? get composerImageAssetPath;
  @override
  List<String> get availableImageAssets;

  /// Create a copy of ChatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatDetailStateImplCopyWith<_$ChatDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
