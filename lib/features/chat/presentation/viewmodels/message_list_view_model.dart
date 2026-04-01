import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/chat/data/repositories/mock_chat_repository.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_preview.dart';
import 'package:alo_tho/features/chat/presentation/viewmodels/message_list_state.dart';
import 'package:alo_tho/features/worker_search/data/repositories/mock_worker_repository.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageListControllerProvider =
    NotifierProvider<MessageListController, MessageListState>(
      MessageListController.new,
    );

class MessageListController extends Notifier<MessageListState> {
  bool _didBootstrap = false;

  @override
  MessageListState build() {
    if (!_didBootstrap) {
      _didBootstrap = true;
      Future<void>.microtask(load);
    }

    return const MessageListState();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final previewsResult = await ref
        .read(chatRepositoryProvider)
        .getChatPreviews();
    final workersResult = await ref.read(workerRepositoryProvider).getWorkers();

    switch ((previewsResult, workersResult)) {
      case (Success(value: final previews), Success(value: final workers)):
        state = state.copyWith(
          isLoading: false,
          allPreviews: previews,
          recommendedWorkers: _pickRecommendedWorkers(workers),
          filteredPreviews: _applyFilters(
            previews: previews,
            searchQuery: state.searchQuery,
            unreadOnly: state.unreadOnly,
            sortOption: state.sortOption,
          ),
        );
      case (Error(failure: final failure), _):
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      case (_, Error(failure: final failure)):
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
    }
  }

  void updateSearchQuery(String value) {
    state = state.copyWith(
      searchQuery: value,
      filteredPreviews: _applyFilters(
        previews: state.allPreviews,
        searchQuery: value,
        unreadOnly: state.unreadOnly,
        sortOption: state.sortOption,
      ),
    );
  }

  void toggleUnreadOnly(bool value) {
    state = state.copyWith(
      unreadOnly: value,
      filteredPreviews: _applyFilters(
        previews: state.allPreviews,
        searchQuery: state.searchQuery,
        unreadOnly: value,
        sortOption: state.sortOption,
      ),
    );
  }

  void changeSortOption(MessageSortOption option) {
    state = state.copyWith(
      sortOption: option,
      filteredPreviews: _applyFilters(
        previews: state.allPreviews,
        searchQuery: state.searchQuery,
        unreadOnly: state.unreadOnly,
        sortOption: option,
      ),
    );
  }

  List<ChatPreview> _applyFilters({
    required List<ChatPreview> previews,
    required String searchQuery,
    required bool unreadOnly,
    required MessageSortOption sortOption,
  }) {
    final normalized = searchQuery.toLowerCase();

    final filtered = previews.where((preview) {
      final matchesQuery =
          normalized.isEmpty ||
          preview.workerName.toLowerCase().contains(normalized) ||
          preview.professionTitle.toLowerCase().contains(normalized) ||
          preview.lastMessage.toLowerCase().contains(normalized);
      final matchesReadStatus = !unreadOnly || !preview.isRead;

      return matchesQuery && matchesReadStatus;
    }).toList();

    filtered.sort((left, right) {
      final comparator = left.updatedAt.compareTo(right.updatedAt);
      return sortOption == MessageSortOption.latest ? -comparator : comparator;
    });

    return filtered;
  }

  List<Worker> _pickRecommendedWorkers(List<Worker> workers) {
    final recommended = [...workers]
      ..sort((left, right) {
        final ratingCompare = right.rating.compareTo(left.rating);
        if (ratingCompare != 0) {
          return ratingCompare;
        }

        return left.distanceInKm.compareTo(right.distanceInKm);
      });

    return recommended.take(3).toList();
  }
}
