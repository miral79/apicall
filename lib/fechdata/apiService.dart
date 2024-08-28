import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'https://linkedin-data-api.p.rapidapi.com/search-people-by-url';

  Future<dynamic> searchPeopleByUrl(String url) async {
    final headers = {
      'x-rapidapi-key': '771d00d952msh5db964d406dfbdap18c781jsn8956988a60b8',
      'x-rapidapi-host': 'linkedin-data-api.p.rapidapi.com',
      'Content-Type': 'application/json',
    };

    final parameters = {
      'url': url,
    };

    final body = jsonEncode(parameters);

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
      body: body,
    );

    print("response === == $response");

    if (response.statusCode == 200) {
      print('API call succeeded');
      return jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}');
      throw Exception('Failed to search people by URL');
    }
  }
}
