import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
// import 'package:path/path.dart' as p;
import 'package:vgc/errors/errors.dart';
import 'package:vgc/services/storage.dart';

class MockPathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    throw Exception('Failed to retrieve documents directory');
  }
}

class MockDirectory extends Mock implements Directory {}

class FakePathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    return Directory.systemTemp.path;
  }
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProviderPlatform();
  });

  test('create folder if it doesn\'t exist', () async {
    final folderPath = await getFolderPath();
    expect(folderPath, isNotNull);
    expect(Directory(folderPath).existsSync(), true);
  });

  test('throws CustomError if getApplicationDocumentsDirectory fails',
      () async {
    PathProviderPlatform.instance = MockPathProviderPlatform();

    try {
      await getFolderPath();
      fail('Expected CustomError to be thrown');
    } catch (e) {
      expect(e, isA<CustomError>());
      expect((e as CustomError).message,
          contains('Failed to retrieve documents directory'));
    }
  });


  test('throws CustomError if folder creation fails', () async {
    final mockDirectory = MockDirectory();
    when(() => mockDirectory.exists()).thenAnswer((_) async => false);
    when(() => mockDirectory.create(recursive: true))
        .thenThrow(Exception('Folder creation failed'));

    PathProviderPlatform.instance = FakePathProviderPlatform();

    try {
      await getFolderPath();
      throw CustomError(message: "An error occurred");
    } catch (e) {
      expect(e, isA<CustomError>());
      expect((e as CustomError).message, "An error occurred");
    }
  });

}
