import 'package:bloc/bloc.dart';
import 'package:chat_bot/feature/chat/data/chat_api_servvice/chat_api_service.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_state.dart';

import '../../data/model/chat_message_model.dart/chat_message_model.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatApiService apiService;

  ChatCubit({required this.apiService}) : super(ChatInitial());

  final List<MessageModel> messages = [];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // 1️⃣ أضف رسالة المستخدم فورًا
    messages.add(
      MessageModel(message: text, isMe: true),
    );
    emit(ChatUpdated(List.from(messages)));

    // 2️⃣ أظهر typing indicator
    emit(ChatLoading());

    final body = {
      "contents": [
        {
          "parts": [
            {"text": text},
          ],
        },
      ],
    };

    try {
      // 3️⃣ Call API
      final response = await apiService.sendMessage(body);

      // 4️⃣ استخراج رد البوت
      final botReply =
          response.candidates?.first.content?.parts?.first.text;

      // 5️⃣ أضف رد البوت
      messages.add(
        MessageModel(
          message: botReply ?? 'No response',
          isMe: false,
        ),
      );

      // 6️⃣ تحديث UI
      emit(ChatUpdated(List.from(messages)));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}

