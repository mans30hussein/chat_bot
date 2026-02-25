import 'package:chat_bot/feature/chat/data/gemenai_chat_repo/gemenai_chat%20repo_impl.dart';
import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late GemenaiChatRepoImpl gemenaiChatRepoImpl;
  late MockedChatApiService mockedChatApiService;

  setUp(() {
    mockedChatApiService = MockedChatApiService();
    gemenaiChatRepoImpl = GemenaiChatRepoImpl(chatApiService: mockedChatApiService);
  });

  group('GemenaiChatRepoImpl.sendMessages validations', () {
    test('should throw ArgumentError when messages is empty', () async {
      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: []),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw ArgumentError when messages length < 2', () async {
      final msgs = [ChatMessageModel.fromUserMessage('hi')];
      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw ArgumentError when last message is not from user', () async {
      final msgs = [
        ChatMessageModel.fromUserMessage('hi'),
        ChatMessageModel(parts: [ChatMessagePartModel(text: 'bot')], role: 'model'),
      ];
      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw ArgumentError when last message content is empty', () async {
      final msgs = [
        ChatMessageModel.fromUserMessage('hi'),
        ChatMessageModel(parts: [ChatMessagePartModel(text: '')], role: 'user'),
      ];
      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw ArgumentError when last message content is whitespace only', () async {
      final msgs = [
        ChatMessageModel.fromUserMessage('hi'),
        ChatMessageModel(parts: [ChatMessagePartModel(text: '   ')], role: 'user'),
      ];
      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
        throwsA(isA<ArgumentError>()),
      );
    });
  });


  group('GemenaiChatRepoImpl.sendMessages', () {
    test('should return ChatMessageModel when messages is valid', () async {
      final msgs = [
        ChatMessageModel.fromUserMessage('hi'),
        ChatMessageModel(parts: [ChatMessagePartModel(text: 'hi')], role: 'user'),
      ];
      when(mockedChatApiService.sendMessages(messages: msgs)).thenAnswer((_) async => ChatMessageModel.fromUserMessage('hi'));
      final result = await gemenaiChatRepoImpl.sendMessages(messages: msgs);
      expect(result, ChatMessageModel.fromUserMessage('hi'));
    });
  });
}

class MockedChatApiService extends Mock implements ChatApiService {}