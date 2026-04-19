import 'package:alo_tho/features/chat/data/models/chat_message_model.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_conversation_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_conversation_detail_model.freezed.dart';
part 'chat_conversation_detail_model.g.dart';

@freezed
class ChatConversationDetailModel with _$ChatConversationDetailModel {
  const ChatConversationDetailModel._();

  const factory ChatConversationDetailModel({
    required String conversationId,
    required String workerId,
    required String workerName,
    required String workerAvatarUrl,
    required String professionTitle,
    required bool isWorkerOnline,
    required DateTime lastActiveAt,
    @Default([]) List<ChatMessageModel> messages,
  }) = _ChatConversationDetailModel;

  factory ChatConversationDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ChatConversationDetailModelFromJson(json);

  ChatConversationDetail toEntity() => ChatConversationDetail(
    conversationId: conversationId,
    workerId: workerId,
    workerName: workerName,
    workerAvatarUrl: workerAvatarUrl,
    professionTitle: professionTitle,
    isWorkerOnline: isWorkerOnline,
    lastActiveAt: lastActiveAt,
    messages: messages.map((item) => item.toEntity()).toList(),
  );
}
