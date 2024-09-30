import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:vgc/errors/errors.dart';
import 'package:vgc/services/services.dart';

class MockClient extends Mock implements http.Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  late MockClient mockClient;

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  setUp(() {
    mockClient = MockClient();
  });

  group('getRandomPicture', () {
    test(
        'returns a valid picture data when the http call is successful (status 200)',
        () async {
      const String mockResponse = '{"file": "https://example.com/picture.jpg"}';
      when(() => mockClient.get(any()))
          .thenAnswer((_) async => http.Response(mockResponse, 200));

      final result = await getRandomPicture(mockClient);

      expect(result, isA<Map<String, dynamic>>());
      expect(result['file'], 'https://example.com/picture.jpg');
    });

    test('throws CustomError when the http call returns a non-200 status code',
        () async {
      when(() => mockClient.get(any()))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => getRandomPicture(mockClient), throwsA(isA<CustomError>()));
    });

    test('throws CustomError when the http call throws an exception', () async {
      when(() => mockClient.get(any()))
          .thenThrow(Exception('Failed to load data'));

      expect(() => getRandomPicture(mockClient), throwsA(isA<CustomError>()));
    });
  });
}
