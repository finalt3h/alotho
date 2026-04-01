import 'package:alo_tho/features/chat/domain/entities/chat_preview.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_list_state.freezed.dart';

enum MessageSortOption { latest, oldest }

@freezed
class MessageListState with _$MessageListState {
  const factory MessageListState({
    @Default(true) bool isLoading,
    String? errorMessage,
    @Default([]) List<ChatPreview> allPreviews,
    @Default([]) List<ChatPreview> filteredPreviews,
    @Default([]) List<Worker> recommendedWorkers,
    @Default('') String searchQuery,
    @Default(false) bool unreadOnly,
    @Default(MessageSortOption.latest) MessageSortOption sortOption,
  }) = _MessageListState;
}
