import 'package:chat_bot/feature/chat/data/gemenai_chat_repo/gemenai_chat%20repo_impl.dart';
import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late GemenaiChatRepoImpl gemenaiChatRepoImpl;
  late MockedChatApiService mockedChatApiService;

  setUp(() {
    mockedChatApiService = MockedChatApiService();
    gemenaiChatRepoImpl = GemenaiChatRepoImpl(
      chatApiService: mockedChatApiService,
    );
  });
  setUpAll(() {});

  group('GemenaiChatRepoImpl.sendMessages validations', () {
    test('should throw ArgumentError when messages is empty', () async {
      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: []),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw ArgumentError when messages length < 1', () async {
      expect(
        () => gemenaiChatRepoImpl.sendMessages(messages: [
          // ChatMessageModel(
          //   role: 'user',
          //   parts: [ChatMessagePartModel(text: 'hi')],
          // ),
        ]),
        throwsA(isA<ArgumentError>()),
      );
    });

    test(
      'should throw ArgumentError when last message is not from user',
      () async {
        final msgs = [
          ChatMessageModel.fromUserMessage('hi'),
          ChatMessageModel(
            parts: [ChatMessagePartModel(text: 'bot')],
            role: 'model',
          ),
        ];
        expect(
          () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
          throwsA(isA<ArgumentError>()),
        );
      },
    );

    test(
      'should throw ArgumentError when last message content is empty',
      () async {
        final msgs = [
          ChatMessageModel.fromUserMessage('hi'),
          ChatMessageModel(
            parts: [ChatMessagePartModel(text: '')],
            role: 'user',
          ),
        ];
        expect(
          () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
          throwsA(isA<ArgumentError>()),
        );
      },
    );

    test(
      'should throw ArgumentError when last message content is whitespace only',
      () async {
        final msgs = [
          ChatMessageModel.fromUserMessage('hi'),
          ChatMessageModel(
            parts: [ChatMessagePartModel(text: '   ')],
            role: 'user',
          ),
        ];
        expect(
          () => gemenaiChatRepoImpl.sendMessages(messages: msgs),
          throwsA(isA<ArgumentError>()),
        );
      },
    );
  });

 
}

class MockedChatApiService extends Mock implements ChatApiService {}
