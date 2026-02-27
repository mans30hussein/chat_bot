import 'package:chat_bot/core/network/api_client.dart';
import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late ChatApiService chatApiService;
  late MockedApiClient mockedApiClient;

  setUp(() {
    mockedApiClient = MockedApiClient();
    chatApiService = ChatApiService(mockedApiClient);
  });

  
}
class MockedApiClient extends Mock implements ApiClient {}