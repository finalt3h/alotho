// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkerSearchState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<ServiceCategory> get categories => throw _privateConstructorUsedError;
  List<Worker> get allWorkers => throw _privateConstructorUsedError;
  List<Worker> get filteredWorkers => throw _privateConstructorUsedError;
  List<String> get suggestedAreas => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  String? get selectedCategoryId => throw _privateConstructorUsedError;

  /// Create a copy of WorkerSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkerSearchStateCopyWith<WorkerSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerSearchStateCopyWith<$Res> {
  factory $WorkerSearchStateCopyWith(
    WorkerSearchState value,
    $Res Function(WorkerSearchState) then,
  ) = _$WorkerSearchStateCopyWithImpl<$Res, WorkerSearchState>;
  @useResult
  $Res call({
    bool isLoading,
    String? errorMessage,
    List<ServiceCategory> categories,
    List<Worker> allWorkers,
    List<Worker> filteredWorkers,
    List<String> suggestedAreas,
    String searchQuery,
    String? selectedCategoryId,
  });
}

/// @nodoc
class _$WorkerSearchStateCopyWithImpl<$Res, $Val extends WorkerSearchState>
    implements $WorkerSearchStateCopyWith<$Res> {
  _$WorkerSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkerSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? categories = null,
    Object? allWorkers = null,
    Object? filteredWorkers = null,
    Object? suggestedAreas = null,
    Object? searchQuery = null,
    Object? selectedCategoryId = freezed,
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
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<ServiceCategory>,
            allWorkers: null == allWorkers
                ? _value.allWorkers
                : allWorkers // ignore: cast_nullable_to_non_nullable
                      as List<Worker>,
            filteredWorkers: null == filteredWorkers
                ? _value.filteredWorkers
                : filteredWorkers // ignore: cast_nullable_to_non_nullable
                      as List<Worker>,
            suggestedAreas: null == suggestedAreas
                ? _value.suggestedAreas
                : suggestedAreas // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            searchQuery: null == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedCategoryId: freezed == selectedCategoryId
                ? _value.selectedCategoryId
                : selectedCategoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkerSearchStateImplCopyWith<$Res>
    implements $WorkerSearchStateCopyWith<$Res> {
  factory _$$WorkerSearchStateImplCopyWith(
    _$WorkerSearchStateImpl value,
    $Res Function(_$WorkerSearchStateImpl) then,
  ) = __$$WorkerSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    String? errorMessage,
    List<ServiceCategory> categories,
    List<Worker> allWorkers,
    List<Worker> filteredWorkers,
    List<String> suggestedAreas,
    String searchQuery,
    String? selectedCategoryId,
  });
}

/// @nodoc
class __$$WorkerSearchStateImplCopyWithImpl<$Res>
    extends _$WorkerSearchStateCopyWithImpl<$Res, _$WorkerSearchStateImpl>
    implements _$$WorkerSearchStateImplCopyWith<$Res> {
  __$$WorkerSearchStateImplCopyWithImpl(
    _$WorkerSearchStateImpl _value,
    $Res Function(_$WorkerSearchStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkerSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? categories = null,
    Object? allWorkers = null,
    Object? filteredWorkers = null,
    Object? suggestedAreas = null,
    Object? searchQuery = null,
    Object? selectedCategoryId = freezed,
  }) {
    return _then(
      _$WorkerSearchStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<ServiceCategory>,
        allWorkers: null == allWorkers
            ? _value._allWorkers
            : allWorkers // ignore: cast_nullable_to_non_nullable
                  as List<Worker>,
        filteredWorkers: null == filteredWorkers
            ? _value._filteredWorkers
            : filteredWorkers // ignore: cast_nullable_to_non_nullable
                  as List<Worker>,
        suggestedAreas: null == suggestedAreas
            ? _value._suggestedAreas
            : suggestedAreas // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedCategoryId: freezed == selectedCategoryId
            ? _value.selectedCategoryId
            : selectedCategoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$WorkerSearchStateImpl implements _WorkerSearchState {
  const _$WorkerSearchStateImpl({
    this.isLoading = true,
    this.errorMessage,
    final List<ServiceCategory> categories = const [],
    final List<Worker> allWorkers = const [],
    final List<Worker> filteredWorkers = const [],
    final List<String> suggestedAreas = const [],
    this.searchQuery = '',
    this.selectedCategoryId,
  }) : _categories = categories,
       _allWorkers = allWorkers,
       _filteredWorkers = filteredWorkers,
       _suggestedAreas = suggestedAreas;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  final List<ServiceCategory> _categories;
  @override
  @JsonKey()
  List<ServiceCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Worker> _allWorkers;
  @override
  @JsonKey()
  List<Worker> get allWorkers {
    if (_allWorkers is EqualUnmodifiableListView) return _allWorkers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allWorkers);
  }

  final List<Worker> _filteredWorkers;
  @override
  @JsonKey()
  List<Worker> get filteredWorkers {
    if (_filteredWorkers is EqualUnmodifiableListView) return _filteredWorkers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredWorkers);
  }

  final List<String> _suggestedAreas;
  @override
  @JsonKey()
  List<String> get suggestedAreas {
    if (_suggestedAreas is EqualUnmodifiableListView) return _suggestedAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedAreas);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  final String? selectedCategoryId;

  @override
  String toString() {
    return 'WorkerSearchState(isLoading: $isLoading, errorMessage: $errorMessage, categories: $categories, allWorkers: $allWorkers, filteredWorkers: $filteredWorkers, suggestedAreas: $suggestedAreas, searchQuery: $searchQuery, selectedCategoryId: $selectedCategoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerSearchStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            const DeepCollectionEquality().equals(
              other._allWorkers,
              _allWorkers,
            ) &&
            const DeepCollectionEquality().equals(
              other._filteredWorkers,
              _filteredWorkers,
            ) &&
            const DeepCollectionEquality().equals(
              other._suggestedAreas,
              _suggestedAreas,
            ) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    errorMessage,
    const DeepCollectionEquality().hash(_categories),
    const DeepCollectionEquality().hash(_allWorkers),
    const DeepCollectionEquality().hash(_filteredWorkers),
    const DeepCollectionEquality().hash(_suggestedAreas),
    searchQuery,
    selectedCategoryId,
  );

  /// Create a copy of WorkerSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerSearchStateImplCopyWith<_$WorkerSearchStateImpl> get copyWith =>
      __$$WorkerSearchStateImplCopyWithImpl<_$WorkerSearchStateImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkerSearchState implements WorkerSearchState {
  const factory _WorkerSearchState({
    final bool isLoading,
    final String? errorMessage,
    final List<ServiceCategory> categories,
    final List<Worker> allWorkers,
    final List<Worker> filteredWorkers,
    final List<String> suggestedAreas,
    final String searchQuery,
    final String? selectedCategoryId,
  }) = _$WorkerSearchStateImpl;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  List<ServiceCategory> get categories;
  @override
  List<Worker> get allWorkers;
  @override
  List<Worker> get filteredWorkers;
  @override
  List<String> get suggestedAreas;
  @override
  String get searchQuery;
  @override
  String? get selectedCategoryId;

  /// Create a copy of WorkerSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkerSearchStateImplCopyWith<_$WorkerSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
