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
  const HomePageSuccess(this.news);
  final String news;
  @override
  List<Object> get props => [news];
}

class HomePageFailed extends HomePageState {
  @override
  List<Object> get props => [];
}