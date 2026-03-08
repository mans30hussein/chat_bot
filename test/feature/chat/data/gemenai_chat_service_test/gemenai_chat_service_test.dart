import 'package:chat_bot/core/network/api_client.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart' show ChatMessageModel, ChatMessagePartModel;
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
  final messages = ChatMessageModel(parts: [ChatMessagePartModel(text: 'Hi there')], role: 'model');
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

  group("Test Retry Logic", () {
    test(
      "fails all 3 attempts — throws last exception and post called exactly 3 attempts",
      () async {
        when(
          () => mockedApiClient.post(
            urlEndPoint: any(named: 'urlEndPoint'),
            data: any(named: 'data'),
          ),
        ).thenAnswer((_) async {
          throw Exception();
        });
        await expectLater(
          () async => await chatApiService.sendMessages(messages: []),
          throwsException,
        );
        verify(
          () => mockedApiClient.post(
            urlEndPoint: any(named: 'urlEndPoint'),
            data: any(named: 'data'),
          ),
        ).called(3);
      },
    );
    test("succed on Third attempt", () async {
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
       
        throw Exception();
      });
      var result = await chatApiService.sendMessages(messages: []);

      expect(result, isA<ChatMessageModel>());
      verify(
        () => mockedApiClient.post(
          urlEndPoint: any(named: 'urlEndPoint'),
          data: any(named: 'data'),
        ),
      ).called(3);
    });
    test("succed on two attempt", () async {
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
       
        throw Exception();
      });
      var result = await chatApiService.sendMessages(messages: []);

      expect(result, isA<ChatMessageModel>());
      verify(
        () => mockedApiClient.post(
          urlEndPoint: any(named: 'urlEndPoint'),
          data: any(named: 'data'),
        ),
      ).called(2);
    });
     test("succed on first attempt", () async {
      var count = 0;
      when(
        () => mockedApiClient.post(
          urlEndPoint: any(named: 'urlEndPoint'),
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async {
       
          return Response(
            data: successResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          );
        });
      var result = await chatApiService.sendMessages(messages: []);

      expect(result, isA<ChatMessageModel>());
      verify(
        () => mockedApiClient.post(
          urlEndPoint: any(named: 'urlEndPoint'),
          data: any(named: 'data'),
        ),
      ).called(1);
    });
  });
}

class MockedApiClient extends Mock implements ApiClient {}
