import 'package:flutter/material.dart';

import '../../model/post.dart';
import '../../repository/post_repository.dart';
import 'async_value.dart';

class PostProvider extends ChangeNotifier {
  final PostRepository _repository;

  // change to list
  AsyncValue<List<Post>>? postValue;

  PostProvider({required PostRepository repository}) : _repository = repository;

  void fetchPost() async {
    // 1-  Set loading state
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2   Fetch the data
      List<Post> posts = await _repository.getPosts();

      // 3  Set success state
      postValue = AsyncValue.success(posts);
    } catch (error) {
      // 4  Set error state
      postValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}
