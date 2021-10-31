import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'post_entity.dart';
import 'post_repository.dart';
import 'post_model.dart';

class FirebasePostsRepository implements PostsRepository {
  final postCollection = FirebaseFirestore.instance.collection('posts');

  @override
  Future<void> addNewPost(Post post) {
    return postCollection.add(post.toEntity().toDocument());
  }

  @override
  Future<void> deletePost(Post post) async {
    return postCollection.doc(post.id).delete();
  }

  @override
  Stream<List<Post>> posts() {
    return postCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Post.fromEntity(PostEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updatePost(Post update) {
    return postCollection.doc(update.id).update(update.toEntity().toDocument());
  }
}
