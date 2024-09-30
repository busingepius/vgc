import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;

import '../errors/errors.dart';

const String folderName = "vgc";

Future<String> getFolderPath() async {
  try {
    final documentsDir = await getApplicationDocumentsDirectory();
    final folderPath = p.join(documentsDir.path, folderName);
    final folder = Directory(folderPath);
    if (!await folder.exists()) {
      await folder.create(recursive: true);
    }
    return folderPath;
  } catch (e) {
    throw CustomError(message: "$e");
  }
}

Future<void> writeData(String url) async {
  try {
    var response = await http.get(Uri.parse(url));
    final folderPath = await getFolderPath();
    final filePath = p.join(folderPath, p.basename(url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
  } catch (e) {
    throw CustomError(message: "$e");
  }
}

Future<List<Map<String, String>>> readAllFiles() async {
  final folderPath = await getFolderPath();
  final folder = Directory(folderPath);
  List<Map<String, String>> fileContents = [];

  try {
    await for (FileSystemEntity entity in folder.list()) {
      if (entity is File) {
        String filePath = entity.path;
        fileContents.add({'filePath': filePath});
      }
    }
    return fileContents;
  } catch (e) {
    throw CustomError(message: "$e");
  }
}
