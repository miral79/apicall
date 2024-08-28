import 'dart:convert';

import 'package:http/http.dart' as http;

class Apicall {
  Future<dynamic> ApifetchData() async {
    final headers = {
      "x-rapidapi-key": "771d00d952msh5db964d406dfbdap18c781jsn8956988a60b8",
      "x-rapidapi-host": "vanitysoft-boundaries-io-v1.p.rapidapi.com"
    };

    final url = Uri.parse(
        "https://vanitysoft-boundaries-io-v1.p.rapidapi.com/rest/v1/public/boundary/censustract/within?latitude=37.5053796&longitude=-77.5550683");
    final response = await http.get(url, headers: headers);
    try {
      if (response == 200) {
        print('Response Data : ${response.body}');
        final data = jsonDecode(response.body);
        print('Data : ${data}');
        return data;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        print('Response Body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception occurred: $e');
      throw Exception('Failed to fetch data');
    }
  }
}
