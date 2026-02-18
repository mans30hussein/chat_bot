import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:chat_bot/feature/chat/domain/chat_repo/chat_repo.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit({required this.chatRepo}) : super(SendMessageInitial());

  final ChatRepo chatRepo;

  Future<void> sendMessage({required List<ChatMessageModel> messages}) async {
    emit(SendMessageLoading());

    try {
      var chatMessage = await chatRepo.sendMessages(
        messages: messages,
      );

      emit(SendMessageUpdated(messages:chatMessage ));
    } catch (e) {
      emit(SendMessageError('Something went wrong'));
    }
  }
}
