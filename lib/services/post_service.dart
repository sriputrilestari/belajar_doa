import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apiflutter/models/post_models.dart';

class PostService {
  static const String postsUrl = 'http://jsonplaceholder.typicode.com/posts/';

  static Future<List<PostModel>> ListPost() async {
    final response = await http.get(Uri.parse(postsUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => PostModel.fromJson(item)).toList();
    } else {
      throw Exception('Gagal Load Data Album');
    }
  }
}
