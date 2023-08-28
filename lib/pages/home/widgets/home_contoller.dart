import 'package:bloc_leaning_pjct/common/entities/entities.dart';
import 'package:bloc_leaning_pjct/pages/home/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global.dart';

class HomeController {
  final BuildContext context;
  UserItem userProfile = Global.storageService.getUserProfile();


  HomeController({required this.context});

  Future<void> init() async {
    //make sure that user is logged in and then make an api call
    if(Global.storageService.getUserToken().isNotEmpty) {
    var result = await CourseAPI.courseList();
    if(result.code==200){
      context.read<HomePageBloc>().add(HomePageCourseItem(result.data!));
    }else {
      print(result.code);
    }
  }else {
    print("user has already logged out");
  }
  }
}