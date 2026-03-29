import 'package:chat_bot/feature/chat/presentation/view/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ChatRebot {
  WidgetTester tester;

  ChatRebot({required this.tester});
  Future<void> runApp() async {
    await tester.pumpWidget(MaterialApp(home: ChatView()));
    await tester.pumpAndSettle();
  }
  Future<void> enterText({required String text}) async {
    var inputFieldKey = find.byKey(Key("text_field_send_messages"));
    await tester.enterText(inputFieldKey, text);
    await tester.pumpAndSettle();
    
  }
  Future<void> tapSendButton() async {
    var sendBotton = find.byIcon(Icons.send);
    await tester.tap(sendBotton);
    await tester.pump();
  }
}