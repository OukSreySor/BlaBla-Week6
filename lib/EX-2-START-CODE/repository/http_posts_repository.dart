import 'dart:convert';
import 'package:blabla_week6/EX-2-START-CODE/model/post.dart';
import 'package:blabla_week6/EX-2-START-CODE/repository/post_repository.dart';
import 'package:http/http.dart' as http;


class HttpPostsRepository extends PostRepository{

  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  @override
  Future<List<Post>> getPosts() async {
    try{
      final response = await http.get(Uri.parse(_baseUrl));  // Send a GET request to the API to fetch posts

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
  // Convert each JSON object to a Post 
  Post fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'], 
      title: json['title'], 
      description: json['body']
    );
  }
  
}