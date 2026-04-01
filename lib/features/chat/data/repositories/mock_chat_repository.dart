import 'package:alo_tho/core/errors/failure.dart';
import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/chat/data/datasources/mock_chat_data_source.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_preview.dart';
import 'package:alo_tho/features/chat/domain/repositories/chat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final dataSource = ref.watch(chatDataSourceProvider);
  return MockChatRepository(dataSource);
});

class MockChatRepository implements ChatRepository {
  MockChatRepository(this._dataSource);

  final MockChatDataSource _dataSource;

  @override
  Future<Result<List<ChatPreview>>> getChatPreviews() async {
    try {
      final previews = await _dataSource.getChatPreviews();
      return Success(previews.map((item) => item.toEntity()).toList());
    } catch (_) {
      return const Error(Failure('Khong tai duoc danh sach tro chuyen.'));
    }
  }
}
