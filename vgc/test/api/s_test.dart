import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart'; // For WidgetsFlutterBinding
import 'package:vgc/services/storage.dart';
import 'package:vgc/errors/errors.dart';

// Mock classes
class MockDirectory extends Mock implements Directory {}

class MockFile extends Mock implements File {}

class MockHttpClient extends Mock implements http.Client {}

class MockHttpResponse extends Mock implements http.Response {}

class MockPathProvider extends Mock implements Directory {}

const String folderName = "vgc";

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(Uri());
  });

  // group('getFolderPath', () {
  //   test(
  //       'should return the folder path and create the folder if it does not exist',
  //       () async {
  //     // Arrange
  //     final mockDirectory = MockDirectory();
  //     final tempDir = Directory.systemTemp.createTempSync();
  //     when(() => getApplicationDocumentsDirectory())
  //         .thenAnswer((_) async => tempDir);

  //     // Act
  //     final result = await getFolderPath();

  //     // Assert
  //     expect(result, p.join(tempDir.path, folderName));
  //     verify(() => mockDirectory.create(recursive: true)).called(1);
  //   });

  //   test('should throw a CustomError when an exception occurs', () async {
  //     // Arrange
  //     when(() => getApplicationDocumentsDirectory())
  //         .thenThrow(Exception('Directory error'));

  //     // Act & Assert
  //     expect(() async => await getFolderPath(), throwsA(isA<CustomError>()));
  //   });
  // });

  group('writeData', () {
    late MockHttpClient mockHttpClient;
    late MockHttpResponse mockResponse;
    late MockFile mockFile;

    setUp(() {
      mockHttpClient = MockHttpClient();
      mockResponse = MockHttpResponse();
      mockFile = MockFile();
    });

    test('should write data to a file successfully', () async {
      // Arrange
      final tempDir = Directory.systemTemp.createTempSync();
      when(() => getApplicationDocumentsDirectory())
          .thenAnswer((_) async => tempDir);
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => mockResponse);

      when(() => mockResponse.bodyBytes)
          .thenReturn(Uint8List.fromList([1, 2, 3]));

      when(() => mockFile.writeAsBytes(any()))
          .thenAnswer((_) async => mockFile);

      // Act
      await writeData('https://example.com/image.png');

      // Assert
      verify(() =>
              mockHttpClient.get(Uri.parse('https://example.com/image.png')))
          .called(1);
      verify(() => mockFile.writeAsBytes([1, 2, 3])).called(1);
    });

    test('should throw a CustomError when an exception occurs', () async {
      // Arrange
      when(() => mockHttpClient.get(any()))
          .thenThrow(Exception('Network error'));

      // Act & Assert
      expect(() async => await writeData('https://example.com/image.png'),
          throwsA(isA<CustomError>()));
    });
  });

  // group('readAllFiles', () {
  //   test('should return all file paths in the directory', () async {
  //     // Arrange
  //     final mockDirectory = MockDirectory();
  //     final tempDir = Directory.systemTemp.createTempSync();
  //     when(() => getApplicationDocumentsDirectory())
  //         .thenAnswer((_) async => tempDir);
  //     final file1 = File(p.join(tempDir.path, 'file1.png'))..createSync();
  //     final file2 = File(p.join(tempDir.path, 'file2.png'))..createSync();

  //     // Act
  //     final result = await readAllFiles();

  //     // Assert
  //     expect(result, [
  //       {'filePath': file1.path},
  //       {'filePath': file2.path},
  //     ]);
  //   });

  //   test('should throw a CustomError when an exception occurs', () async {
  //     // Arrange
  //     when(() => getApplicationDocumentsDirectory())
  //         .thenThrow(Exception('Directory error'));

  //     // Act & Assert
  //     expect(() async => await readAllFiles(), throwsA(isA<CustomError>()));
  //   });
  // });
}
