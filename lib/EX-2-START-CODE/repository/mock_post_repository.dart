import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<List<Post>> getPosts() {
    return Future.delayed(Duration(seconds: 5), () {
      return [
        Post(id: 1, title: 'Mock Post 1', description: 'This is the body of post 1'),
        Post(id: 2, title: 'Mock Post 2', description: 'This is the body of post 2'),
      ];
    
      }
    );
  }
  
}
