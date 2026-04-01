// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MessageListState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<ChatPreview> get allPreviews => throw _privateConstructorUsedError;
  List<ChatPreview> get filteredPreviews => throw _privateConstructorUsedError;
  List<Worker> get recommendedWorkers => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  bool get unreadOnly => throw _privateConstructorUsedError;
  MessageSortOption get sortOption => throw _privateConstructorUsedError;

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageListStateCopyWith<MessageListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageListStateCopyWith<$Res> {
  factory $MessageListStateCopyWith(
    MessageListState value,
    $Res Function(MessageListState) then,
  ) = _$MessageListStateCopyWithImpl<$Res, MessageListState>;
  @useResult
  $Res call({
    bool isLoading,
    String? errorMessage,
    List<ChatPreview> allPreviews,
    List<ChatPreview> filteredPreviews,
    List<Worker> recommendedWorkers,
    String searchQuery,
    bool unreadOnly,
    MessageSortOption sortOption,
  });
}

/// @nodoc
class _$MessageListStateCopyWithImpl<$Res, $Val extends MessageListState>
    implements $MessageListStateCopyWith<$Res> {
  _$MessageListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? allPreviews = null,
    Object? filteredPreviews = null,
    Object? recommendedWorkers = null,
    Object? searchQuery = null,
    Object? unreadOnly = null,
    Object? sortOption = null,
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
            allPreviews: null == allPreviews
                ? _value.allPreviews
                : allPreviews // ignore: cast_nullable_to_non_nullable
                      as List<ChatPreview>,
            filteredPreviews: null == filteredPreviews
                ? _value.filteredPreviews
                : filteredPreviews // ignore: cast_nullable_to_non_nullable
                      as List<ChatPreview>,
            recommendedWorkers: null == recommendedWorkers
                ? _value.recommendedWorkers
                : recommendedWorkers // ignore: cast_nullable_to_non_nullable
                      as List<Worker>,
            searchQuery: null == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String,
            unreadOnly: null == unreadOnly
                ? _value.unreadOnly
                : unreadOnly // ignore: cast_nullable_to_non_nullable
                      as bool,
            sortOption: null == sortOption
                ? _value.sortOption
                : sortOption // ignore: cast_nullable_to_non_nullable
                      as MessageSortOption,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageListStateImplCopyWith<$Res>
    implements $MessageListStateCopyWith<$Res> {
  factory _$$MessageListStateImplCopyWith(
    _$MessageListStateImpl value,
    $Res Function(_$MessageListStateImpl) then,
  ) = __$$MessageListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    String? errorMessage,
    List<ChatPreview> allPreviews,
    List<ChatPreview> filteredPreviews,
    List<Worker> recommendedWorkers,
    String searchQuery,
    bool unreadOnly,
    MessageSortOption sortOption,
  });
}

/// @nodoc
class __$$MessageListStateImplCopyWithImpl<$Res>
    extends _$MessageListStateCopyWithImpl<$Res, _$MessageListStateImpl>
    implements _$$MessageListStateImplCopyWith<$Res> {
  __$$MessageListStateImplCopyWithImpl(
    _$MessageListStateImpl _value,
    $Res Function(_$MessageListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? allPreviews = null,
    Object? filteredPreviews = null,
    Object? recommendedWorkers = null,
    Object? searchQuery = null,
    Object? unreadOnly = null,
    Object? sortOption = null,
  }) {
    return _then(
      _$MessageListStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        allPreviews: null == allPreviews
            ? _value._allPreviews
            : allPreviews // ignore: cast_nullable_to_non_nullable
                  as List<ChatPreview>,
        filteredPreviews: null == filteredPreviews
            ? _value._filteredPreviews
            : filteredPreviews // ignore: cast_nullable_to_non_nullable
                  as List<ChatPreview>,
        recommendedWorkers: null == recommendedWorkers
            ? _value._recommendedWorkers
            : recommendedWorkers // ignore: cast_nullable_to_non_nullable
                  as List<Worker>,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        unreadOnly: null == unreadOnly
            ? _value.unreadOnly
            : unreadOnly // ignore: cast_nullable_to_non_nullable
                  as bool,
        sortOption: null == sortOption
            ? _value.sortOption
            : sortOption // ignore: cast_nullable_to_non_nullable
                  as MessageSortOption,
      ),
    );
  }
}

/// @nodoc

class _$MessageListStateImpl implements _MessageListState {
  const _$MessageListStateImpl({
    this.isLoading = true,
    this.errorMessage,
    final List<ChatPreview> allPreviews = const [],
    final List<ChatPreview> filteredPreviews = const [],
    final List<Worker> recommendedWorkers = const [],
    this.searchQuery = '',
    this.unreadOnly = false,
    this.sortOption = MessageSortOption.latest,
  }) : _allPreviews = allPreviews,
       _filteredPreviews = filteredPreviews,
       _recommendedWorkers = recommendedWorkers;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  final List<ChatPreview> _allPreviews;
  @override
  @JsonKey()
  List<ChatPreview> get allPreviews {
    if (_allPreviews is EqualUnmodifiableListView) return _allPreviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allPreviews);
  }

  final List<ChatPreview> _filteredPreviews;
  @override
  @JsonKey()
  List<ChatPreview> get filteredPreviews {
    if (_filteredPreviews is EqualUnmodifiableListView)
      return _filteredPreviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredPreviews);
  }

  final List<Worker> _recommendedWorkers;
  @override
  @JsonKey()
  List<Worker> get recommendedWorkers {
    if (_recommendedWorkers is EqualUnmodifiableListView)
      return _recommendedWorkers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedWorkers);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final bool unreadOnly;
  @override
  @JsonKey()
  final MessageSortOption sortOption;

  @override
  String toString() {
    return 'MessageListState(isLoading: $isLoading, errorMessage: $errorMessage, allPreviews: $allPreviews, filteredPreviews: $filteredPreviews, recommendedWorkers: $recommendedWorkers, searchQuery: $searchQuery, unreadOnly: $unreadOnly, sortOption: $sortOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(
              other._allPreviews,
              _allPreviews,
            ) &&
            const DeepCollectionEquality().equals(
              other._filteredPreviews,
              _filteredPreviews,
            ) &&
            const DeepCollectionEquality().equals(
              other._recommendedWorkers,
              _recommendedWorkers,
            ) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.unreadOnly, unreadOnly) ||
                other.unreadOnly == unreadOnly) &&
            (identical(other.sortOption, sortOption) ||
                other.sortOption == sortOption));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    errorMessage,
    const DeepCollectionEquality().hash(_allPreviews),
    const DeepCollectionEquality().hash(_filteredPreviews),
    const DeepCollectionEquality().hash(_recommendedWorkers),
    searchQuery,
    unreadOnly,
    sortOption,
  );

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageListStateImplCopyWith<_$MessageListStateImpl> get copyWith =>
      __$$MessageListStateImplCopyWithImpl<_$MessageListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _MessageListState implements MessageListState {
  const factory _MessageListState({
    final bool isLoading,
    final String? errorMessage,
    final List<ChatPreview> allPreviews,
    final List<ChatPreview> filteredPreviews,
    final List<Worker> recommendedWorkers,
    final String searchQuery,
    final bool unreadOnly,
    final MessageSortOption sortOption,
  }) = _$MessageListStateImpl;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  List<ChatPreview> get allPreviews;
  @override
  List<ChatPreview> get filteredPreviews;
  @override
  List<Worker> get recommendedWorkers;
  @override
  String get searchQuery;
  @override
  bool get unreadOnly;
  @override
  MessageSortOption get sortOption;

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageListStateImplCopyWith<_$MessageListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
