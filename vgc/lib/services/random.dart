import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vgc/errors/custom_error.dart';

Future<Map<String, dynamic>> getRandomPicture(http.Client client) async {
  final url = Uri.parse('https://coffee.alexflipnote.dev/random.json');
  try {
    var response = await client.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw CustomError(message: "no data returned");
    }
  } catch (e) {
    throw CustomError(message: "$e");
  }
}
