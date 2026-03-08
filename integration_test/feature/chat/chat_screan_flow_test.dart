import 'package:chat_bot/core/service_locator/service_locator.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:chat_bot/feature/chat/domain/chat_repo/chat_repo.dart';
import 'package:chat_bot/feature/chat/presentation/view/chat_view.dart';
import 'package:chat_bot/feature/chat/presentation/widget/my_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/typing_indicator_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:integration_test/integration_test.dart';
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
    testWidgets('Send Message and show loading bubble widget', (tester) async {
      when(
        () => chatRepoMocked.sendMessages(messages: any(named: "messages")),
      ).thenAnswer((_) {
        return Future.delayed(Duration(seconds: 3), () {
          return ChatMessageModel(
            parts: [ChatMessagePartModel(text: "Hello")],
            role: "model",
          );
        });
      });
      // Start app
     await tester.pumpWidget(MaterialApp(home: ChatView()));
      await tester.pumpAndSettle();

      var inputFieldKey = find.byKey(Key("text_field_send_messages"));
      await tester.enterText(inputFieldKey, "Hello");
      await tester.pumpAndSettle();
      var sendBotton = find.byIcon(Icons.send);
      await tester.tap(sendBotton);
      await tester.pump();
      expect(find.byType(MyChatMessage), findsOneWidget);
      expect(find.byType(TypingIndicatorBubble), findsOneWidget);
    });
  });
}

class ChatRepoMocked extends Mock implements ChatRepo {}
