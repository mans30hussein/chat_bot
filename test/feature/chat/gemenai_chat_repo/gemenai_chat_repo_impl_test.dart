import 'package:chat_bot/feature/chat/data/gemenai_chat_repo/gemenai_chat%20repo_impl.dart';
import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:chat_bot/core/failure/failure.dart';
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
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('No messages provided'))),
      );
      verifyNever(mockedChatApiService.sendMessages(messages: anyNamed('messages')));
    });

    test('should throw ArgumentError when messages length < 2', () async {
      final msgs = [ChatMessageModel.fromUserMessage('hi')];
      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('At least two messages are required'))),
      );
      verifyNever(mockedChatApiService.sendMessages(messages: anyNamed('messages')));
    });

    test('should throw ArgumentError when last message is not from user', () async {
      final msgs = [
        ChatMessageModel.fromUserMessage('hi'),
        ChatMessageModel(parts: [ChatMessagePartModel(text: 'bot')], role: 'model'),
      ];
      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('Last message must be user'))),
      );
      verifyNever(mockedChatApiService.sendMessages(messages: anyNamed('messages')));
    });

    test('should throw ArgumentError when last message content is empty', () async {
      final msgs = [
        ChatMessageModel.fromUserMessage('hi'),
        ChatMessageModel(parts: [ChatMessagePartModel(text: '')], role: 'user'),
      ];
      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('Last message content must not be empty'))),
      );
      verifyNever(mockedChatApiService.sendMessages(messages: anyNamed('messages')));
    });

    test('should throw ArgumentError when last message content is whitespace only', () async {
      final msgs = [
        ChatMessageModel.fromUserMessage('hi'),
        ChatMessageModel(parts: [ChatMessagePartModel(text: '   ')], role: 'user'),
      ];
      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('Last message content must not be empty'))),
      );
      verifyNever(mockedChatApiService.sendMessages(messages: anyNamed('messages')));
    });
  });

  group('GemenaiChatRepoImpl.sendMessages integration with ChatApiService', () {
    test('should forward messages to ChatApiService and return its result on success', () async {
      final msgs = [
        ChatMessageModel.fromUserMessage('hello'),
        ChatMessageModel.fromUserMessage('tell me a joke'),
      ];
      final expectedResponse = ChatMessageModel(parts: [ChatMessagePartModel(text: 'Here is a joke')], role: 'model');

      when(mockedChatApiService.sendMessages(messages: anyNamed('messages')))
          .thenAnswer((_) async => expectedResponse);

      final result = await gemenaiChatRepoImpl.sendMessages(messages: msgs);

      expect(result, same(expectedResponse));
      verify(mockedChatApiService.sendMessages(messages: msgs)).called(1);
      verifyNoMoreInteractions(mockedChatApiService);
    });

    test('should wrap ChatApiService exception into ServerFailure', () async {
      final msgs = [
        ChatMessageModel.fromUserMessage('hello'),
        ChatMessageModel.fromUserMessage('tell me a joke'),
      ];

      when(mockedChatApiService.sendMessages(messages: anyNamed('messages')))
          .thenThrow(Exception('network'));

      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
        throwsA(isA<ServerFailure>()),
      );
      verify(mockedChatApiService.sendMessages(messages: msgs)).called(1);
    });
  });
}

class MockedChatApiService extends Mock implements ChatApiService {}