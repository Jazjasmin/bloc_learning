part of 'home_page_bloc.dart';

abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDots extends HomePageEvent {
  final int index;

  HomePageDots(this.index);
  
}
class HomePageCourseItem extends HomePageEvent {
  final int index;

  HomePageCourseItem(this.index);
  
}
