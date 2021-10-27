import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial());
  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is HomePageGetData) {
    yield const HomePageSuccess('test');
    }
  }

}
