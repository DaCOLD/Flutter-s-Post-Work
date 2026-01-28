import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class ApiService {
  static const String getUrl =
      'https://jsonplaceholder.typicode.com/posts/1';

  static const String postUrl =
      'https://jsonplaceholder.typicode.com/posts';

  static Future<Post> fetchPost() async {
    final response = await http.get(Uri.parse(getUrl));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<Post> createPost(String title, String body) async {
    final response = await http.post(
      Uri.parse(postUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': title,
        'body': body,
        'userId': 1,
      }),
    );

    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }
}
