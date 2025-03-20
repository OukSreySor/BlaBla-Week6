import 'dart:convert';
import '../model/post.dart';

class PostDTO {
  final int id;
  final String title;
  final String body;

  PostDTO({required this.id, required this.title, required this.body});

  factory PostDTO.fromJson(Map<String, dynamic> json) {
    return PostDTO(
      id: json['id'], 
      title: json['title'], 
      body: json['body']
    );
  }

  Post toPost() {
    return Post(
      id: id, 
      title: title, 
      description: body
    );
  }

  // Convert list of JSON to list of Posts
  static List<Post> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => PostDTO.fromJson(json).toPost()).toList();
  }
}
