import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print("Api call is suucced");
      return jsonResponse.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

class User {
  final int userid;
  final int id;
  final String title;
  final String body;

  User(
      {required this.userid,
      required this.id,
      required this.title,
      required this.body});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userid: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
