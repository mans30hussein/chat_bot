import 'package:chat_bot/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'counter_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
// Note: Naming the generated mock `MockHttpClient` to avoid confusion with
// `MockClient` from `package:http/testing.dart`.
@GenerateMocks([], customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {
  group('fetchAlbum', () {
    final client = MockHttpClient();

    test('returns an Album if the http call completes successfully', () async {
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(
        client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')),
      ).thenAnswer(
        (_) async =>
            http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200),
      );

      expect(
        await fetchAlbum(client),
        isA<Album>().having((album) => album.title, 'title', 'mock'),
      );
    });
    test('throws an exception if the http call completes with an error', () {

      when(
        client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(client), throwsException);
    });
  });
}
