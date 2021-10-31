import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_cine_list/repositories/post_repository/post_model.dart';
import 'package:my_cine_list/repositories/post_repository/firebase_post.dart';
import 'package:my_cine_list/repositories/post_repository/post_repository.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class PostsBloc extends Bloc<PostsEvent, HomePageState> {
  PostsBloc({required PostsRepository postsRepository})
      : _postsRepository = postsRepository,
        super(HomePageInitial()) {
    on<LoadPosts>(_onLoadPosts);
    on<AddPost>(_onAddPost);
    on<UpdatePost>(_onUpdatePost);
    on<DeletePost>(_onDeletePost);
    on<PostsUpdated>(_onPostsUpdated);
  }

  final PostsRepository _postsRepository;

  Future<void> _onLoadPosts(LoadPosts event, Emitter<HomePageState> emit) {
    return emit.onEach<List<Post>>(
      _postsRepository.posts(),
      onData: (posts) => add(PostsUpdated(posts)),
    );
  }

  void _onAddPost(AddPost event, Emitter<HomePageState> emit) {
    _postsRepository.addNewPost(event.post);
  }

  void _onUpdatePost(UpdatePost event, Emitter<HomePageState> emit) {
    _postsRepository.updatePost(event.updatedPost);
  }

  void _onDeletePost(DeletePost event, Emitter<HomePageState> emit) {
    _postsRepository.deletePost(event.post);
  }

  void _onPostsUpdated(PostsUpdated event, Emitter<HomePageState> emit) {
    emit(HomePageSuccess(event.posts));
  }
}
