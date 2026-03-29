import 'package:chat_bot/core/service_locator/service_locator.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:chat_bot/feature/chat/domain/chat_repo/chat_repo.dart';
 import 'package:chat_bot/feature/chat/presentation/widget/error_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/my_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/typing_indicator_bubble.dart';
import 'package:chat_bot/feature/chat/presentation/widget/user_chat_message.dart';
 import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:integration_test/integration_test.dart';

import 'chat_rebot.dart';
// import 'package:chat_bot/main.dart' as app;
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late ChatRepoMocked chatRepoMocked;

  setUp(() async {
    await getIt.reset();
    await setupServiceLocator();
    // Unregister and register the correct (real) type, not the mocked one
    // Otherwise, the app will request ChatRepo and getIt won't resolve ChatRepoMocked for ChatRepo
    if (getIt.isRegistered<ChatRepo>()) {
      getIt.unregister<ChatRepo>();
    }
    chatRepoMocked = ChatRepoMocked();
    getIt.registerLazySingleton<ChatRepo>(() => chatRepoMocked);
  });
  group('ChatView Integration Test', () {
    late ChatRebot chatRebot;

    testWidgets('Send Message and show loading bubble widget', (tester) async {
      chatRebot = ChatRebot(tester: tester);

      when(
        () => chatRepoMocked.sendMessages(messages: any(named: "messages")),
      ).thenAnswer((_) {
        return Future.delayed(Duration(seconds: 3), () {
          return ChatMessageModel(
            parts: [ChatMessagePartModel(text: "Response")], // output
            role: "model",
          );
        });
      });
      // Start app
      await chatRebot.runApp();
      await chatRebot.enterText(text: "Hello");
      await chatRebot.tapSendButton();

      expect(find.byType(MyChatMessage), findsOneWidget);
      expect(find.byType(TypingIndicatorBubble), findsOneWidget);
    });

    testWidgets('Send Message and recieve response', (tester) async {
      when(
        () => chatRepoMocked.sendMessages(messages: any(named: "messages")),
      ).thenAnswer((_) {
        return Future.delayed(Duration(seconds: 3), () {
          return ChatMessageModel(
            parts: [ChatMessagePartModel(text: "Response")],
            role: "model",
          );
        });
      });
      // Start app
      await chatRebot.runApp();
      await chatRebot.enterText(text: "Hello");
      await chatRebot.tapSendButton();

      expect(
        find.descendant(
          of: find.byType(MyChatMessage),
          matching: find.text("Hello"),
        ),
        findsOneWidget,
      );

      // expect(find.byType(TypingIndicatorBubble).last, findsOneWidget);

      expect(
        find.descendant(
          of: find.byType(UserChatMessage),
          matching: find.text("Response"),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Send Message and receive Failure', (tester) async {
      when(
        () => chatRepoMocked.sendMessages(messages: any(named: "messages")),
      ).thenAnswer((_) {
        // Simulate a short delay, then throw
        return Future.delayed(
          const Duration(seconds: 1),
          () => throw Exception(),
        );
      });

      await chatRebot.runApp();
      await chatRebot.enterText(text: "Hello");
      await chatRebot.tapSendButton();
      await tester.pump(
        const Duration(seconds: 1),
      );
      await tester.pumpAndSettle();

      // expect(
      //   find.descendant(
      //     of: find.byType(MyChatMessage),
      //     matching: find.text("Hello"),
      //   ),
      //   findsOneWidget,
      // );

      // Verify that ChatMessageError appears and displays the failed message text
      expect(
        find.descendant(
          of: find.byType(ChatMessageError),
          matching: find.text("Hello"),
        ),
        findsOneWidget,
      );
    });
  });
}

class ChatRepoMocked extends Mock implements ChatRepo {}
