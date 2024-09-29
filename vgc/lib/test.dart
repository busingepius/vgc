import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  Future<Map<String, String>> getRandomPicture() async {
    final url = Uri.parse('https://coffee.alexflipnote.dev/random.json');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("no data returned");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  await getRandomPicture();
}
