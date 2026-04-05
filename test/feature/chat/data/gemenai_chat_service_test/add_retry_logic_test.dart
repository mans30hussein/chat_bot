import 'package:chat_bot/core/network/api_client.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';

class MockedApiClient extends Mock implements ApiClient {}

void main() {
  late MockedApiClient mockedApiClient;
  late ChatApiService chatApiService;

  setUp(() {
    mockedApiClient = MockedApiClient();
    chatApiService = ChatApiService(mockedApiClient, retryDelay: Duration.zero);
  });

  final successResponse = {
    'candidates': [
      {
        'content': {
          'parts': [
            {'text': 'Hi there'},
          ],
          'role': 'model',
        },
      },
    ],
  };

  group("ChatApiService Retry Logic Tests", () {
    test("should retry 3 times and then throw if all attempts fail", () async {
      when(
        () => mockedApiClient.post(
          urlEndPoint: any(named: 'urlEndPoint'),
          data: any(named: 'data'),
        ),
      ).thenAnswer((_) async {
        throw Exception('Network Error');
      });

      await expectLater(
        () async => await chatApiService.sendMessages(messages: []),
        throwsA(isA<Exception>()),
      );

      verify(
        () => mockedApiClient.post(
          urlEndPoint: any(named: 'urlEndPoint'),
          data: any(named: 'data'),
        ),
      ).called(3);
    });

    test("should succeed on the second attempt", () async {
      var count = 0;
      when(
        () => mockedApiClient.post(
          urlEndPoint: any(named: 'urlEndPoint'),
          data: any(named: 'data'),
        ),
      ).thenAnswer((_) async {
        if (count == 1) {
          return Response(
            data: successResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          );
        }
        count++;
        throw Exception('Network Error');
      });

      final result = await chatApiService.sendMessages(messages: []);

      expect(result, isA<ChatMessageModel>());
      expect(result.text, 'Hi there');
      verify(
        () => mockedApiClient.post(
          urlEndPoint: any(named: 'urlEndPoint'),
          data: any(named: 'data'),
        ),
      ).called(2);
    });

    test("should succeed on the third attempt", () async {
      var count = 0;
      when(
        () => mockedApiClient.post(
          urlEndPoint: any(named: 'urlEndPoint'),
          data: any(named: 'data'),
        ),
      ).thenAnswer((_) async {
        if (count == 2) {
          return Response(
            data: successResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          );
        }
        count++;
        throw Exception('Network Error');
      });

      final result = await chatApiService.sendMessages(messages: []);

      expect(result, isA<ChatMessageModel>());
      expect(result.text, 'Hi there');
      verify(
        () => mockedApiClient.post(
          urlEndPoint: any(named: 'urlEndPoint'),
          data: any(named: 'data'),
        ),
      ).called(3);
    });
  });
}
