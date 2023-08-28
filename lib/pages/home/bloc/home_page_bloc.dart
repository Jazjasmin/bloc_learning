import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePageDots>(_homePageDots);
    on<HomePageCourseItem>(_homePageCourseItem);
  }

void _homePageDots(HomePageDots event, Emitter<HomePageState> emit) {
   emit(state.CopyWith(index: event.index));
  }
}

void _homePageCourseItem(HomePageCourseItem event,Emitter<HomePageState> emit){
  //emit(state.CopyWith(courseItem: event.index));
}
