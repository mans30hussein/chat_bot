import 'package:chat_bot/core/network/api_client.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';

void main() {
  late MockedApiClient mockedApiClient;
  late ChatApiService chatApiService;

  setUp(() {
    mockedApiClient = MockedApiClient();
    chatApiService = ChatApiService(mockedApiClient);
  });

  group("check retry logic excute 3 times  ", () {
     test('should retry 3 times on connection timeout', () async {
  int callCount = 0;

  when(() => mockedApiClient.post(
    urlEndPoint: any(named: 'urlEndPoint'),
    data: any(named: 'data'),
    queryParameters: any(named: 'queryParameters'),
  )).thenAnswer((_) async {
    callCount++;
    throw DioException(
      type: DioExceptionType.connectionTimeout ,
      requestOptions: RequestOptions(path: ''),
    );
  });

  try {
    await chatApiService.sendMessages(messages: [
      ChatMessageModel.fromUserMessage('Hello')
    ]);
  } catch (_) {}

  expect(callCount, 3);
    verify(() => mockedApiClient.post(
        urlEndPoint: any(named: 'urlEndPoint'),
        data: any(named: 'data'),
      )).called(3);  
});

   

  
test('should not retry on badResponse error', () async {

  when(() => mockedApiClient.post(
        urlEndPoint: any(named: 'urlEndPoint'),
        data: any(named: 'data'),
      )).thenThrow(
    DioException(
      type: DioExceptionType.badResponse,
      requestOptions: RequestOptions(path: ''),
    ),
  );

  expect(
    () => chatApiService.sendMessages(
      messages: [ChatMessageModel.fromUserMessage("hi")],
    ),
    throwsA(isA<DioException>()),
  );

  verify(() => mockedApiClient.post(
        urlEndPoint: any(named: 'urlEndPoint'),
        data: any(named: 'data'),
      )).called(1);  
});
  });
}

class MockedApiClient extends Mock implements ApiClient {}
