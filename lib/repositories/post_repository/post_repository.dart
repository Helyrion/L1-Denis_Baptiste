import 'dart:async';

import 'post_model.dart';

abstract class PostsRepository {
  Future<void> addNewPost(Post post);

  Future<void> deletePost(Post post);

  Stream<List<Post>> posts();

  Future<void> updatePost(Post post);
}
