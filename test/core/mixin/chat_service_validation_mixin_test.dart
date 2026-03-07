import 'package:chat_bot/core/mixin/chat_service_validation_mixin.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ChatServiceValidationMixinMocked chatServiceValidationMixinMocked;

  setUp(() {
    chatServiceValidationMixinMocked = ChatServiceValidationMixinMocked();
  });

  group('ChatServiceValidationMixin', () {
    group('inputValidation', () {
      test('throws ArgumentError when messages is empty', () {
        expect(
          () => chatServiceValidationMixinMocked.inputValidation([]),
          throwsA(isA<ArgumentError>()),
        );
      });

      test("throw ArgumentError when role in last message not user  ", () {
        expect(
          () => chatServiceValidationMixinMocked.inputValidation([
            ChatMessageModel(
              parts: [ChatMessagePartModel(text: "hello")],
              role: "not user", // expact user
            ),
          ]),
          throwsA(isA<ArgumentError>()),
        );
      });
      test("throw ArgumentError when text in last message is empty  ", () {
        expect(
          () => chatServiceValidationMixinMocked.inputValidation([
            ChatMessageModel(
              parts: [ChatMessagePartModel(text: "")],
              // expact user
            ),
          ]),
          throwsA(isA<ArgumentError>()),
        );
      });
      test("throw ArgumentError when  parts is empty  ", () {
        expect(
          () => chatServiceValidationMixinMocked.inputValidation([
            ChatMessageModel(
              parts: [],
              // expact user
            ),
          ]),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('outputValidation', () {
      test('throws ArgumentError when role is empty', () {
        final response = ChatMessageModel(parts: [ChatMessagePartModel(text: 'x')], role: "");
        expect(
          () => chatServiceValidationMixinMocked.outputValidation(response),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('throws ArgumentError when role is not model', () {
        final response = ChatMessageModel(parts: [ChatMessagePartModel(text: 'x')], role: 'user');
        expect(
          () => chatServiceValidationMixinMocked.outputValidation(response),
          throwsA(isA<ArgumentError>()),
        );
      });

      
    });
  });
}

class ChatServiceValidationMixinMocked with ChatServiceValidationMixin {}
