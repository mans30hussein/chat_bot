import 'package:chat_bot/feature/chat/data/gemenai_chat_repo/gemenai_chat%20repo_impl.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'gemenai_chat_repo_impl_input_validation_test.dart';

void main() {
  late MockedChatApiService mockedChatApiService;
  late GemenaiChatRepoImpl gemenaiChatRepoImpl;

  setUp(() {
    mockedChatApiService = MockedChatApiService();
    gemenaiChatRepoImpl = GemenaiChatRepoImpl(
      chatApiService: mockedChatApiService,
    );
  });
   group('Send Messages output validation', () {
    test('should return StateError when role is empty', () async {
      when(
        () =>
            mockedChatApiService.sendMessages(messages: any(named: 'messages')),
      ).thenAnswer(
        (_) async => ChatMessageModel(
          role: "",
          parts: [ChatMessagePartModel(text: "hello")],
        ),
      );

      expectLater(
        gemenaiChatRepoImpl.sendMessages(
          messages: [
            ChatMessageModel(
              parts: [
                ChatMessagePartModel(text: 'hello'),
              ],
              role: 'user',
            ),
          ],
        ),
        throwsA(isA<StateError>()),
      );
    });

    test('should throw StateError when parts is empty', () async {
      when(
        () =>
            mockedChatApiService.sendMessages(messages: any(named: 'messages')),
      ).thenAnswer((_) async => ChatMessageModel(role: "model", parts: []));

      expect(
        () => gemenaiChatRepoImpl.sendMessages(
          messages: [
            ChatMessageModel(
              parts: [
                ChatMessagePartModel(text: 'hello'),
              ],
              role: 'user',
            ),
          ],
        ),
        throwsA(isA<StateError>()),
      );
    });

    test('should throw StateError when text is empty', () async {
      when(
        () =>
            mockedChatApiService.sendMessages(messages: any(named: 'messages')),
      ).thenAnswer(
        (_) async => ChatMessageModel(
          role: "model",
          parts: [ChatMessagePartModel(text: "")],
        ),
      );

      expect(
        () => gemenaiChatRepoImpl.sendMessages(
          messages: [
            ChatMessageModel(
              parts: [ChatMessagePartModel(text: 'hello')],
              role: 'user',
            ),
          ],
        ),
        throwsA(isA<StateError>()),
      );
    });

    test('should throw StateError when role is not model', () async {
      when(
        () =>
            mockedChatApiService.sendMessages(messages: any(named: 'messages')),
      ).thenAnswer(
        (_) async => ChatMessageModel(
          role: "invalid",
          parts: [ChatMessagePartModel(text: "hello")],
        ),
      );

      expect(
        () => gemenaiChatRepoImpl.sendMessages(
          messages: [
            ChatMessageModel(
              parts: [ChatMessagePartModel(text: 'hello')],
              role: 'user',
            ),
          ],
        ),
        throwsA(isA<StateError>()),
      );
    });
  
  
  });
}