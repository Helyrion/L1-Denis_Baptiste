part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageInitial extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageLoading extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageSuccess extends HomePageState {
  final List<Post> posts;

  const HomePageSuccess([this.posts = const []]);

  @override
  List<Object> get props => [posts];

  @override
  String toString() => 'HomePageSuccess { posts: $posts }';
}

class HomePageFailed extends HomePageState {
  @override
  List<Object> get props => [];
}
