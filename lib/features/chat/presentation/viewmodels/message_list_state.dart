import 'package:alo_tho/core/utils/copy_with.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_preview.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';

enum MessageSortOption { latest, oldest }

class MessageListState {
  const MessageListState({
    this.isLoading = true,
    this.errorMessage,
    this.allPreviews = const [],
    this.filteredPreviews = const [],
    this.recommendedWorkers = const [],
    this.searchQuery = '',
    this.unreadOnly = false,
    this.sortOption = MessageSortOption.latest,
  });

  final bool isLoading;
  final String? errorMessage;
  final List<ChatPreview> allPreviews;
  final List<ChatPreview> filteredPreviews;
  final List<Worker> recommendedWorkers;
  final String searchQuery;
  final bool unreadOnly;
  final MessageSortOption sortOption;

  MessageListState copyWith({
    bool? isLoading,
    Object? errorMessage = copyWithUnchanged,
    List<ChatPreview>? allPreviews,
    List<ChatPreview>? filteredPreviews,
    List<Worker>? recommendedWorkers,
    String? searchQuery,
    bool? unreadOnly,
    MessageSortOption? sortOption,
  }) {
    return MessageListState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: copyWithNullable<String>(errorMessage, this.errorMessage),
      allPreviews: allPreviews ?? this.allPreviews,
      filteredPreviews: filteredPreviews ?? this.filteredPreviews,
      recommendedWorkers: recommendedWorkers ?? this.recommendedWorkers,
      searchQuery: searchQuery ?? this.searchQuery,
      unreadOnly: unreadOnly ?? this.unreadOnly,
      sortOption: sortOption ?? this.sortOption,
    );
  }
}
