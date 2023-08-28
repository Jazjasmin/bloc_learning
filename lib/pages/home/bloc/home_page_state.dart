part of 'home_page_bloc.dart';

class HomePageState {
  const HomePageState({
    this.index = 0
  });
  final int index;
  HomePageState CopyWith({int? index}) {
    return HomePageState(
      index: index??this.index
    );
  }
}

